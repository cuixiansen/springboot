package com.xiangmu.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiangmu.dao.CategoryMapper;

import com.xiangmu.entity.Categorys;
import com.xiangmu.entity.Bpage;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.jsqlparser.expression.JsonExpression;

/**
 * Servlet implementation class CateServlet
 */
@WebServlet("/cateServlet")
public class CateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApplicationContext a;
	private CategoryMapper catemapper;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String op=(String)request.getParameter("op");
		if(op.equals("showCateByPage")) {
			showCateByPage(request,response);
		}
		
	}

	private void showCateByPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int  offset=Integer.parseInt(request.getParameter("offset"));
		//int cp=1;
		  int pze=Integer.parseInt( request.getParameter("limit"));
		  int cp=offset/pze+1;
	ApplicationContext  a=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	CategoryMapper  catemapper=(CategoryMapper)a.getBean("categoryMapper");
	  
		PageHelper.startPage(cp,pze);
		 Bpage bpage= new Bpage();
		 HashMap map=	new HashMap<String, Integer>();
		 map.put("startindex", offset);
			map.put("pagesize", pze);
		 /* bpage.setRows(p.getList());
		  bpage.setTotal(p.getRecordCount());*/
		List<Categorys> list=catemapper.selectCateByPage(map);
		int aaa=catemapper.selectCount();
		bpage.setRows(list);
		bpage.setTotal(aaa);
		
		 JSONObject aa= JSONObject.fromObject(bpage);;
		response.getWriter().print(aa);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
