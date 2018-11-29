package com.xiangmu.entity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.xiangmu.dao.AdminsMapper;

public class Admins {
	@Autowired
	AdminsMapper ad;
private String  admin_name;
private String admin_password;
private int id;
private String date;
private List<Powers> powers;
public Admins() {
	super();
}


public Admins(String name,String psd) {this.admin_name=name;
this.admin_password=psd;}


public Admins(int id,String admin_name, String admin_password) {
	super();
	this.admin_name = admin_name;
	this.admin_password = admin_password;
	this.id = id;
}


public Admins(int id,String name,String psd,String date  ) {
	this.admin_name=name;
	this.admin_password=psd;
	this.id=id;
	this.date=date;
	
}

public String getAdmin_name() {
	return admin_name;
}

public void setAdmin_name(String admin_name) {
	this.admin_name = admin_name;
}

public String getAdmin_password() {
	return admin_password;
}

public void setAdmin_password(String admin_password) {
	this.admin_password = admin_password;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}
//public List<Navi> getAllNavi(){
//	List<Navi> list=ad.getFirstNavi();
//	for(Navi a:list)
//	{  
//		List<SecondNavi> p=ad.getSecondNavi(a.getPowerID());
//		a.setList(p);
//	}
//	return list;
//}

public String toString() {
	return "Admin [admin_name=" + admin_name + ", admin_password=" + admin_password + ", id=" + id + ", date=" + date
			+ "]";
}


public List<Powers> getPowers() {
	return powers;
}


public void setPowers(List<Powers> powers) {
	this.powers = powers;
}


}
