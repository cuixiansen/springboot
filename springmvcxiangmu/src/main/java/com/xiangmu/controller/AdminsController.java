package com.xiangmu.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.xiangmu.dao.AdminsMapper;
import com.xiangmu.dao.PowersMapper;
import com.xiangmu.dao.RolesMapper;
import com.xiangmu.entity.Admins;
import com.xiangmu.entity.Bpage;
import com.xiangmu.entity.Categorys;
import com.xiangmu.entity.Navi;
import com.xiangmu.entity.Powers;
import com.xiangmu.entity.Roles;
import com.xiangmu.entity.SecondNavi;

import net.sf.json.JSONObject;
@SessionAttributes(value={"username","navilist"})//要定义一个map，把值放到map里
@Controller
public class AdminsController {
	@Autowired
	private AdminsMapper adminsMapper;
	@Autowired
	private RolesMapper rolesMapper;
	@Autowired
	private PowersMapper powersMapper;
//@RequestMapping(value="logina" , method=RequestMethod.POST)
//public String login(@RequestParam("username") String username, @RequestParam("password") String password,Map<String,Object> map,String remeber) {
//	Admins a=new Admins(username,password);
//	Admins admin=adminsMapper.selectAdminByLogin(a);
//	//HashMap<String, String>  model= new HashMap<String, String> ();
//	  map.put("username", username);
//	if(admin!=null) {
//	return "newleft";
//	}
//	return "index";
//}

@RequestMapping(value="loginadmin" , method=RequestMethod.POST)
public String logina(@RequestParam("username") String username, @RequestParam("password") String password,Map<String,Object> map,String remeber) {
 Subject currentUser = SecurityUtils.getSubject();
 //Session session = currentUser.getSession();
  
	List<Navi> navi=adminsMapper.getFirstNavi();
	
	for(Navi a:navi)
	{   
		List<SecondNavi> p=adminsMapper.getSecondNavi(a.getPowerID());
		a.setList(p);
	}
	//System.out.println(list);
	//map=new HashMap<>();
	//session.setAttribute("navi list", navi);
	//List<Powers> plist=adminsMapper.getPowersByName(username);
	//map.clear();
	map.put("username", username);
	map.put("navilist", navi); 
//	map.replace("username", username);
//	map.replace("navilist", navi);
	System.out.println(username+"------------------------------------");
	
         UsernamePasswordToken token = new UsernamePasswordToken(username, password.toCharArray());
         boolean f="1".equals(remeber);
         token.setRememberMe(f);
         try {
             currentUser.login(token);
             //session.setAttribute("username",username);
         } catch (UnknownAccountException uae) {
        	 System.out.println("There is no user with username of " + token.getPrincipal());
        	 return "index";
         } catch (IncorrectCredentialsException ice) {
        	 System.out.println("Password for account " + token.getPrincipal() + " was incorrect!");
        	 return "index";
         } catch (LockedAccountException lae) {
        	 System.out.println("The account for username " + token.getPrincipal() + " is locked.  " +
                     "Please contact your administrator to unlock it.");
        	 return "index";
         }
         // ... catch more exceptions here (maybe custom ones specific to your application?
         catch (AccountException ae) {
             System.out.println(ae.getMessage());
             return "index";
             
         } 
         // ... catch more exceptions here (maybe custom ones specific to your application?
	 //用HashedCredentialsMatcher对象 a加密 ，a要setHashed**name=md5,即加密方式，还要设置加密次数 setHashIteration
	return "newleft2";
}
@RequestMapping(value="loginadmin2" , method=RequestMethod.POST)
public String logina2(@RequestParam("username") String username, @RequestParam("password") String password,Map<String,Object> map,String remeber) {
 Subject currentUser = SecurityUtils.getSubject();
//	 Session session = currentUser.getSession();
//    Admins ad=new Admins ();
//	List<Navi> Navi=ad.getAllNavi();
	List<Powers> plist=adminsMapper.getPowersByName(username);
	map.put("username", username);
	map.put("navilist", "Navi");
	System.out.println(username+"------------------------------------");
	
         UsernamePasswordToken token = new UsernamePasswordToken(username, password.toCharArray());
         boolean f="1".equals(remeber);
         token.setRememberMe(f);
         try {
             currentUser.login(token);
             //session.setAttribute("username",username);
         } catch (UnknownAccountException uae) {
        	 System.out.println("There is no user with username of " + token.getPrincipal());
        	 return "index";
         } catch (IncorrectCredentialsException ice) {
        	 System.out.println("Password for account " + token.getPrincipal() + " was incorrect!");
        	 return "index";
         } catch (LockedAccountException lae) {
        	 System.out.println("The account for username " + token.getPrincipal() + " is locked.  " +
                     "Please contact your administrator to unlock it.");
        	 return "index";
         }
         // ... catch more exceptions here (maybe custom ones specific to your application?
         catch (AccountException ae) {
             System.out.println(ae.getMessage());
             return "index";
             
         } 
         // ... catch more exceptions here (maybe custom ones specific to your application?
	 //用HashedCredentialsMatcher对象 a加密 ，a要setHashed**name=md5,即加密方式，还要设置加密次数 setHashIteration
	return "newleft";
}
@RequestMapping(value="/") 
public String ddd() {
		return "index";
}
@RequestMapping(value="showpu") 
public String showpu() {
		return "newshowpubypage";
}
@RequestMapping(value="showpe") 
public String showpe() {
		return "newshowallpe";
}
@RequestMapping(value="showcategory") 
public String showcategory() {
		return "newshowcatebypage";
}
@RequestMapping(value="showadmin" , method=RequestMethod.GET) 
public String showadmin() {
		return "showadmin";
}
@RequestMapping(value="showorder" ) 
public String showorder() {
		return "newshoworders";
}

//初始表显示
@RequestMapping(value="selectUserByPage",produces="application/json;charset=UTF-8") 
@ResponseBody
public Object selectUserByPage(int offset,int limit) {
	HashMap<String,Integer> map=new HashMap<>();
	map.put("startindex", offset);
	map.put("pagesize", limit);
	List<Admins> list=adminsMapper.selectAdminByPage(map);
	
	
	Bpage bpage = new Bpage();
	int aaa = adminsMapper.selectAdminCount();
	bpage.setRows(list);
	bpage.setTotal(aaa);

	JSONObject aa = JSONObject.fromObject(bpage);
	return aa;	
}

//登出
@RequestMapping(value="outlogin" ,method=RequestMethod.GET) 
public String outlogin() {
	Subject a=SecurityUtils.getSubject();
	a.logout();
		return "index";
}
//检验admin重名
@RequestMapping(value="checkName" ,method=RequestMethod.GET) 
@ResponseBody
public boolean checkName(String adminname) throws UnsupportedEncodingException {
	
	 String name = new String(adminname.getBytes("iso8859-1"),"utf-8");
	Admins a= adminsMapper.selectAdminByName(name);
	if(a==null) {
	return  true;
} else {return false;}
	}
//检验role重名
@RequestMapping(value="checkRname" ,method=RequestMethod.GET) 
@ResponseBody
public boolean checkRname(String name) throws UnsupportedEncodingException {
	
	 String rname = new String(name.getBytes("iso8859-1"),"utf-8");
	Roles a=rolesMapper.selectRoleByName(rname);
	if(a==null) {
	return  true;
} else {return false;}
	}
//检验role重名
@RequestMapping(value="checkPname" ,method=RequestMethod.GET) 
@ResponseBody
public boolean checkPname(String name) throws UnsupportedEncodingException {
	
	 String pname = new String(name.getBytes("iso8859-1"),"utf-8");
	Powers a=powersMapper.selectPowerByPowerName(pname);
	if(a==null) {
	return  true;
} else {return false;}
	}

@RequestMapping(value="selectAdminByconditionByPage")
@ResponseBody
	public Object electCateByconditionByPage(@RequestParam("offset") String off, @RequestParam("limit") String lim,
			 String adminname)
			throws UnsupportedEncodingException {
		int offset = Integer.parseInt(off);
		// int cp=1;
		int pze = Integer.parseInt(lim);
		int cp = (offset - 1) * pze;
		// String caname = new String(name .getBytes("iso8859-1"),"utf-8");
		// String caname = name;
		HashMap<String, Object> map = new HashMap<>();
		
		
		map.put("startindex", cp);
		map.put("pagesize", pze);
		map.put("name", adminname);
		List<Admins> list = adminsMapper.selectAdminByConditionByPage(map);
		
		Bpage bpage = new Bpage();
		int aaa = adminsMapper.selectAdminCountByCondition(map);
		bpage.setRows(list);
		bpage.setTotal(aaa);

		JSONObject aa = JSONObject.fromObject(bpage);
		return aa;
	}

@RequestMapping(value="selectRoleByconditionByPage")
@ResponseBody
	public Object selectRoleByconditionByPage(@RequestParam("offset") String off, @RequestParam("limit") String lim,
			 String rolename)
			throws UnsupportedEncodingException {
		int offset = Integer.parseInt(off);
		// int cp=1;
		int pze = Integer.parseInt(lim);
		int cp = (offset - 1) * pze;
		// String caname = new String(name .getBytes("iso8859-1"),"utf-8");
		// String caname = name;
		HashMap<String, Object> map = new HashMap<>();
		
		
		map.put("startindex", cp);
		map.put("pagesize", pze);
		map.put("name", rolename);
		List<Roles> list = rolesMapper.selectRoleByConditionByPage(map);
		
		Bpage bpage = new Bpage();
		int aaa = rolesMapper.selectRoleCountByCondition(map);
		bpage.setRows(list);
		bpage.setTotal(aaa);

		JSONObject aa = JSONObject.fromObject(bpage);
		return aa;
	}

@RequestMapping(value="selectPowerByconditionByPage")
@ResponseBody
	public Object selectPowerByconditionByPage(@RequestParam("offset") String off, @RequestParam("limit") String lim,
			 String powername)
			throws UnsupportedEncodingException {
		int offset = Integer.parseInt(off);
		// int cp=1;
		int pze = Integer.parseInt(lim);
		int cp = (offset - 1) * pze;
		// String caname = new String(name .getBytes("iso8859-1"),"utf-8");
		// String caname = name;
		HashMap<String, Object> map = new HashMap<>();
		
		
		map.put("startindex", cp);
		map.put("pagesize", pze);
		map.put("name", powername);
		List<Powers> list = powersMapper.selectPowerByconditionByPage(map);
		
		Bpage bpage = new Bpage();
		int aaa = powersMapper.selectPowerCountByCondition(map);
		bpage.setRows(list);
		bpage.setTotal(aaa);

		JSONObject aa = JSONObject.fromObject(bpage);
		return aa;
	}




//国际化
@RequestMapping(value="testlocale") 
public String testlocale(Locale locale) {
		return "index";
}
}
