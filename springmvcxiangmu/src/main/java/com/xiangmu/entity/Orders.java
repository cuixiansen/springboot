package com.xiangmu.entity;

public class Orders {
private String orderID;
private String order_date;
private Customers cus;
private Employees emp;
public Orders () {};
public Orders(String order_date, Employees emp,String orderid) {
	super();
	this.order_date = order_date;
	this.emp = emp;
	this.orderID=orderid;
}

public Orders(String orderID) {
	super();
	this.orderID = orderID;
}

public Orders(String orderID, Customers cus, Employees emp) {
	super();
	this.orderID = orderID;
	this.cus = cus;
	this.emp = emp;
}

public Orders(String orderID, String order_date, Customers cus, Employees emp) {
	super();
	this.orderID = orderID;
	this.order_date = order_date;
	this.cus = cus;
	this.emp = emp;
}

public String getOrderID() {
	return orderID;
}
public void setOrderID(String orderID) {
	this.orderID = orderID;
}
public String getOrder_date() {
	return order_date;
}
public void setOrder_date(String order_date) {
	this.order_date = order_date;
}
public Customers getCus() {
	return cus;
}
public void setCus(Customers cus) {
	this.cus = cus;
}
public Employees getEmp() {
	return emp;
}
public void setEmp(Employees emp) {
	this.emp = emp;
}

}
