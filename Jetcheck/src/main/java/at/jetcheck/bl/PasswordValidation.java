/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.bl;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Gottl
 */
public class PasswordValidation {
    
    private static String hashed_pass = "972ea38ec7279452e635a89e4447cbca0dd0889e0479647e8c9104ff83e1871ecc0ea93be0d31059873cfe475c423fa4b63552d6cf29fa80e1f79c7140825ed1";
    
    public static boolean checkPassword(String password) {
        return hashed_pass.equals(encryptThisString(password));
    }

    public static String encryptThisString(String input) {
        try {
            // getInstance() method is called with algorithm SHA-512
            MessageDigest md = MessageDigest.getInstance("SHA-512");

            // digest() method is called
            // to calculate message digest of the input string
            // returned as array of byte
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value
            String hashtext = no.toString(16);

            // Add preceding 0s to make it 32 bit
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }

            // return the HashText
            System.out.println(hashtext);
            return hashtext;
        } // For specifying wrong message digest algorithms
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
