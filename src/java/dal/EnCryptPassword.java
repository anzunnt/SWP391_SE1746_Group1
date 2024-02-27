/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author admin
 */
public class EnCryptPassword {
    
    public String hashPassword(String plainPassword) {
        try {
            // Get an instance of the SHA-256 message digest algorithm
            MessageDigest digest = MessageDigest.getInstance("SHA-256");

            // Update the message digest with the bytes of the plain password
            byte[] hashedBytes = digest.digest(plainPassword.getBytes(StandardCharsets.UTF_8));

            // Convert the byte array to a hexadecimal string
            StringBuilder hexString = new StringBuilder();
            for (byte hashedByte : hashedBytes) {
                String hex = Integer.toHexString(0xff & hashedByte);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            // Handle the exception, such as logging or throwing a custom exception
            e.printStackTrace();
            return null;
        }
        
    }
    
//    public static void main(String[] args) {
//        EnCryptPassword ep = new EnCryptPassword();
//        String plainPassword = "123456";
//        String hashedPassword = ep.hashPassword(plainPassword);
//
//        System.out.println("Original Password: " + plainPassword);
//        System.out.println("Hashed Password: " + hashedPassword);
//    }
    
    //e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446
    //e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446
    //8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92
    //8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92
    
}
