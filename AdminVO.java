package com.ezen.spring.board.teampro.admin;

import org.springframework.stereotype.Component;

@Component("adminvo")
public class AdminVO {

	private int bnum;
	private String year;
	private String month;
	private String day;
	private int total;
	
	private String bname;
	private String beyday;
	private int price;
	private int quantity;
	private int totalquantity;
	private String uid;

	public AdminVO() {}
	public AdminVO(String year, String month, String day, String bname, int total, String beyday, int price) {
		super();
		this.year = year;
		this.month = month;
		this.day = day;
		this.bname = bname;
		this.total = total;
		this.beyday = beyday;
		this.price = price;
	}
	
	
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getTotalquantity() {
		return totalquantity;
	}
	public void setTotalquantity(int totalquantity) {
		this.totalquantity = totalquantity;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getBeyday() {
		return beyday;
	}
	public void setBeyday(String beyday) {
		this.beyday = beyday;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
}
