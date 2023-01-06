package com.sdm.fj.product;

import java.util.ArrayList;

import java.util.Date;

public class Product {
	private int p_no;
	private String p_name;
	private int p_price;
	private String p_img;
	private int p_category;
	private String p_size;
	private String p_color;
	private Date p_date;
	private String p_description;
	private ArrayList<String> imgs;
	private ArrayList<String> sizes;

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
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	public String getP_description() {
		return p_description;
	}
	public void setP_description(String p_description) {
		this.p_description = p_description;
	}
	public ArrayList<String> getImgs() {
		return imgs;
	}
	public void setImgs(ArrayList<String> imgs) {
		this.imgs = imgs;
	}
	public ArrayList<String> getSizes() {
		return sizes;
	}
	public void setSizes(ArrayList<String> sizes) {
		this.sizes = sizes;
	}
	
}
