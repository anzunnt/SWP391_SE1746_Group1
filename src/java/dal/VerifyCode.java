/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.security.SecureRandom;

/**
 *
 * @author admin
 */
public class VerifyCode {
    
    public String generateVerificationCode(int length) {
        String characters = "0123456789";
        StringBuilder code = new StringBuilder();

        SecureRandom random = new SecureRandom();
        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(characters.length());
            code.append(characters.charAt(randomIndex));
        }

        return code.toString();
    }
    
}
