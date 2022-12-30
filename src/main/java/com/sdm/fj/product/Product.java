package com.sdm.fj.product;

public class Product {
	private int p_no;
	private String p_name;
	private int p_price;
	private String p_img;
	private int p_category;
	private String p_size;
	private String p_color;
	private int p_stock;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}
	

	public Product(int p_no, String p_name, int p_price, String p_img, int p_category, String p_size, String p_color,
			int p_stock) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_img = p_img;
		this.p_category = p_category;
		this.p_size = p_size;
		this.p_color = p_color;
		this.p_stock = p_stock;
	}


	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public int getP_category() {
		return p_category;
	}

	public void setP_category(int p_category) {
		this.p_category = p_category;
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

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
}
