package com.sdm.fj.account;

public class Charger {
	private String id;
	private int money;
	
	public Charger() {
		// TODO Auto-generated constructor stub
	}

	public Charger(String id, int money) {
		super();
		this.id = id;
		this.money = money;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}
	
	
	
}
