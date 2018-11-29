package com.xiangmu.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiangmu.dao.ProductsMapper;
import com.xiangmu.dao.ProvidersMapper;
import com.xiangmu.entity.Bpage;
import com.xiangmu.entity.Categorys;
import com.xiangmu.entity.Products;
import com.xiangmu.entity.Providers;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ProvidersController {
@Autowired	
ProvidersMapper providersMapper;
@Autowired
ProductsMapper productsMapper;
	
@RequestMapping("selectAllPe")
@ResponseBody
public Object selectAllPe(@RequestParam("offset") int offset,@RequestParam("limit") int limit){
	HashMap <String ,Integer> map=new HashMap<>();
	map.put("startindex", offset);
	map.put("pagesize", limit);
	List<Providers> list=providersMapper.selectProviderByPage(map);
	int a=providersMapper.selectCountPe();
	Bpage<Providers> bpage=new  Bpage<Providers>();
	bpage.setRows(list);
	bpage.setTotal(a);
	JSONObject aa=JSONObject.fromObject(bpage);
	return aa;
	}

//模糊查询
@RequestMapping("selectPeByConditionByPage")
@ResponseBody
public Object selectPeByConditionByPage(@RequestParam("cpage") int cpage,@RequestParam("limit") int limit
		,@RequestParam("pename") String name,@RequestParam("pid") int id){
	HashMap <String ,Object> map=new HashMap<>();
	Providers pe=new Providers(id,name);
	//int currentpage=Integer.parseInt(cpage);
	int offset=(cpage-1)*limit;
	System.out.println(cpage);
	map.put("startindex", offset);
	map.put("pagesize", limit);
	map.put("pe", pe);
	List<Providers> list=providersMapper.selectPeByConditionByPage(map);
	int a=providersMapper.selectCountPe();
	Bpage<Providers> bpage=new  Bpage<Providers>();
	bpage.setRows(list);
	bpage.setTotal(a);
	JSONObject aa=JSONObject.fromObject(bpage);
	return aa;
	}
//增加供应商
@RequestMapping("insertPe")
@ResponseBody
@Transactional
public String  insertPe(@RequestParam("pename")String pename,@RequestParam("peadd") String peadd,@RequestParam("petel") String petel
		,@RequestParam("peacount") String peacount,@RequestParam("peemail") String peemail){
	
	Providers pe=new Providers(pename, peadd, petel, peacount, peemail);
	
	int a=providersMapper.insertProvider(pe);
	if(a>0) {return "ok";}
	else {return "notok";  }
	
	
	}
//修改供应商
@RequestMapping("updatePe")
@ResponseBody
public String  updatePe(@RequestParam("pename")String pename,@RequestParam("peadd") String peadd,@RequestParam("petel") String petel
		,@RequestParam("peid")int peid,@RequestParam("peacount") String peacount,@RequestParam("peemail") String peemail){
	
	Providers pe=new Providers(peid,pename, peadd, petel, peacount, peemail);
	
	int a=providersMapper.updateProvider(pe);
	if(a>0) {return "ok";}
	else {return "notok";  }
	
	
	}
//删除供应商
@RequestMapping(value="deletePe",method = RequestMethod.DELETE)
@ResponseBody
public String  deletePe(@RequestParam("id")int id) {
	List<Products> pu=productsMapper.selectProductByPeId(id);
	if(pu.size()==0) {
	int a=providersMapper.deleteProviderById(id);
	if(a>0) {return "ok";}
	else {return "notok";}
	}
	else {return "use"; }
	
	
	}
//ajax判断重名
		@RequestMapping("checkPeName")
		@ResponseBody
		public Object checkPeName(@RequestParam("pename") String pename) throws UnsupportedEncodingException {
			String name = new String(pename .getBytes("iso8859-1"),"utf-8");
		Providers pe=	providersMapper.selectProviderByName(name);
		System.out.println(name);
		System.out.println(pe);
		if(pe==null) {return "true";}
		else{return "false";}
	  
	}

//初始化获得数组
@RequestMapping("selectAllPee")
@ResponseBody
public Object selectAllPe(){
	
	List<Providers> list=providersMapper.selectAllProvider();
	
	
	JSONArray aa=JSONArray.fromObject(list);
	return aa;
	}

//修改的初始化
@RequestMapping("selectPeById")
@ResponseBody
public Object selectPeById(@RequestParam("id") int id){
	
	Providers pe=providersMapper.selectProviderById(id);
	
	
	JSONObject aa=JSONObject.fromObject(pe);
	return aa;
	}
}