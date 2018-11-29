package com.xiangmu.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiangmu.dao.CategoryMapper;
import com.xiangmu.dao.ProductsMapper;
import com.xiangmu.dao.ProvidersMapper;
import com.xiangmu.entity.Bpage;
import com.xiangmu.entity.Categorys;
import com.xiangmu.entity.Products;
import com.xiangmu.entity.Providers;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ProductsController {
	@Autowired
	ProductsMapper productsMapper;
	@Autowired
	ProvidersMapper providersMapper;
	@Autowired
	CategoryMapper categoryMapper;
	//初始表
	@RequestMapping("selectAllpu")
	@ResponseBody
	public Object selectAllpu(@RequestParam("offset") int offset,@RequestParam("limit") int limit) {
		HashMap<String ,Object> map=new HashMap(); 
		//int offset=(pze-1)*limit;
		map.put("startindex", offset);
		map.put("pagesize",limit);
		List<Products>list=productsMapper.selectProductByPage(map);
		
		int count=productsMapper.selectPuCount();
		Bpage<Products> bpage=new Bpage<Products>();
		bpage.setRows(list);
		bpage.setTotal(count);
		System.out.println(bpage);
		JSONObject a=JSONObject.fromObject(bpage);
		return a;
	}
	//模糊查询 
	@RequestMapping("selectPuByCondition")
	@ResponseBody
	public Object selectPuByCondition(@RequestParam("cpage") int cpage,@RequestParam("limit") int limit
			,@RequestParam("puname") String puname ,@RequestParam("pid") int pid,@RequestParam("cid") int cid) {
		HashMap<String ,Object> map=new HashMap(); 
		int offset=(cpage-1)*limit;
		Products pu=new Products(puname, new Providers(pid), new Categorys(cid));
		map.put("startindex", offset);
		map.put("pagesize",limit);
		map.put("pu", pu);
		List<Products>list=productsMapper.selectProductByConditionByPage(map);
		int count=productsMapper.selectPuCountByCondition(map);
		Bpage<Products> bpage=new Bpage<Products>();
		bpage.setRows(list);
		bpage.setTotal(count);
		System.out.println(bpage);
		JSONObject a=JSONObject.fromObject(bpage);
		return a;
	}
	//将初始化要用到的数组都放进来，用一个方法(目录和供应商)
	@RequestMapping("allList")
	@ResponseBody
	public Object allList() {
		HashMap<String ,Object> map=new HashMap(); 
		//int offset=(pze-1)*limit;
		Object [] a=new Object[2];
		
		List<Providers> pelist=providersMapper.selectAllProvider();
		List<Categorys> calist=categoryMapper.selectAllCate();
		a[1]=pelist;
		a[0]=calist;
		JSONArray array=JSONArray.fromObject(a);
		return array;
	}
	//检验重名
	@RequestMapping("selectProductByName")
	@ResponseBody
	public String  selectProductByName(@RequestParam("puname") String name) throws UnsupportedEncodingException {
		String puname = new String(name .getBytes("iso8859-1"),"utf-8");
		Products pu=productsMapper. selectProductByName(puname);
		
		if(pu==null) {
			return "true";
		}
		else{return "false";}
	}
	//增加产品
	@RequestMapping("insertPu")
	@ResponseBody
	public String  insertPu(@RequestParam("pruname") String name,@RequestParam("prename") int peid,@RequestParam("num") int quantity
			,@RequestParam("inprice") double inprice,@RequestParam("outprice") double outprice,@RequestParam("cateid") int cateid,@RequestParam("indate") String indate	) throws UnsupportedEncodingException {
		
		Products pu= new Products(name, inprice, outprice, new Providers(peid), new Categorys(cateid), quantity,indate);
				int a=productsMapper.insertProduct(pu);
		
		if(a>0) {
			return "ok";
		}
		else{return "notok";}
	}
	//修改产品
		@RequestMapping("updatePu")
		@ResponseBody
		public String  updatePu(@RequestParam("puid") int puid,@RequestParam("puname") String name,@RequestParam("pename") int peid,@RequestParam("count") int quantity
				,@RequestParam("inp") double inprice,@RequestParam("outp") double outprice,@RequestParam("kind") int cateid,@RequestParam("intime") String indate	) throws UnsupportedEncodingException {
			
			Products pu= new Products(puid,name, inprice, outprice, new Providers(peid), new Categorys(cateid), quantity,indate);
					int a=productsMapper.updateProduct(pu);
			
			if(a>0) {
				return "ok";
			}
			else{return "notok";}
		}
		//修改产品
				@RequestMapping("selectPuById")
				@ResponseBody
				public Object  updatePu(@RequestParam("id") int puid) {
					//Products pu= new Products(puid,name, inprice, outprice, new Providers(peid), new Categorys(cateid), quantity,indate);
					Products pu=productsMapper.selectProductById(puid);
					JSONObject aa=JSONObject.fromObject(pu);
					return aa;
					
					
					
				}
//删除产品 没做完，还有跟订单的联动，先这样对付一下，只能删除订单里没用到的产品
@RequestMapping("deletePu")
@ResponseBody
	public Object deletePu(@RequestParam("id") int id) {
		//Products pu= new Products(puid,name, inprice, outprice, new Providers(peid), new Categorys(cateid), quantity,indate);
		int a =productsMapper.deleteProductById(id);
		if(a>0) {return "ok";}
		else {return "use";}			
					
					
				}
			

}
