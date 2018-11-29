package com.xiangmu.entity;

public class OrderDetail {
private int id;
private Orders order;
private Products pu;
private int quantity;
private int discount;

public OrderDetail() {
	super();
}

public OrderDetail(int id, Orders order) {
	super();
	this.id = id;
	this.order = order;
}

public OrderDetail(Orders order, Products pu, int quantity, int discount) {
	super();
	this.order = order;
	this.pu = pu;
	this.quantity = quantity;
	this.discount = discount;
}

public OrderDetail(int id, Orders order, Products pu, int quantity, int discount) {
	super();
	this.id = id;
	this.order = order;
	this.pu = pu;
	this.quantity = quantity;
	this.discount = discount;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public Orders getOrder() {
	return order;
}
public void setOrder(Orders order) {
	this.order = order;
}
public Products getPu() {
	return pu;
}
public void setPu(Products pu) {
	this.pu = pu;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public double getDiscount() {
	return discount;
}
public void setDiscount(int discount) {
	this.discount = discount;
}

@Override
public String toString() {
	return "OrderDetail [id=" + id + ", order=" + order + ", pu=" + pu + ", quantity=" + quantity + ", discount="
			+ discount + "]";
}

}
