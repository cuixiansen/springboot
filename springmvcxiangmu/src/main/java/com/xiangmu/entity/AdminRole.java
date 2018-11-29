package com.xiangmu.entity;

public class AdminRole {
int arid;
int admin_id;
int roleID;
public AdminRole(int arid, int adminID, int roleID) {
	super();
	this.arid = arid;
	this.admin_id = adminID;
	this.roleID = roleID;
}

public AdminRole(int adminID, int roleID) {
	super();
	this.admin_id= adminID;
	this.roleID = roleID;
}


public AdminRole() {
	super();
}
public int getArid() {
	return arid;
}
public void setArid(int arid) {
	this.arid = arid;
}
public int getAdmin_id() {
	return admin_id;
}
public void setAdmin_id(int adminID) {
	this.admin_id = adminID;
}
public int getRoleID() {
	return roleID;
}
public void setRoleID(int roleID) {
	this.roleID = roleID;
}


}
