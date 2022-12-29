package com.sdm.fj.account;

public class Account {
	private String a_id;
	private String a_nickname;
	private String a_pw;
	private String a_addr;
	private String a_email;
	private String a_phone;
	private String a_rank;
	private int a_cash;
	
	public Account() {
		// TODO Auto-generated constructor stub
	}

	public Account(String a_id, String a_nickname, String a_pw, String a_addr, String a_email, String a_phone,
			String a_rank, int a_cash) {
		super();
		this.a_id = a_id;
		this.a_nickname = a_nickname;
		this.a_pw = a_pw;
		this.a_addr = a_addr;
		this.a_email = a_email;
		this.a_phone = a_phone;
		this.a_rank = a_rank;
		this.a_cash = a_cash;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getA_nickname() {
		return a_nickname;
	}

	public void setA_nickname(String a_nickname) {
		this.a_nickname = a_nickname;
	}

	public String getA_pw() {
		return a_pw;
	}

	public void setA_pw(String a_pw) {
		this.a_pw = a_pw;
	}

	public String getA_addr() {
		return a_addr;
	}

	public void setA_addr(String a_addr) {
		this.a_addr = a_addr;
	}

	public String getA_email() {
		return a_email;
	}

	public void setA_email(String a_email) {
		this.a_email = a_email;
	}

	public String getA_phone() {
		return a_phone;
	}

	public void setA_phone(String a_phone) {
		this.a_phone = a_phone;
	}

	public String getA_rank() {
		return a_rank;
	}

	public void setA_rank(String a_rank) {
		this.a_rank = a_rank;
	}

	public int getA_cash() {
		return a_cash;
	}

	public void setA_cash(int a_cash) {
		this.a_cash = a_cash;
	}
	
}
