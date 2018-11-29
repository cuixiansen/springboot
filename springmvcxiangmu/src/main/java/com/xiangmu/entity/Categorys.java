package com.xiangmu.entity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.xiangmu.dao.CategoryMapper;
@Component
public class Categorys {
private int cgID;
private String cg_name;
private String cg_desc;

public Categorys() {}

public Categorys(int cgID, String cg_name, String cg_desc) {
	super();
	this.cgID = cgID;
	this.cg_name = cg_name;
	this.cg_desc = cg_desc;
}

public Categorys(int cgID) {
	super();
	this.cgID = cgID;
}

public Categorys(String cg_name) {
	super();
	this.cg_name = cg_name;
}

public Categorys(String cg_name, String cg_desc) {
	super();
	this.cg_name = cg_name;
	this.cg_desc = cg_desc;
}

public Categorys(int cgID, String cg_name) {
	super();
	this.cgID = cgID;
	this.cg_name = cg_name;
}
public int getCgID() {
	return cgID;
}
public void setCgID(int cgID) {
	this.cgID = cgID;
}
public String getCg_name() {
	return cg_name;
}
public void setCg_name(String cg_name) {
	this.cg_name = cg_name;
}
public String getCg_desc() {
	return cg_desc;
}
public void setCg_desc(String cg_desc) {
	this.cg_desc = cg_desc;
}
@Autowired
private CategoryMapper  categoryMapper;
public void sss() {
	System.out.println(categoryMapper);
}
public String check() {
	if(cg_name==null||cg_name.trim().length()==0) {
		return "名字不能为空";
	}
	return null;
}
@Override
public String toString() {
	return " [cgID=" + cgID + ", cg_name=" + cg_name + ", cg_desc=" + cg_desc + "]";
}

}
