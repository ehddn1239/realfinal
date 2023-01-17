package com.sdm.fj.product;


public class Criteria {
	private int pageNum;
	private int amount;
	private int p_category;
	
	
	public int getP_category() {
		return p_category;
	}

	public void setP_category(int p_category) {
		this.p_category = p_category;
	}

	public Criteria() {
		this(1,9); //나타낼 게시글수
	}

	public Criteria(int i, int j) {
		this.pageNum = i;
		this.amount = j;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	
	
}