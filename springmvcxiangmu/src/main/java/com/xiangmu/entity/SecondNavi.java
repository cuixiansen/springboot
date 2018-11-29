package com.xiangmu.entity;

public class SecondNavi {
private String power_name;
private int powerID;
private String url;
private String power_code;
public String getPower_name() {
	return power_name;
}
public void setPower_name(String power_name) {
	this.power_name = power_name;
}
public int getPowerID() {
	return powerID;
}
public void setPowerID(int powerID) {
	this.powerID = powerID;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
public String getPower_code() {
	return power_code;
}
public void setPower_code(String power_code) {
	this.power_code = power_code;
}
@Override
public String toString() {
	return "SecondNavi [power_name=" + power_name + ", powerID=" + powerID + ", url=" + url + ", power_code="
			+ power_code + "]";
}


}
