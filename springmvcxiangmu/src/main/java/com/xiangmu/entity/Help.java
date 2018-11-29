package com.xiangmu.entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;





public class Help {
//	private static String url;
//	private static String user;
//	private static  String password;
//	//private static  String driver;
//	static {
//		/*List<Element> list=new ParseXml().getList();
//		url=list.get(0).getText();
//		user=list.get(1).getText();
//		password=list.get(2).getText();*/
//		ResourceBundle bu=ResourceBundle.getBundle("db");
//		url=bu.getString("url");
//		user=bu.getString("user");
//		password=bu.getString("password");
//		//driver="oracle.jdbc.driver.OracleDriver";
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//	}
//	
//public  static Connection getConnection() {
//	try {
//		return DriverManager.getConnection(url, user, password);
//	} catch (SQLException e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}return null;
//} 
 public static String gettimetostr() {
	 Date date=new Date();
	 SimpleDateFormat a= new SimpleDateFormat("yyyyMMddhhmmssms");
	 return  a.format(date);
 }

}
