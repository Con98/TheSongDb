/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import static Daos.Dao.freeConnection;
import Dtos.User;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InputMismatchException;

/**
 *
 * @author Thomas
 */
public class UserDao extends Dao implements UserDaoInterface {

    public UserDao(String databaseName) {
        super(databaseName);
    }
    
    public UserDao(String databaseName, String poolName){
        super(databaseName, poolName);
    }

    /**
     * Register new user
     *
     * Registration of new user when user is passed in as an object and added to
     * database. User number is set by database - auto-incremented for new user.
     * Password is stored as a hash - MD5 algorithm is used. Default user type
     * is normal user (userType = false) - set automatically in database.
     *
     * @return number of rows affected - 0 = unsuccessful, 1 = new user created,
     * -1 = user already registered
     */
    @Override
    public int register(String firstName, String surName, String userName,  String email, String password) {

        /**
         * Number indicating how many users are inserted into database.
         */
        int rowsAffected = 0;

        /**
         * Variables used to interact with database.
         */
        Connection conn = null;
        PreparedStatement ps = null;

        try {

            // Get a connection to the database
            conn = getConnection();

            // Get a statement from the connection
            ps = conn.prepareStatement("INSERT INTO users (firstName,surName, userName, email,password) VALUES(?, ?, ?, ?, ?)");

            // Fill in the blanks - they are starting from 1.
            ps.setString(1, firstName);
            ps.setString(2, surName);
            ps.setString(3, userName);
            ps.setString(4, email);
            //hash the password
            ps.setString(5, passwordGenerator(password));

            // Execute the query and store how many rows were affected/changed
            // when inserting, this number indicates whether or not the row was
            // added to the database (>0 means it was added)
            rowsAffected = ps.executeUpdate();

        }//
        // Extra exception handling block for where there is already an entry
        // with the primary key specified
        catch (MySQLIntegrityConstraintViolationException e) {
            // user already registered
            // Set the rowsAffected to -1, this can be used as a flag for the display section
            rowsAffected = -1;
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred: " + se.getMessage());
        } catch (Exception e) {
            System.out.println("Exception occurred: " + e.getMessage());

        } // Close the open access points
        finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("Exception occurred when attempting to close the PreparedStatement: " + ex.getMessage());
                }
            }
            freeConnection(conn);
        }
        return rowsAffected;
    }

    @Override
    public User login(String email, String pass) {

        /**
         * Number indicating type of the user (-1 = username+password doesn't
         * match, 0 = user, 1 = admin)
         */
        // Create variables used to interact with database 
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = new User();
        try {
            // Get a connection to the database
            conn = getConnection();

            // Get a statement from the connection
            ps = conn.prepareStatement("SELECT * FROM users where email = ? AND password = ?");
            pass = passwordGenerator(pass);
            ps.setString(1, email);
            ps.setString(2, pass);

            // Execute the query
            rs = ps.executeQuery();

            // check if username+password match and get type of user (0 = user, 1 = admin)
            while (rs.next()) {
                u.setUserId(rs.getInt("userId"));
                u.setFirstName(rs.getString("firstName"));
                u.setSurName(rs.getString("surName"));
                u.setUserName(rs.getString("userName"));
                u.setEmail(rs.getString("email"));
                if (rs.getInt("isAdmin") == 0) {
                    u.setType(false);
                } else if (rs.getInt("type") == 1) {
                    u.setType(true);
                }
                u.setPassword(rs.getString("password"));

            }

        } catch (SQLException se) {
            System.out.println("SQL Exception occurred: " + se.getMessage());
        } catch (Exception e) {
            System.out.println("Exception occurred: " + e.getMessage());
        } // close the open access points (resultset, preparedstatement, connection)
        finally {
            // Close the result set, statement and the connection
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    System.out.println("Exception occurred when attempting to close ResultSet: " + ex.getMessage());
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("Exception occurred when attempting to close the PreparedStatement: " + ex.getMessage());
                }
            }
            freeConnection(conn);
        }
        return u;
    }
    
    @Override
    public User getDetailsById(int userId) {
        User u = new User();
        boolean found = false;

        Connection conn = getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = conn.prepareStatement("SELECT * FROM users WHERE userId = ?");
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            if (rs.next()) {

                u.setUserId(rs.getInt("userId"));
                u.setFirstName(rs.getString("firstName"));
                u.setSurName(rs.getString("surName"));
                u.setUserName(rs.getString("userName"));
                u.setEmail(rs.getString("email"));
                if (rs.getInt("isAdmin") == 0) {
                    u.setType(false);
                } else if (rs.getInt("isAdmin") == 1) {
                    u.setType(true);
                }
                u.setPassword(rs.getString("password"));

                found = true;
            }
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred: " + se.getMessage());

        } catch (Exception e) {
            System.out.println("Exception occurred: " + e.getMessage());

        }
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    System.out.println("Exception occurred when attempting to close ResultSet: " + ex.getMessage());
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("Exception occurred when attempting to close the PreparedStatement: " + ex.getMessage());
                }
            }
            freeConnection(conn);
        }
        if (!found) {
            return null;
        } else {
            return u;
        }
    }
    
    public static String passwordGenerator(String password) {

        String hashPassword = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            // Add password bytes to digest
            md.update(password.getBytes());
            // Get the hash's bytes
            byte[] bytes = md.digest();
            // This bytes[] has bytes in decimal format;
            // Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            // Get complete hashed password in hex format
            hashPassword = sb.toString();
            // Exception when java.security is not imported
        } catch (NoSuchAlgorithmException e) {
            System.out.println("Problem with hashing password " + e.getMessage());
        }
        return hashPassword;
    }
    
    @Override
    public User findUserByUsername(String uname){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = new User();
        boolean found = false;
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM users WHERE userName = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);
            
            rs = ps.executeQuery();
            if (rs.next()) 
            {
                u.setUserId(rs.getInt("userId"));
                u.setFirstName(rs.getString("firstName"));
                u.setSurName(rs.getString("surName"));
                u.setUserName(rs.getString("userName"));
                u.setEmail(rs.getString("email"));
                if (rs.getInt("isAdmin") == 0) {
                    u.setType(false);
                } else if (rs.getInt("isAdmin") == 1) {
                    u.setType(true);
                }
                u.setPassword(rs.getString("password"));
                found = true;
            }
        } 
        catch (SQLException e) 
        {
            System.err.println("\tA problem occurred during the findUserByUsername method:");
            System.err.println("\t"+e.getMessage());
        }
        catch (NullPointerException ex) 
        {
            System.err.println("\tA problem occurred during the findUserByUsername method:");
            System.err.println("\t"+ex.getMessage());
        }
        finally 
        {
            try 
            {
                if (rs != null) 
                {
                    rs.close();
                }
                if (ps != null) 
                {
                    ps.close();
                }
                if (con != null) 
                {
                    freeConnection(con);
                }
            } 
            catch (SQLException e) 
            {
                System.err.println("A problem occurred when closing down the findUserByUsername method:\n" + e.getMessage());
            }
        }
        if (!found) {
            return null;
        } else {
            return u;
        }
    }
    
        @Override
    public ArrayList<User> viewAllUsers() {
        ArrayList<User> allUsers = new ArrayList();
        boolean found = false;

        Connection conn = getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = conn.prepareStatement("SELECT * FROM users");
            rs = ps.executeQuery();

            while (rs.next()) {
                while (rs.next()) {
                    User u = new User();
                    u.setUserId(rs.getInt("userId"));
                    u.setFirstName(rs.getString("firstName"));
                    u.setSurName(rs.getString("surName"));
                    u.setEmail(rs.getString("email"));
                    if (rs.getInt("type") == 0) {
                        u.setType(false);
                    } else if (rs.getInt("type") == 1) {
                        u.setType(true);
                    }
                    u.setPassword(rs.getString("password"));

                    allUsers.add(u);
                    found = true;
                }

            }
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred: " + se.getMessage());

        } catch (Exception e) {
            System.out.println("Exception occurred: " + e.getMessage());

        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    System.out.println("Exception occurred when attempting to close ResultSet: " + ex.getMessage());
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("Exception occurred when attempting to close the PreparedStatement: " + ex.getMessage());
                }
            }
            freeConnection(conn);
        }
        if (!found) {
            return null;
        } else {
            return allUsers;
        }
    }
}
