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
import Dtos.Friend;
import Dtos.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class MessageDao extends Dao implements MessageDaoInterface {
    
    public MessageDao(String databaseName) {
        super(databaseName);
    }

    public MessageDao(String databaseName, String poolName) {
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
    
    public boolean sendMessage(String fromId, String toId, String subjectLine, String messageContent){
        Connection con = null;
        PreparedStatement ps = null;
        int rs = 0;
        boolean succeeded = false;
        try {
            con = this.getConnection();
            String query = "INSERT INTO `message`(`messageId`, `fromId`, `toId`, `subjectLine`, `messageContent`) VALUES (null,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1, fromId);
            ps.setString(2, toId);
            ps.setString(3, subjectLine);
            ps.setString(4, messageContent);

            rs = ps.executeUpdate();
            if (rs == 1) {
                succeeded = true;
            }
        } catch (SQLException ex) {
            System.err.println("\tA problem occurred during the sendMessage method:");
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
                System.err.println("A problem occurred when closing down the sendMessage method:\n" + e.getMessage());
            }
        }
        return succeeded;
    }

    public static void main(String[] args) {
        String key = "Bar12345Bar12345"; // 128 bit key
        String initVector = "RandomInitVector"; // 16 bytes IV
        String message = "The password is 157892";
        String eMessage = encrypt(key, initVector, message);
        String dMessage = decrypt(key, initVector, eMessage);
        
        System.out.println("Encrypted message: " + eMessage);
        System.out.println("Original message: " + dMessage);
    }
}
