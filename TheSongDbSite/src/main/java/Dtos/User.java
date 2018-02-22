/*
 * Thomas, Tadas, Emmet
 */
package Dtos;

import java.util.Objects;

/**
 *
 * @author Thomas
 */
public class User {

    /**
     * int userId used as a primary key in table users in database -
     * automatically incremented in database when new user is added.
     */
    private int userId;
    private String firstName;
    private String surName;
    private String userName;
    /**
     * String email is also used as a username when login.
     */
    private String email;
    /**
     * boolean type holds information about privileges false = normal user,
     * true = administrator.
     */
    private boolean type;
    private String password;

    /**
     * Default constructor of user.
     */
    public User() {
    }

    /**
     * Constructor of user.
     *
     * Construct the user and sets all fields except userId, which is
     * automatically incremented in database when new user is created.
     *
     * @param firstName first name
     * @param surName surname
     * @param email email used also as a username when user login
     * @param type type of user (false = user, true = administrator)
     * @param password password for access to library stored as a hash using MD5
     */
    public User(String firstName, String surName,String userName, String email, boolean type, String password) {
        this.firstName = firstName;
        this.surName = surName;
        this.userName = userName;
        this.email = email;
        this.type = type;
        this.password = password;
    }

    /**
     * getter for userId
     *
     * @return userId
     */
    public int getUserId() {
        return userId;
    }

    /**
     * setter for userId
     *
     * @param userId
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     * getter for first name
     *
     * @return first name
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * setter for first name
     *
     * @param firstName
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * getter for surname
     *
     * @return surname
     */
    public String getSurName() {
        return surName;
    }

    /**
     * setter for surname
     *
     * @param surName
     */
    public void setSurName(String surName) {
        this.surName = surName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    /**
     * getter for email
     *
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * setter for email
     *
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * getter for user type
     *
     * @return user type
     */
    public boolean isType() {
        return type;
    }

    /**
     * setter for user type
     *
     * @param type
     */
    public void setType(boolean type) {
        this.type = type;
    }

    /**
     * getter for password
     *
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * setter for password
     *
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Override default hashCode method.
     *
     * @return number used in equals method for comparison of objects.
     */
    @Override
    public int hashCode() {
        int hash = 3;
        hash = 59 * hash + Objects.hashCode(this.email);
        hash = 59 * hash + Objects.hashCode(this.password);
        return hash;
    }

    /**
     * Override equals method.
     *
     * Compare if two users are the same. They are same if email and password
     * match.
     *
     * @param obj
     * @return true if both users are the same.
     */
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final User other = (User) obj;
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.password, other.password)) {
            return false;
        }
        return true;
    }
    
    public int compareTo(Object o){
        User u = (User) o;
        return this.userName.compareTo(userName);
    }

}
