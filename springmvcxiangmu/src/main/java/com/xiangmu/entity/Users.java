package com.xiangmu.entity;

import java.util.List;

public class Users {
private int  admin_id;
private String admin_name;
private List<Powers> powers;

public int getAdmin_id() {
	return admin_id;
}

public void setAdmin_id(int admin_id) {
	this.admin_id = admin_id;
}

public String getAdmin_name() {
	return admin_name;
}

public void setAdmin_name(String admin_name) {
	this.admin_name = admin_name;
}

public List<Powers> getPowers() {
	return powers;
}

public void setPowers(List<Powers> powers) {
	this.powers = powers;
}

@Override
public String toString() {
	return "Users [admin_id=" + admin_id + ", admin_name=" + admin_name + ", powers=" + powers + "]";
}


}
