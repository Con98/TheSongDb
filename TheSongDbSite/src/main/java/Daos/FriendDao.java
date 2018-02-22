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

            UserDao userDao = new UserDao("MyName");
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

}
