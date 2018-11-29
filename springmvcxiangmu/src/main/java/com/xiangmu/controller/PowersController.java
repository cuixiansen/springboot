package com.xiangmu.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiangmu.dao.AdminsMapper;
import com.xiangmu.dao.PowersMapper;
import com.xiangmu.entity.Bpage;
import com.xiangmu.entity.Navi;
import com.xiangmu.entity.Powers;
import com.xiangmu.entity.Roles;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class PowersController {
	@Autowired
	PowersMapper powersMapper;
	@Autowired
	AdminsMapper admonsMapper;
	
	@RequestMapping(value="selectAllPowers" , produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object selectUser() {
		
		List<Powers> list= powersMapper.selectAllPowers();

		JSONArray aa = JSONArray.fromObject(list);
		return aa;	
	}
	

@RequestMapping(value="showpower" )

public String showpower() {
	
	
	return 	"showpower";
}
//分页显示
@RequestMapping(value="selectPowerByPage" , produces="application/json;charset=UTF-8")
@ResponseBody
public Object selectPowerByPage(int offset,int limit) {
	HashMap<String,Integer> map=new HashMap<>();
	map.put("startindex", offset);
	map.put("pagesize", limit);
	List<Powers> list= powersMapper.selectPowersByPage(map);
	
	
	Bpage bpage = new Bpage();
	int aaa = powersMapper.selectPowerCount();
	bpage.setRows(list);
	bpage.setTotal(aaa);

	JSONObject aa = JSONObject.fromObject(bpage);
	return aa;	
}
@RequestMapping(value="selectpowersByPowerId" , produces="application/json;charset=UTF-8")
@ResponseBody
public Object selectpowersByPowerId(int id) {
	Powers a= powersMapper.selectPowerByPowerId(id);
	JSONObject aa = JSONObject.fromObject(a);
	return aa;	
}
@RequestMapping(value="updatePower" )
@ResponseBody
public Object updatePower(String powername ,String url,int id,String isNavi,String powercode) {
	//判断为空就设置为零
	if(isNavi==null) {isNavi="0";}
	 int isNavi1=Integer.parseInt(isNavi);
	Powers a=new Powers(id, powername, isNavi1, powercode, url);
	int b=powersMapper.updatePower(a);
	if(b>0) {return "ok";}
	else {return "notok";}
}
@RequestMapping(value="selectFirstNavi" )
@ResponseBody
public Object selectFirstNavi() {
	List<Navi> list= admonsMapper.getFirstNavi() ;
	JSONArray a =JSONArray.fromObject(list);
	return a;
}
@RequestMapping(value="insertPower" )
@ResponseBody
public Object insertPower(String powername ,String url,int pNavi,String isNavi,String powercode) {
	if(isNavi==null) {isNavi="0";}
	 int isNavi1=Integer.parseInt(isNavi);
	Powers a=new Powers(powername, isNavi1, pNavi, powercode, url);
	int b=powersMapper.insertPower(a);
	if(b>0) {return "ok";}
	else {return "notok";}
}
@RequestMapping(value="deletePower" )
@ResponseBody
public Object deletePower(int id) {
	
	int b=powersMapper.deletePower(id);
	if(b>0) {return "ok";}
	else {return "notok";}
}

}

