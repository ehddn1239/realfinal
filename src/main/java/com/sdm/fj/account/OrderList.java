package com.sdm.fj.account;

import java.util.Date;

public class OrderList {
	private int o_no;
	private int o_p_no;
	private String o_a_id;
	private Date o_date;
	private int o_qty;
	private String o_p_name;

	public OrderList() {
		// TODO Auto-generated constructor stub
	}

	public OrderList(int o_no, int o_p_no, String o_a_id, Date o_date, int o_qty, String o_p_name) {
		super();
		this.o_no = o_no;
		this.o_p_no = o_p_no;
		this.o_a_id = o_a_id;
		this.o_date = o_date;
		this.o_qty = o_qty;
		this.o_p_name = o_p_name;
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
