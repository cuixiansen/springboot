package com.xiangmu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiangmu.dao.AdminsMapper;
import com.xiangmu.dao.PowersMapper;
import com.xiangmu.dao.RolesMapper;
import com.xiangmu.entity.AdminRole;
import com.xiangmu.entity.Admins;
import com.xiangmu.entity.Bpage;
import com.xiangmu.entity.Powers;
import com.xiangmu.entity.RolePower;
import com.xiangmu.entity.Roles;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class RolesController {
	@Autowired
	RolesMapper rolesmapper;
	@Autowired
	AdminsMapper adminsmapper;
	@Autowired
	PowersMapper powersMapper;
//修改矿的初始化
@RequestMapping("selectAllRoles")
@ResponseBody
public Object selectAllRoles() {
	List<Roles> list=rolesmapper.selectAllRoles();
	JSONArray a=JSONArray.fromObject(list);
	return a;
	
}
@RequestMapping("selectRolesById")
@ResponseBody
public String selectRolesById(int id) {
	List<Roles> list=rolesmapper.selectRolesById(id);
	JSONArray a=JSONArray.fromObject(list);
	return a.toString();
	
}
//修改
@RequestMapping(value="updateAdminRole") 
@ResponseBody
public String updateAdminRole(@RequestParam("roleid") List<Integer> rids , int admin_id) {
	String n="ok";
	List<Integer> list=new ArrayList<>();
	int aa=rolesmapper.deleteAdminRole(admin_id);
	if(aa>0) {
		for(int i:rids) {
		AdminRole a=new  AdminRole (admin_id,i);
		int b=rolesmapper.insertAdminRole(a);
		list.add(b);
	}
		for(int j:list) {
			if(j<0) {n= "notok";
			break;}
			
			}
		}
	return n;
	
}
@RequestMapping(value="insertAdminAndRole") 
@ResponseBody
public String insertAdminAndRole(String adminname , String password,@RequestParam("roleid1") List<Integer> rids) {
	String n="ok";
	SimpleHash ss=new SimpleHash("md5", password,adminname,1);
	
	Admins a=new Admins(adminname, ss.toString());
	int aa=adminsmapper.insertAdmin(a);
	
	List<Integer> list=new ArrayList<>();
	if(aa>0) {
		int admin_id=adminsmapper.selectAdminIdByName(adminname);
		for(int i:rids) {
		AdminRole ar=new  AdminRole (admin_id,i);
		int b=rolesmapper.insertAdminRole(ar);
		list.add(b);
	}
		for(int j:list) {
			if(j<0) {n= "notok";
			break;}
			
			}
		}
	return n;
	
}

@RequestMapping(value="deleteAdminRole") 
@ResponseBody
public String deleteAdminRole( int id) {
	String n="ok";
	AdminRole ar=rolesmapper.selectAdminRoleByAid(id);
	int aa=rolesmapper.deleteAdminRole(id);
	
	if(aa>0) {
		 int b=adminsmapper.deleteAdmin(id);

			if(b<0) {n="notok";}
	}
		
		
	return n;
	
}

@RequestMapping(value="selectRoleByPage",produces="application/json;charset=UTF-8") 
@ResponseBody
public Object selectUserByPage(int offset,int limit) {
	HashMap<String,Integer> map=new HashMap<>();
	map.put("startindex", offset);
	map.put("pagesize", limit);
	List<Roles> list=rolesmapper.selectRoleByPage(map);
	
	
	Bpage bpage = new Bpage();
	int aaa = rolesmapper.selectRoleCount();
	bpage.setRows(list);
	bpage.setTotal(aaa);

	JSONObject aa = JSONObject.fromObject(bpage);
	return aa;	
}

@RequestMapping(value="showrole") 

public String showrole( ) {
	
		
	return "showrole";
	
}
@RequestMapping(value="selectpowersById",produces="application/json;charset=UTF-8") 
@ResponseBody
public Object selectpowersById(int id) {
	List<Powers>  list= new ArrayList<>();
	Object [] a=new Object[2];
	Roles aaa=rolesmapper.selectRoleById(id);
	if(id!=5) {
	 list= powersMapper.selectPowerByRid(id);
	 } else { list= powersMapper.selectAllPowers();}
	a[0]=aaa;
	a[1]=list;
	
	JSONArray aa = JSONArray.fromObject(a);
	return aa;	
}
@RequestMapping(value="updateRolePower") 
@ResponseBody
public String updateRolePower(String rolename,String roledesc,String rolebeizhu,int id ,@RequestParam("powerid") List<Integer> pids) {
	String n="ok";
	List<Integer> list=new ArrayList<>();
	Roles a=new Roles(id,rolename, roledesc, rolebeizhu);
	if(id==5) {int b=rolesmapper.updateRole(a);
	if(b>0) {return "ok";}
	}
	else {
	int b=rolesmapper.updateRole(a);
	int d=rolesmapper.deleteRolePower(id);
	if(d>0) {
	for(int i:pids) {
	RolePower c=new RolePower(id, i);
	int e=rolesmapper.insertRolePower(c);
	list.add(e);
}
	for(int j:list)
	{
		if(j<0) {n="notok"; break;}
	}
}}
	return n;
}

@RequestMapping(value="insertRoleAndPower") 
@ResponseBody
public String insertRoleAndPower(String rolename,String roledesc,String rolebeizhu ,@RequestParam("powerid") List<Integer> pids) {
	String n="ok";
	List<Integer> list=new ArrayList<>();
	Roles a=new Roles(rolename, roledesc, rolebeizhu);
	int b=rolesmapper.insertRole(a);
	
	if(b>0) {
		int id=rolesmapper.selectRoleIdByName(rolename);
	for(int i:pids) {
	RolePower c=new RolePower(id, i);
	int e=rolesmapper.insertRolePower(c);
	list.add(e);
}
	for(int j:list)
	{
		if(j<0) {n="notok"; break;}
	}
}
	return n;
}
@RequestMapping(value="deleteRolePower") 
@ResponseBody
public String deleteRolePower( int id) {
	String n="k";
	int aa=rolesmapper.deleteRolePower(id);
	
	List<AdminRole> list=	rolesmapper.selectAdminRoleByRid(id);
		if(list.size()==0) {
			if(aa>0) {
				
				 int b=rolesmapper.deleteRole(id);
		          
					if(b<0) {n="notok";}
					else {n="ok";}
			}
		}	
		else {
		int bb=rolesmapper.deleteAdminRoleByRid(id);		
	if(bb>0&&aa>0) {
		
		 int b=rolesmapper.deleteRole(id);
          
			if(b<0) {n="notok";}
			else {n="ok";}
	}
		}

	return n;
	
}

@RequestMapping(value="selectRoleByAdID" ,produces="text/html;charset=UTF-8") 
@ResponseBody
public String selectRoleByAdID( int id) {
	
	List<Roles> list=rolesmapper.selectRolesById(id);
	
	String a="";
	for (Roles aa:list) {
		a=a+aa.getRole_name()+" ";
	}
	//JSONObject aa=JSONObject.fromObject(a)	;
		
	return a;
	
}
@RequestMapping(value="selectPowerByRID" ,produces="text/html;charset=UTF-8") 
@ResponseBody
public String selectPowerByRID( int id) {
	List <Powers> list= new ArrayList <>();
	if(id==5) { list=powersMapper.selectAllPowers();}
	else{ list=powersMapper.selectPowerByRid(id);}
	
	String a="";
	for (Powers aa:list) {
		a=a+aa.getPower_name()+" ";
	}
	//JSONObject aa=JSONObject.fromObject(a)	;
		
	return a;
	
}


}
