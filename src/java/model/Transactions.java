/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 *
 * @author Anh Dat
 */
public class Transactions {

	private String transactionId;

	private String userName;

	private Timestamp transDateTime;

	private double transAmount;

	public Transactions() {
		super();
		this.transactionId = IDUtil.generateTransId();

		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD hh:mm:ss");

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		sdf.format(timestamp);

		this.transDateTime = timestamp;
	}

	public Transactions(String userName, double transAmount) {
		super();
		this.userName = userName;
		this.transAmount = transAmount;

		this.transactionId = IDUtil.generateTransId();

		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD hh:mm:ss");

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		sdf.format(timestamp);

		this.transDateTime = timestamp;

	}

	public Transactions(String transactionId, String userName, double transAmount) {
		super();
		this.transactionId = transactionId;
		this.userName = userName;
		this.transAmount = transAmount;

		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD hh:mm:ss");

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		sdf.format(timestamp);

		this.transDateTime = timestamp;
	}

	public Transactions(String userName, Timestamp transDateTime, double transAmount) {
		super();
		this.userName = userName;
		this.transDateTime = transDateTime;
		this.transactionId = IDUtil.generateTransId();
		this.transAmount = transAmount;
	}

	public Transactions(String transactionId, String userName, Timestamp transDateTime, double transAmount) {
		super();
		this.transactionId = transactionId;
		this.userName = userName;
		this.transDateTime = transDateTime;
		this.transAmount = transAmount;

	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Timestamp getTransDateTime() {
		return transDateTime;
	}

	public void setTransDateTime(Timestamp transDateTime) {
		this.transDateTime = transDateTime;
	}

	public double getTransAmount() {
		return transAmount;
	}

	public void setTransAmount(double transAmount) {
		this.transAmount = transAmount;
	}

}

