/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Friend;
import Dtos.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author emmet
 */
public class FriendDao extends Dao implements FriendDaoInterface {

    public FriendDao(String databaseName) {
        super(databaseName);
    }

    public FriendDao(String databaseName, String poolName) {
        super(databaseName, poolName);
    }

    /**
     *
     * @param username
     * @return
     */
    @Override
    public ArrayList<Friend> displayAllFriends(String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Friend> friends = new ArrayList<>();
        try {
            con = this.getConnection();

            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            User user = userDao.findUserByUsername(username);

            String query = "SELECT * FROM friend WHERE friend1 = ? OR friend2 = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, username);

            rs = ps.executeQuery();
            while (rs.next()) {
                String friend = rs.getString("friend1");
                if (friend.equals(username)) {
                    friend = rs.getString("friend2");
                }
                User userFriend = userDao.findUserByUsername(friend);

                Friend f = new Friend(user, userFriend);
                friends.add(f);
            }
        } catch (SQLException ex) {
            System.err.println("\tA problem occurred during the displayAllFriends method:");
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
                System.err.println("A problem occurred when closing down the findFriendshipsByUsername method:\n" + e.getMessage());
            }
        }
        return friends;
    }    

    /**
     *
     * @param username1
     * @param username2
     * @return
     */
    @Override
    public boolean removeFriendship(String username1, String username2) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean removed = false;

        try {
            con = this.getConnection();

            String query = "DELETE FROM friend WHERE (friend1 = ? AND friend2 = ?) OR (friend1 = ? AND friend2 = ?)";
            ps = con.prepareStatement(query);
            ps.setString(1, username1);
            ps.setString(2, username2);
            ps.setString(3, username2);
            ps.setString(4, username1);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected != 0) {
                removed = true;
            }
        } catch (SQLException ex) {
            System.err.println("\tA problem occurred during the removeFriendship method:");
            System.err.println("\t" + ex.getMessage());
            removed = false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException ex) {
                System.err.println("A problem occurred during closing down the removeFriendship method:\n" + ex.getMessage());
            }
        }
        return removed;
    }

    @Override
    public int confirmFriendship(String username1, String username2) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int rowsAffected = 0;
        
        try {
            con = this.getConnection();

            String query1 = "INSERT INTO friend(friend1, friend2) VALUES (?, ?)";
            ps = con.prepareStatement(query1);
            ps.setString(1, username1);
            ps.setString(2, username2);

            rs = ps.executeQuery();
            rowsAffected = ps.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("\tA problem occurred during the addFriendship method:");
            System.err.println("\t" + ex.getMessage());
            rowsAffected = 0;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the addFriendship method:\n" + e.getMessage());
            }
        }
        return rowsAffected;
    }
    
    /**
     *
     * @param username1
     * @return
     */
    @Override
    public boolean removeUserFriends(String username1) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean removed = false;

        try {
            con = this.getConnection();

            String query = "DELETE FROM friend WHERE friend1 = ? OR friend2 = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username1);
            ps.setString(2, username1);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected != 0) {
                removed = true;
            }
        } catch (SQLException ex) {
            System.err.println("\tA problem occurred during the removeUserFriends method:");
            System.err.println("\t" + ex.getMessage());
            removed = false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException ex) {
                System.err.println("A problem occurred in closing down the removeUserFriends method: \n" + ex.getMessage());
            }
        }
        return removed;
    }

    /**
     *
     * @param username1
     * @param username2
     * @return
     */
    @Override
    public Friend checkFriendshipStatus(String username1, String username2) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Friend friends = null;

        try {
            con = this.getConnection();

            String query = "SELECT * FROM friend WHERE (friend1 = ? AND friend2 = ?) OR (friend1 = ? AND friend2 = ?)";

            ps = con.prepareStatement(query);
            ps.setString(1, username1);
            ps.setString(2, username2);
            ps.setString(3, username2);
            ps.setString(4, username1);

            rs = ps.executeQuery();

            if (rs.next()) {
                String uname1 = rs.getString("friend1");
                String uname2 = rs.getString("friend2");

                UserDao userDao = new UserDao("MyFriends");
                User friend1 = userDao.findUserByUsername(uname1);
                User friend2 = userDao.findUserByUsername(uname2);

                friends = new Friend(friend1, friend2);
            }
        } catch (SQLException ex) {
            System.err.println("\tA problem occurred during the checkFriendshipStatus method:");
            System.err.println("\t" + ex.getMessage());
            friends = null;
        } catch (NullPointerException ex) {
            System.err.println("\tA problem occurred during the checkFriendshipStatus method:");
            System.err.println("\t" + ex.getMessage());
            friends = null;
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
            } catch (SQLException ex) {
                System.err.println("A problem occurred when closing down the checkFriendshipStatus method:\n" + ex.getMessage());
            }
        }
        return friends; //may be null
    }
    
    @Override
    public boolean checkIfFriends(String username1, String username2) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean friends = false;

        try {
            con = this.getConnection();

            String query = "SELECT * FROM friend WHERE (friend1 = ? AND friend2 = ?) OR (friend1 = ? AND friend2 = ?)";

            ps = con.prepareStatement(query);
            ps.setString(1, username1);
            ps.setString(2, username2);
            ps.setString(3, username2);
            ps.setString(4, username1);

            rs = ps.executeQuery();

            if (rs.next()) {
                friends = true;
            }
        } catch (SQLException ex) {
            System.err.println("\tA problem occurred during the checkFriendshipStatus method:");
            System.err.println("\t" + ex.getMessage());
        } catch (NullPointerException ex) {
            System.err.println("\tA problem occurred during the checkFriendshipStatus method:");
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
            } catch (SQLException ex) {
                System.err.println("A problem occurred when closing down the checkFriendshipStatus method:\n" + ex.getMessage());
            }
        }
        return friends; //may be null
    }
    
    
}
