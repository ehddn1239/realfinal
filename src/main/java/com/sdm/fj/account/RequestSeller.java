package com.sdm.fj.account;

import java.util.Date;

public class RequestSeller {
	private int r_no;
	private String r_nickname;
	private String r_marketname;
	private String r_email;
	private String r_rank;
	private String r_id;
	private String r_description;
	private Date r_date;
	
	public RequestSeller() {
		// TODO Auto-generated constructor stub
	}

	
	public RequestSeller(int r_no, String r_nickname, String r_marketname, String r_email, String r_rank, String r_id,
			String r_description, Date r_date) {
		super();
		this.r_no = r_no;
		this.r_nickname = r_nickname;
		this.r_marketname = r_marketname;
		this.r_email = r_email;
		this.r_rank = r_rank;
		this.r_id = r_id;
		this.r_description = r_description;
		this.r_date = r_date;
	}


	public Date getR_date() {
		return r_date;
	}


	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}


	public String getR_id() {
		return r_id;
	}




	public void setR_id(String r_id) {
		this.r_id = r_id;
	}



	public String getR_nickname() {
		return r_nickname;
	}


	public void setR_nickname(String r_nickname) {
		this.r_nickname = r_nickname;
	}


	public String getR_email() {
		return r_email;
	}


	public void setR_email(String r_email) {
		this.r_email = r_email;
	}


	public String getR_rank() {
		return r_rank;
	}


	public void setR_rank(String r_rank) {
		this.r_rank = r_rank;
	}


	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_marketname() {
		return r_marketname;
	}

	public void setR_marketname(String r_marketname) {
		this.r_marketname = r_marketname;
	}

	public String getR_description() {
		return r_description;
	}

	public void setR_description(String r_description) {
		this.r_description = r_description;
	}
	
	
	
	
}
