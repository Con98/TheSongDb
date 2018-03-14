/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import static Daos.Dao.freeConnection;
import Dtos.FriendRequest;
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
public class FriendRequestDao extends Dao implements FriendRequestDaoInterface{
    
    public FriendRequestDao(String databaseName) {
        super(databaseName);
    }

    public FriendRequestDao(String databaseName, String poolName) {
        super(databaseName, poolName);
    }
    
    @Override
    public ArrayList<FriendRequest> displayAllFriendRequests(String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<FriendRequest> friendRequests = new ArrayList<>();
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

                FriendRequest fr = new FriendRequest(user, userFriend);
                friendRequests.add(fr);
            }
        } catch (SQLException ex) {
            System.err.println("\tA problem occurred during the displayAllFriendRequests method:");
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
        return friendRequests;
    }
    
    @Override
    public int addFriendship(String username1, String username2) {
        Connection con = null;
        PreparedStatement ps = null;
        int rowsAffected = 0;

        try {
            con = this.getConnection();

            String query = "INSERT INTO friendRequest(friend1, friend2) VALUES (?, ?)";
            ps = con.prepareStatement(query);
            ps.setString(1, username1);
            ps.setString(2, username2);

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
    
    @Override
    public int checkFriendRequest(String username1, String username2){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int rowsAffected = 0;
        
        try {
            con = this.getConnection();

            String query = "SELECT * FROM friendRequest WHERE (friend1 = ? AND friend2 = ?) OR (friend1 = ? AND friend2 = ?)";

            ps = con.prepareStatement(query);
            ps.setString(1, username1);
            ps.setString(2, username2);
            ps.setString(3, username2);
            ps.setString(4, username1);

            rs = ps.executeQuery();} catch (SQLException ex) {
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
     * @param username2
     * @return
     * */
    @Override
    public boolean denyFriendship(String username1, String username2) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean removed = false;

        try {
            con = this.getConnection();

            String query = "DELETE FROM friendRequest WHERE (friend1 = ? AND friend2 = ?) OR (friend1 = ? AND friend2 = ?)";
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
            System.err.println("\tA problem occurred during the denyFriendship method:");
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
                System.err.println("A problem occurred during closing down the denyFriendship method:\n" + ex.getMessage());
            }
        }
        return removed;
    }
}
