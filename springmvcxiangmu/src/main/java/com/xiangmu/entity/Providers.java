package com.xiangmu.entity;

public class Providers {
private int peID;
private String pe_name;
private  String pe_add;
private String pe_tel;
private String acount;
private String email;
public Providers() {}


public Providers(String pe_name) {
	super();
	this.pe_name = pe_name;
}

public Providers(String pe_name, String pe_tel) {
	super();
	this.pe_name = pe_name;
	this.pe_tel = pe_tel;
}


public Providers(String pe_name, String pe_add, String pe_tel, String acount, String email) {
	super();
	this.pe_name = pe_name;
	this.pe_add = pe_add;
	this.pe_tel = pe_tel;
	this.acount = acount;
	this.email = email;
}


public Providers(String pe_name, String pe_add, String pe_tel, String email) {
	super();
	this.pe_name = pe_name;
	this.pe_add = pe_add;
	this.pe_tel = pe_tel;
	this.email = email;
}


public Providers(int peID) {
	super();
	this.peID = peID;
}


public Providers(int peID, String pe_name) {
	super();
	this.peID = peID;
	this.pe_name = pe_name;
}


public Providers(int peID, String pe_name, String pe_tel) {
	super();
	this.peID = peID;
	this.pe_name = pe_name;
	this.pe_tel = pe_tel;
}


public Providers(int peID, String pe_name, String pe_add, String pe_tel, String acount, String email) {
	super();
	this.peID = peID;
	this.pe_name = pe_name;
	this.pe_add = pe_add;
	this.pe_tel = pe_tel;
	this.acount = acount;
	this.email = email;
}


public int getPeID() {
	return peID;
}
public void setPeID(int peID) {
	this.peID = peID;
}
public String getPe_name() {
	return pe_name;
}
public void setPe_name(String pe_name) {
	this.pe_name = pe_name;
}
public String getPe_add() {
	return pe_add;
}
public void setPe_add(String pe_add) {
	this.pe_add = pe_add;
}
public String getPe_tel() {
	return pe_tel;
}
public void setPe_tel(String pe_tel) {
	this.pe_tel = pe_tel;
}
public String getAcount() {
	return acount;
}
public void setAcount(String acount) {
	this.acount = acount;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}


@Override
public String toString() {
	return "Provider [peID=" + peID + ", pe_name=" + pe_name + ", pe_add=" + pe_add + ", pe_tel=" + pe_tel + ", acount="
			+ acount + ", email=" + email + "]";
}




}
