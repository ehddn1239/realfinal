package com.sdm.fj.account;

import java.util.Date;

public class OrderList {
	private int o_no;
	private int o_p_no;
	private String o_a_id;
	private Date o_date;
	private int o_qty;
	private String o_p_name;
	private String o_p_size;
	private String o_p_color;
	private int o_p_price;
	private String o_p_img;
	

	public OrderList() {
		// TODO Auto-generated constructor stub
	}


	public OrderList(int o_no, int o_p_no, String o_a_id, Date o_date, int o_qty, String o_p_name, String o_p_size,
			String o_p_color, int o_p_price, String o_p_img) {
		super();
		this.o_no = o_no;
		this.o_p_no = o_p_no;
		this.o_a_id = o_a_id;
		this.o_date = o_date;
		this.o_qty = o_qty;
		this.o_p_name = o_p_name;
		this.o_p_size = o_p_size;
		this.o_p_color = o_p_color;
		this.o_p_price = o_p_price;
		this.o_p_img = o_p_img;
	}


	public String getO_p_size() {
		return o_p_size;
	}

	public void setO_p_size(String o_p_size) {
		this.o_p_size = o_p_size;
	}

	public String getO_p_color() {
		return o_p_color;
	}

	public void setO_p_color(String o_p_color) {
		this.o_p_color = o_p_color;
	}

	public int getO_p_price() {
		return o_p_price;
	}

	public void setO_p_price(int o_p_price) {
		this.o_p_price = o_p_price;
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public int getO_p_no() {
		return o_p_no;
	}

	
	public String getO_p_img() {
		return o_p_img;
	}


	public void setO_p_img(String o_p_img) {
		this.o_p_img = o_p_img;
	}


	public void setO_p_no(int o_p_no) {
		this.o_p_no = o_p_no;
	}

	public String getO_a_id() {
		return o_a_id;
	}

	public void setO_a_id(String o_a_id) {
		this.o_a_id = o_a_id;
	}

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public int getO_qty() {
		return o_qty;
	}

	public void setO_qty(int o_qty) {
		this.o_qty = o_qty;
	}

	public String getO_p_name() {
		return o_p_name;
	}

	public void setO_p_name(String o_p_name) {
		this.o_p_name = o_p_name;
	}

}
