package com.sdm.fj.cart;

import java.util.ArrayList;
import java.util.Date;

public class CartDTO {

	private String a_id;
	private int p_no;
	private int cartId;
	private int cart_qty;
	private Date regDate;
	
	private String p_name;
	private int p_price;
	private String p_img;
	private String p_size;
	private String p_color;


	private ArrayList<String> imgs;
	


	public ArrayList<String> getImgs() {
		return imgs;
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



	public void setImgs(ArrayList<String> imgs) {
		this.imgs = imgs;
	}



	public CartDTO() {
		// TODO Auto-generated constructor stub
	}



	public CartDTO(String a_id, int p_no, int cartId, int cart_qty, Date regDate, String p_name, int p_price,
			String p_img) {
		super();
		this.a_id = a_id;
		this.p_no = p_no;
		this.cartId = cartId;
		this.cart_qty = cart_qty;
		this.regDate = regDate;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_img = p_img;
	}



	public String getA_id() {
		return a_id;
	}



	public void setA_id(String a_id) {
		this.a_id = a_id;
	}



	public int getP_no() {
		return p_no;
	}



	public void setP_no(int p_no) {
		this.p_no = p_no;
	}



	public int getCartId() {
		return cartId;
	}



	public void setCartId(int cartId) {
		this.cartId = cartId;
	}



	public int getCart_qty() {
		return cart_qty;
	}



	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}



	public Date getRegDate() {
		return regDate;
	}



	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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


	
	
	
	
}
