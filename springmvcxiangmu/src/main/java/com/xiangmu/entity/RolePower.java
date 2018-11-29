package com.xiangmu.entity;

public class RolePower {
private int roleID;
private int powerID;

public RolePower() {
	super();
}
public RolePower(int roleID, int powerID) {
	super();
	this.roleID = roleID;
	this.powerID = powerID;
}
public int getRoleID() {
	return roleID;
}
public void setRoleID(int roleID) {
	this.roleID = roleID;
}
public int getPowerID() {
	return powerID;
}
public void setPowerID(int powerID) {
	this.powerID = powerID;
}

}
