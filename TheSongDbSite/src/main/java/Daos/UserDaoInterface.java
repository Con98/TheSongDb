/*
 * Thomas, Tadas, Emmet
 */
package Daos;

import Dtos.User;
import java.util.ArrayList;

/**
 *
 * @author Thomas
 */
public interface UserDaoInterface {

    /**
     * Registration form for new user
     *
     * Used to get all new user's valid data and create object User.
     *
     * @return object type User
     */
    //public User getUserDetails();

    /**
     * Check if username/password is in database.
     *
     * Checks if username and password match (for same user). This check is case
     * sensitive.
     *
     * @param email
     * @param pass
     * @return -1 for unregistered user not found in database, 0 for normal
     * user, 1 for administrator
     */
    public User login(String email, String pass);

    /**
     * Register new user
     *
     * Registration form for new user with inputs for each field. When
     * successfully filled in, user is added to database. User number is set by
     * database - auto-incremented for new user. Password is stored as a hash -
     * MD5 algorithm is used. Default user type is normal user (userType =
     * false) - set automatically in database.
     *
     * @param u User to be registered passed in as an object
     * @return number of rows affected - 0 = unsuccessful, 1 = new user created,
     * -1 = user already registered
     */
    public int register(String firstName, String surName, String userName, String email, String password);

    /**
     *
     * Update password for user whose email is passed in as a parameter.
     *
     * @param email
     * @return true if password successfully changed, false otherwise
     */
//    public boolean updatePassword(String email);

    /**
     *
     * Delete user from database.
     *
     * Delete user whose userId is passed in as an argument and return number of
     * users deleted in database. Admin cannot be deleted, so sql statement
     * contains AND type = 0.
     *
     * @param userId
     *
     * @return number indicating if user was deleted (-1 = query was not
     * executed, 0 = user not found in database or admin - which cannot be
     * deleted, 1 = one user deleted)
     */
//    public int deleteUser(int userId);

    /**
     * Gets user Id
     *
     * Passing user's email to the method, returning userId from database.
     *
     * @param email
     * @return user Id from database
     */
//    public int getUserId(String email);
    
//    public ArrayList<User> viewAllUsers();
//    
//    public boolean editUser(int userId, String firstName, String surName, String email, String password);
    public User getDetailsById(int id);
}
