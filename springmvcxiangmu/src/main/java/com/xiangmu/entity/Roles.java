package com.xiangmu.entity;

public class Roles {
private int roleID;
private String role_name;
private String role_desc;
private String role_beizhu;
public int getRoleID() {
	return roleID;
}

public Roles() {
	super();
}

public Roles(int roleID, String role_name, String role_desc, String role_beizhu) {
	super();
	this.roleID = roleID;
	this.role_name = role_name;
	this.role_desc = role_desc;
	this.role_beizhu = role_beizhu;
}

public Roles(String role_name, String role_desc, String role_beizhu) {
	super();
	this.role_name = role_name;
	this.role_desc = role_desc;
	this.role_beizhu = role_beizhu;
}

public void setRoleID(int roleID) {
	this.roleID = roleID;
}
public String getRole_name() {
	return role_name;
}
public void setRole_name(String role_name) {
	this.role_name = role_name;
}
public String getRole_desc() {
	return role_desc;
}
public void setRole_desc(String role_password) {
	this.role_desc = role_password;
}

public String getRole_beizhu() {
	return role_beizhu;
}
public void setRole_beizhu(String role_beizhu) {
	this.role_beizhu = role_beizhu;
}
@Override
public String toString() {
	return "Roles [roleID=" + roleID +  ", role_desc=" + role_desc + "]";
}

}
