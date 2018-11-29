package com.xiangmu.entity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.xiangmu.dao.AdminsMapper;

public class Navi {
	
	//一级目录的id
private int powerID;
//一级目录的名字
private String power_name;
//一级目录的权限
private String power_code;
//二级目录封
private List<SecondNavi> list;
private String power_desc;
public int getPowerID() {
	return powerID;
}

public void setPowerID(int powerID) {
	this.powerID = powerID;
}

public String getPower_name() {
	return power_name;
}

public void setPower_name(String power_name) {
	this.power_name = power_name;
}

public String getPower_code() {
	return power_code;
}

public void setPower_code(String power_code) {
	this.power_code = power_code;
}





public List<SecondNavi> getList() {
	return list;
}

public void setList(List<SecondNavi> list) {
	this.list = list;
}

@Override
public String toString() {
	return "Navi [powerID=" + powerID + ", power_name=" + power_name + ", power_code=" + power_code + ", list=" + list
			+ "]";
}







}
