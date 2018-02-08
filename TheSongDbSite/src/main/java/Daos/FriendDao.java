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

    public ArrayList<Friend> listAllFriends(int userId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Friend> friends = new ArrayList<Friend>();

        try {
            conn = this.getConnection();
            
            UserDao userDao = new UserDao("Me");
            User user = userDao.getDetailsById(userId);

            String query = "SELECT * FROM friend WHERE userId1 = ? OR userId2 = ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, userId);

            rs = ps.executeQuery();
            while (rs.next()) {
                int friend = rs.getInt("friend1");
                if (friend == userId) {
                    friend = rs.getInt("friend2");
                }
                
                User userFriend = userDao.getDetailsById(friend);
               // Friend f = new Friend(id, user, userFriend);
               // friends.add(f);
               

            }
        } catch (SQLException ex) {
            System.err.println("\tA problem occured during the listAllFriends method:");
            System.err.println("\t" + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    freeConnection(conn);
                }
            } catch (SQLException ex) {
                System.err.println("A problem occurred when closing down the listAllFriends method:\n" + ex.getMessage());
            }
        }
        return friends;
    }
}
