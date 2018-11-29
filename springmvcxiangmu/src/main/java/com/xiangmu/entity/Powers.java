package com.xiangmu.entity;

public class Powers {
int powerID;
String power_name;
int isNavi;
int parentNaviID;
String power_code;
String url;
String navi_desc;

public String getNavi_desc() {
	return navi_desc;
}

public Powers(String power_name, int isNavi, int parentNaviID, String power_code, String url) {
	super();
	this.power_name = power_name;
	this.isNavi = isNavi;
	this.parentNaviID = parentNaviID;
	this.power_code = power_code;
	this.url = url;
}

public Powers(int powerID, String power_name, int isNavi, String power_code, String url) {
	super();
	this.powerID = powerID;
	this.power_name = power_name;
	this.isNavi = isNavi;
	this.power_code = power_code;
	this.url = url;
}

public Powers() {
	super();
}

public void setNavi_desc(String navi_desc) {
	this.navi_desc = navi_desc;
}
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
public int getIsNavi() {
	return isNavi;
}
public void setIsNavi(int isNavi) {
	this.isNavi = isNavi;
}
public int getParentNaviID() {
	return parentNaviID;
}
public void setParentNaviID(int parentNaviID) {
	this.parentNaviID = parentNaviID;
}
public String getPower_code() {
	return power_code;
}
public void setPower_code(String power_code) {
	this.power_code = power_code;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
@Override
public String toString() {
	return "Powers [powerID=" + powerID + ", power_name=" + power_name + ", isNavi=" + isNavi + ", parentNaviID="
			+ parentNaviID + ", power_code=" + power_code + ", url=" + url + ", navi_desc=" + navi_desc + "]";
}


}
