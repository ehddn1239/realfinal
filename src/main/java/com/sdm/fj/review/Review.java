package com.sdm.fj.review;

import java.util.Date;

public class Review {
	
	private int r_no;
	private int r_p_no;
	private String r_a_id;
	private String r_txt;
	private int r_grade;
	private String r_img;
	private Date r_date;
	
	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	private String p_name;
	private String p_size;
	private String p_color;
	
	
	public Review() {
		// TODO Auto-generated constructor stub
	}



	public Review(int r_no, int r_p_no, String r_a_id, String r_txt, int r_grade, String r_img, Date r_date,
			String p_name, String p_size, String p_color) {
		super();
		this.r_no = r_no;
		this.r_p_no = r_p_no;
		this.r_a_id = r_a_id;
		this.r_txt = r_txt;
		this.r_grade = r_grade;
		this.r_img = r_img;
		this.r_date = r_date;
		this.p_name = p_name;
		this.p_size = p_size;
		this.p_color = p_color;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public int getR_p_no() {
		return r_p_no;
	}

	public void setR_p_no(int r_p_no) {
		this.r_p_no = r_p_no;
	}

	public String getR_a_id() {
		return r_a_id;
	}

	public void setR_a_id(String r_a_id) {
		this.r_a_id = r_a_id;
	}

	public String getR_txt() {
		return r_txt;
	}

	public void setR_txt(String r_txt) {
		this.r_txt = r_txt;
	}

	public int getR_grade() {
		return r_grade;
	}

	public void setR_grade(int r_grade) {
		this.r_grade = r_grade;
	}

	public String getR_img() {
		return r_img;
	}

	public void setR_img(String r_img) {
		this.r_img = r_img;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_size() {
		return p_size;
	}

	public void setP_size(String p_size) {
		this.p_size = p_size;
	}

	public String getP_color() {
		return p_color;
	}

	public void setP_color(String p_color) {
		this.p_color = p_color;
	}
	
}
