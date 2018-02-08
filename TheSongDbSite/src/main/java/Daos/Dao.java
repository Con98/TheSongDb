/*
 * Thomas, Tadas, Emmet
 */
package Daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.InitialContext;

/**
 *
 * @author Tadas
 */
public class Dao {

    private DataSource datasource;
    private String databaseName;
    private final String DEFAULT_DB = "thesongdb";
    private static String database = "thesongdb";

    /**
     * Non-parameterized constructor
     */
    public Dao() {

    }

    /**
     * Parameterized constructor.
     *
     * @param name is used as a name of database we want to access.
     */
    public Dao(String name) {
        database = name;
    }

    public Dao(String name, String datasourceContext) {
        this(name);
        Connection con = null;

        String DATASOURCE_CONTEXT = datasourceContext;
        try {
            Context initialContext = new InitialContext();
            DataSource ds = (DataSource) initialContext.lookup("java:comp/env/" + DATASOURCE_CONTEXT);
            if (ds != null) {
                datasource = ds;
                System.out.println("Connection pool located!");
            } else {
                System.out.println("Failed to lookup datasource.");
            }
        } catch (NamingException ex) {
            System.out.println("Cannot get connection: " + ex);
        }
    }

    /**
     * Get the name of database we are currently accessing.
     *
     * @return name of database.
     */
    public String getDatabase() {
        return database;
    }

    /**
     * Setting the name of database we want to access.
     *
     * @param db is the name of database.
     */
    public void setDatabase(String db) {
        database = db;
    }

    /**
     * Connection to database.
     *
     * Used to connect to database defined in variable database.
     *
     * @return Connection
     */
    public Connection getDirectConnection() {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/" + database;
        String username = "root";	// Username to access database on server
        String password = "";		// Password to access database on server
        Connection con = null;
        try {
            Class.forName(driver);	// Load the driver to translate between your code and the database
            con = DriverManager.getConnection(url, username, password);	// Make a connection to the database
        } catch (ClassNotFoundException ex1) {		// If it can’t find the driver, print an error and shut down.
            System.out.println("Failed to find driver class " + ex1.getMessage());
            System.exit(1);
        } catch (SQLException ex2) {	// If something went wrong when talking to the db, print an error.
            System.out.println("Connection failed " + ex2.getMessage());
        }
        return con;	// Send back the connection to the database.
    }

    public Connection getConnection() {
        Connection conn = null;
        try {
            if (datasource != null) {
                conn = datasource.getConnection();
            } else {
                System.out.println("failed to lookup datasource. Connecting to database directly.");
                conn = this.getDirectConnection();
            }
        } catch (SQLException ex2) {
            System.out.println("Connection failed " + ex2.getMessage());
            System.exit(2);
        }
        return conn;
    }

    /**
     * Disconnect from database.
     *
     * Free up connection from database. Used after we run the query.
     *
     * @param con indicates which connection we want to free up.
     */
    public static void freeConnection(Connection con) {
        try {
            // If there is a connection to close, close it.
            if (con != null) {
                con.close();
                con = null;
            }
            // If something went wrong when talking to the db, print an error.
        } catch (SQLException e) {
            System.out.println("Failed to free connection: " + e.getMessage());
        }
    }
}
