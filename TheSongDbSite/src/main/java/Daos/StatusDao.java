/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

/**
 *
 * @author Thomas
 */
import static Daos.Dao.freeConnection;
import Dtos.Status;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class StatusDao extends Dao implements StatusDaoInterface {

    public StatusDao(String databaseName) {
        super(databaseName);
    }

    public StatusDao(String databaseName, String poolName) {
        super(databaseName, poolName);
    }

    public static String encrypt(String key, String initVector, String value) {
        try {
            IvParameterSpec iv = new IvParameterSpec(initVector.getBytes("UTF-8"));
            SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");

            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);

            byte[] encrypted = cipher.doFinal(value.getBytes());

            return Base64.encodeBase64String(encrypted);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public static String decrypt(String key, String initVector, String encrypted) {
        try {
            IvParameterSpec iv = new IvParameterSpec(initVector.getBytes("UTF-8"));
            SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");

            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);

            byte[] original = cipher.doFinal(Base64.decodeBase64(encrypted));

            return new String(original);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return null;
    }

    @Override
    public boolean sendStatus(String userId, String statusContent) {
        Connection con = null;
        PreparedStatement ps = null;
        int rs = 0;
        boolean succeeded = false;
        try {
            con = this.getConnection();
            String query = "INSERT INTO `status`(`statusId`, `userId`, `statusContent`) VALUES (null,?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1, userId);
            ps.setString(2, statusContent);

            rs = ps.executeUpdate();
            if (rs == 1) {
                succeeded = true;
            }
        } catch (SQLException ex) {
            System.err.println("\tA problem occurred during the sendStatus method:");
            System.err.println("\t" + ex.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the sendStatus method:\n" + e.getMessage());
            }
        }
        return succeeded;
    }

    @Override
    public ArrayList<Status> displayOwnStatuses(int userLoggedIn) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Status> statuses = new ArrayList<>();
        try {
            con = this.getConnection();

            String query = "SELECT * FROM status WHERE userId = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, userLoggedIn);

            rs = ps.executeQuery();
            while (rs.next()) {
                int statusId = rs.getInt("statusId");
                int userId = rs.getInt("userId");
                String sentOn = rs.getString("sentOn");
                String statusContent = rs.getString("statusContent");

                Status s = new Status(statusId, userId, sentOn, statusContent);
                statuses.add(s);
            }
        } catch (SQLException ex) {
            System.err.println("\tA problem occurred during the displayOwnStatuses method:");
            System.err.println("\t" + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the displayOwnStatuses method:\n" + e.getMessage());
            }
        }
        return statuses;
    }

    @Override
    public ArrayList<Status> displayStatuses(int userLoggedIn) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        FriendDao friendDao = new FriendDao("TheSongDb", "jdbc/TheSongDb");
        UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
        ArrayList<Status> allStatuses = new ArrayList<>();
        ArrayList<Status> statuses = new ArrayList<>();
        try {
            con = this.getConnection();

            String query = "SELECT * FROM status";
            ps = con.prepareStatement(query);

            rs = ps.executeQuery();
            while (rs.next()) {
                int statusId = rs.getInt("statusId");
                int userId = rs.getInt("userId");
                String sentOn = rs.getString("sentOn");
                String statusContent = rs.getString("statusContent");
                Status s = new Status(statusId, userId, sentOn, statusContent);
                allStatuses.add(s);
            }
            if (!allStatuses.isEmpty()) {
                for (Status s : allStatuses) {
                    if (userLoggedIn == s.getUserId() || friendDao.checkIfFriends(userDao.getDetailsById(s.getUserId()).getUserName(), userDao.getDetailsById(userLoggedIn).getUserName())) {
                        statuses.add(s);
                    }
                }
            }
        } catch (SQLException ex) {
            System.err.println("\tA problem occurred during the displayStatuses method:");
            System.err.println("\t" + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the displayStatuses method:\n" + e.getMessage());
            }
        }
        return statuses;
    }

    @Override
    public Status findStatusById(String inputStatId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Status s = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM status WHERE statusId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, inputStatId);

            rs = ps.executeQuery();
            while (rs.next()) {
                int statusId = rs.getInt("statusId");
                int userId = rs.getInt("userId");
                String sentOn = rs.getString("sentOn");
                String statusContent = rs.getString("statusContent");

                s = new Status(statusId, userId, sentOn, statusContent);
            }
        } catch (SQLException ex) {
            System.err.println("\tA problem occurred during the findStatusById method:");
            System.err.println("\t" + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the findStatusById method:\n" + e.getMessage());
            }
        }
        return s;
    }

    @Override
    public boolean deleteStatus(Status s) {
        Connection con = null;
        PreparedStatement ps = null;
        int rs = 0;
        boolean deleted = false;
        try {
            con = this.getConnection();

            String query = "DELETE FROM `status` WHERE `statusId` = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, s.getStatusId());

            rs = ps.executeUpdate();
            if (rs == 1) {
                deleted = true;
            }
        } catch (SQLException ex) {
            System.err.println("\tA problem occurred during the deleteStatus method:");
            System.err.println("\t" + ex.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the deleteStatus method:\n" + e.getMessage());
            }
        }
        return deleted;
    }

    public static void main(String[] args) {
    }
}
