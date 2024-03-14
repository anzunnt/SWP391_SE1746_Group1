/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Anh Dat
 */
public class IDUtil {
  public static String generateId() {
		String pId = null;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		pId = sdf.format(new Date());
		pId = "P" + pId;

		return pId;
	}

	public static String generateTransId() {
		String tId = null;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		tId = sdf.format(new Date());
		tId = "T" + tId;

		return tId;
	}  
}
