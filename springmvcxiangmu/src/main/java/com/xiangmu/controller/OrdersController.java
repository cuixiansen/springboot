package com.xiangmu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiangmu.dao.CustomersMapper;
import com.xiangmu.dao.EmployeesMapper;
import com.xiangmu.dao.OrderdetailsMapper;
import com.xiangmu.dao.OrdersMapper;
import com.xiangmu.dao.ProductsMapper;
import com.xiangmu.entity.Bpage;
import com.xiangmu.entity.Customers;
import com.xiangmu.entity.Employees;
import com.xiangmu.entity.Help;
import com.xiangmu.entity.OrderDetail;
import com.xiangmu.entity.Orders;
import com.xiangmu.entity.Products;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class OrdersController {
	@Autowired
	OrdersMapper ordersMapper;
	@Autowired
	OrderdetailsMapper orderdetailsMapper;
	@Autowired
	EmployeesMapper employeesMapper;                               
	@Autowired
	CustomersMapper customersMapper;
	@Autowired
	ProductsMapper productsMapper;
	//增加
	//@Transactional(rollbackFor={RuntimeException.class, Exception.class})
	
@RequestMapping("insertOrder")
@ResponseBody

public String insertOrder(String ordernum,String odate,int cussc,int empsc,@RequestParam("ordernumber") List<Integer>ordernumber
		,@RequestParam("pusce") List<Integer> pusce,@RequestParam("select") List<Integer> select) {
	List<Integer> list=new ArrayList<>();
	String ss="notok";
	Orders a=new Orders(ordernum, odate, new Customers(cussc), new Employees(empsc));
	int aa=ordersMapper.insertOrders(a);
	if(aa>0) {
		List<OrderDetail> od=new ArrayList();
		for(int i=1;i<pusce.size();i++) {
			
				OrderDetail orderdetail=	new OrderDetail(new Orders(ordernum), new Products(pusce.get(i).intValue()), ordernumber.get(i).intValue(), select.get(i).intValue());
				int b=orderdetailsMapper.insertOrderdetail(orderdetail);
				list.add(b);	
		}
		for(int j:list) {
			if(j>0) {ss="ok";}
			else {ss="notok";break;}
		}
	}return ss;	
}
//将 订单号，还有所有的customer，employee放在一起，传过去
@RequestMapping("getthreeinfo")
@ResponseBody
public Object getthreeinfo() {
	List<Employees> a=employeesMapper.selectAllEmployee();
	List<Customers> b=customersMapper.selectAllCustomer();
	List<Products>  c=productsMapper.selectAllProduct();
	String orderid=Help.gettimetostr();
	Object [] arr=new Object[4];
	arr[0]=c;
	arr[1]=a;
	arr[2]=b;
	arr[3]=orderid;
	JSONArray d=JSONArray.fromObject(arr);
	return d;
}
//初始表显示
@RequestMapping("selectAllOrderByPage")
@ResponseBody
public Object selectAllOrder(int offset,int limit) {
	Map <String,Integer> map=new HashMap<String,Integer>();
	map.put("startindex", offset);
	map.put("pagesize",limit);
	List<Orders> list=ordersMapper.selectAllOrderByPage(map);
	int a=ordersMapper.selectOrderCount();
	Bpage bpage=new Bpage();
	bpage.setRows(list);
	bpage.setTotal(a);
	JSONObject aa=JSONObject.fromObject(bpage);
	return aa;
}
//订单详情显示的初始化表单
@RequestMapping(value="selectOrderdetailById" ,produces="application/json;charset=UTF-8")
@ResponseBody
public Object selectOrderdetailById(@RequestParam("cpage")String cpage,int limit,String orderid) {
	Map <String,Object> map=new HashMap<String,Object>();
	System.out.println(cpage+"============================");
	int currentpage=Integer.parseInt(cpage);
	int offset=(currentpage-1)*limit;
	map.put("startindex", offset);
	map.put("pagesize",limit);
	map.put("id", orderid);
	List<OrderDetail> list=orderdetailsMapper.selectOrderDetailByOrderidByPage(map);
	int a=orderdetailsMapper.selectOrderDetailCountByOrderid(orderid);
	Bpage bpage=new Bpage();
	bpage.setRows(list);
	bpage.setTotal(a);
	System.out.println(bpage);
	JSONObject aa=JSONObject.fromObject(bpage);
	return aa.toString();
}
//修改的前一个框的方法
@RequestMapping(value="updateOrder")
@ResponseBody
public Object updateOrder(String orderid) {
	List<Employees> emp=employeesMapper.selectAllEmployee();
	Orders order=ordersMapper.selectAllOrderById(orderid);
	JSONObject aa=JSONObject.fromObject(order);
	return aa;
}
//修改的第二个框要用到的数据
@RequestMapping(value="updateOrderDetail",produces="application/json;charset=UTF-8")
@ResponseBody          
public String  updateOrderDetail(String orderid) {
	System.out.println(orderid+"==========================");
	List<Products>  pulist=productsMapper.selectAllProduct();
	List<OrderDetail> od=orderdetailsMapper.selectOrderDetailByOrderid(orderid);
	
	Object[]obj= {pulist,orderid,od};
	
	JSONArray d=JSONArray.fromObject(obj);
	return d.toString();
}
//初始化用的方法
@RequestMapping("chushihua")
@ResponseBody
public Object chushihua() {
	List<Employees>elist=employeesMapper.selectAllEmployee();
	List<Customers> cuslist=customersMapper.selectAllCustomer();
	List<Products>  pulist=productsMapper.selectAllProduct();
	
	Help aaa=new Help ();
	String ordernum=aaa.gettimetostr();
	Object[]obj= {pulist,elist,cuslist,ordernum};
	JSONArray aa=JSONArray.fromObject(obj);
	return aa;
}
//确定修改的方法 前一张表
@RequestMapping("sureupdate")
@ResponseBody
public Object chuxhihua(int esc,String orderid,String orderdate) {
	int b= ordersMapper.updateOrder(new Orders(orderdate, new Employees(esc),orderid));
	if(b>0) {
		return"ok";
	}else {return"notok";}
	
}
//确定修改的方法 第二张表
@RequestMapping("sureupdateOrderDetail")
@ResponseBody

public Object sureupdateOrderDetail(@RequestParam("opusce") List<Integer> opusce,@RequestParam("number") List<Integer> number
		,@RequestParam("select") List<Integer> select,String o_orderid) {
	List<Integer> list=new ArrayList<>();
	String ss="notok";
	
	OrderDetail [] od=new OrderDetail [opusce.size()-1];
	for (int i=1;i<opusce.size();i++) {
		
	od[i-1]=new OrderDetail(new Orders(o_orderid),new Products(opusce.get(i)),number.get(i),select.get(i));
	
}
	//先删除所有再添加
	int a=orderdetailsMapper.deleteOrderDetail(o_orderid);
	for (int i=0;i<od.length;i++) {
		int b=orderdetailsMapper.insertOrderdetail(od[i]);
		list.add(b);
	}
	//判断list里面是不是全为1，是一就让ss变为ok
	for(int j:list) {
		if(j>0) {ss="ok";}
		else {ss="notok";break;}
	}
	if(a>0) {
		
		if(ss=="ok") {
			return ss;
	}else {return ss ;}}
	
	return ss;
}
//模糊查询
@RequestMapping(value="selectOrderByConditionByPage" , produces="application/json;charset=UTF-8")
@ResponseBody
public Object selectOrderByConditionByPage(String orderid,int cusid,int empid,int offset,int limit) {
	Map <String,Object> map=new HashMap<String,Object>();
	map.put("startindex", offset);
	map.put("pagesize",limit);
	Orders o=new Orders(orderid, new Customers(cusid),new Employees(empid));
	map.put("order", o);
	List<Orders> list=ordersMapper.selectOrderByConditionByPage(map);
	//作模糊查询用户数量
	int a=ordersMapper.selectOrderCountByCondition(map);
	Bpage bpage=new Bpage();
	bpage.setRows(list);
	bpage.setTotal(a);
	JSONObject aa=JSONObject.fromObject(bpage);
	return aa;
	
}
@RequestMapping(value="deleteOrder" )
@ResponseBody
public String  deleteOrder(String orderid) {
	int a=ordersMapper.deleteOrder(orderid);
	if(a>0) {
	int b=	orderdetailsMapper.deleteOrderDetail(orderid);
	if(b>0) {
		return "ok";
		
	}else {return "notok";}
	}else {return "notok";}
	
	
}

}
