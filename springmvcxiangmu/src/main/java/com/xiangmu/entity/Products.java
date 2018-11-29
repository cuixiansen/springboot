package com.xiangmu.entity;



public class Products {
private int puID;
private  String pu_name;
private double in_price;
private double sales_price;

private Providers p;
private Categorys c;
private int quantity;
private String date;
public Products() {}

public Products( Providers p, Categorys c) {
	super();
	
	this.p = p;
	this.c = c;
}

public Products(String pu_name,double in_price) {
	this.pu_name=pu_name;
	this.in_price=in_price;
	
}

public Products(String pu_name, Providers p, Categorys c) {
	super();
	this.pu_name = pu_name;
	this.p = p;
	this.c = c;
}

public Products(int puID) {
	super();
	this.puID = puID;
}

public Products(int puID, String pu_name, double in_price, double sales_price, Providers p, Categorys c, int quantity) {
	super();
	this.puID = puID;
	this.pu_name = pu_name;
	this.in_price = in_price;
	this.sales_price = sales_price;
	this.p = p;
	this.c = c;
	this.quantity = quantity;
}
public Products(int puID, String pu_name, double in_price, double sales_price, Providers p, Categorys c,
		int quantity, String date) {
	super();
	this.puID = puID;
	this.pu_name = pu_name;
	this.in_price = in_price;
	this.sales_price = sales_price;
	this.p = p;
	this.c = c;
	this.quantity = quantity;
	this.date = date;
}
public Products( String pu_name, double in_price, double sales_price, Providers p, Categorys c,
		int quantity, String date) {
	super();
	
	this.pu_name = pu_name;
	this.in_price = in_price;
	this.sales_price = sales_price;
	this.p = p;
	this.c = c;
	this.quantity = quantity;
	this.date = date;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public Products(String pu_name, double in_price, double sales_price, Providers p, Categorys c, int quantity) {
	super();
	this.pu_name = pu_name;
	this.in_price = in_price;
	this.sales_price = sales_price;
	this.p = p;
	this.c = c;
	this.quantity = quantity;
}
public int getPuID() {
	return puID;
}
public void setPuID(int puID) {
	this.puID = puID;
}
public String getPu_name() {
	return pu_name;
}
public void setPu_name(String pu_name) {
	this.pu_name = pu_name;
}
public double getIn_price() {
	return in_price;
}
public void setIn_price(double in_price) {
	this.in_price = in_price;
}
public Providers getP() {
	return p;
}
public void setP(Providers p) {
	this.p = p;
}
public Categorys getC() {
	return c;
}
public void setC(Categorys c) {
	this.c = c;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public double getSales_price() {
	return sales_price;
}
public void setSales_price(double sales_price) {
	this.sales_price = sales_price;
}
//@Override
//public String toString() {
//	return  " [��ƷID=" + puID + ",��Ʒ����=" + pu_name + ",����=" + in_price + ",�ۼ�=" + sales_price
//			+ ",��Ӧ������=" + p.getProviderName()+",��Ӧ��ID=" +p.getProviderid()+ ",����=" + c.getCg_name()+",Ŀ¼ID="+c.getCgID() + ",����=" + quantity + ",��������=" + date + "]";
//}


}
