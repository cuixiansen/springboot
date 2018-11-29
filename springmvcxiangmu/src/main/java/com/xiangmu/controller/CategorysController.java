package com.xiangmu.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.MultipartFilter;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiangmu.dao.CategoryMapper;
import com.xiangmu.dao.ProductsMapper;
import com.xiangmu.entity.Bpage;
import com.xiangmu.entity.Categorys;
import com.xiangmu.entity.CheckResult;
import com.xiangmu.entity.Products;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class CategorysController {
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private ProductsMapper productsMapper;
//初始表的显示数据
	@RequestMapping(value = "selectCateByPage", method = RequestMethod.GET)
	@ResponseBody
	public Object selectCateByPage(@RequestParam("offset") String off, @RequestParam("limit") String lim) {
		int offset = Integer.parseInt(off);
		// int cp=1;
		int pze = Integer.parseInt(lim);
		int cp = offset / pze + 1;
		// ApplicationContext a=new
		// ClassPathXmlApplicationContext("spring-mybatis.xml");
		// CategoryMapper catemapper=(CategoryMapper)a.getBean("categoryMapper");

		PageHelper.startPage(cp, pze);
		Bpage bpage = new Bpage();
		HashMap map = new HashMap<String, Integer>();
		map.put("startindex", offset);
		map.put("pagesize", pze);
		/*
		 * bpage.setRows(p.getList()); bpage.setTotal(p.getRecordCount());
		 */
		List<Categorys> list = categoryMapper.selectCateByPage(map);
		int aaa = categoryMapper.selectCount();
		bpage.setRows(list);
		bpage.setTotal(aaa);

		JSONObject aa = JSONObject.fromObject(bpage);
		
		return aa;
	}
//模糊查询
@RequestMapping(value="selectCateByconditionByPage")
@ResponseBody
	public Object electCateByconditionByPage(@RequestParam("offset") String off, @RequestParam("limit") String lim,
			@RequestParam("caname") String caname, @RequestParam("cid") String cid)
			throws UnsupportedEncodingException {
		int offset = Integer.parseInt(off);
		// int cp=1;
		int pze = Integer.parseInt(lim);
		int cp = (offset - 1) * pze;
		// String caname = new String(name .getBytes("iso8859-1"),"utf-8");
		// String caname = name;
		HashMap<String, Object> map = new HashMap<>();
		HashMap<String, Integer> pmap = new HashMap<>();
		int id = Integer.parseInt(cid);
		Categorys c = new Categorys(id, caname);
		map.put("startindex", cp);
		map.put("pagesize", pze);
		map.put("cate", c);
		List<Categorys> list = categoryMapper.selectCateByConditionByPage(map);
		// PageInfo<Categorys> calist= new PageInfo<Categorys>(list);
		/*
		 * System.out.println(list); System.out.println(map.get("startindex"));
		 */


		/*
		 * bpage.setRows(p.getList()); bpage.setTotal(p.getRecordCount());
		 */
		System.out.println(list);
		System.out.println(c.getCgID() + "====================" + caname);
		Bpage bpage = new Bpage();
		int aaa = categoryMapper.selectCountByCondition(map);
		bpage.setRows(list);
		bpage.setTotal(aaa);

		JSONObject aa = JSONObject.fromObject(bpage);
		return aa;
	}
//得到所有的目录对象
	@RequestMapping("selectAllCate")
	@ResponseBody
	public Object selectAllCate() {
		List<Categorys> list = categoryMapper.selectAllCate();
		JSONArray catelist = JSONArray.fromObject(list);
		//System.out.println(catelist);
		return catelist;
  
}
	
	//修改
	@RequestMapping(value="updateCate" ,method = RequestMethod.PUT)
	@ResponseBody
		public String  updateCate(@RequestParam("ctid") int id,@RequestParam("catename") String name, @RequestParam("ctbeizhu") String desc)
				throws UnsupportedEncodingException {
		Categorys cate=new Categorys(id, name, desc);
		 int a=categoryMapper.updateCate(cate);
		 System.out.println(a);
			if(a>0) {
			return "ok";}
			else {return "notok";}
	  
	}

//得到目录对象byid
	@RequestMapping("findCateById" )
	@ResponseBody
	public Object findCateById(@RequestParam("id") int id) {
		Categorys cate= categoryMapper.selectCateById(id);
		JSONObject a = JSONObject.fromObject(cate);
		//System.out.println(catelist);
		return a;

}
	
//增加目录	
	@RequestMapping(value="insertCate")
	@ResponseBody
		public String  insertCate(@RequestParam("catename1") String name, @RequestParam("catebeizhu1") String desc)
				throws UnsupportedEncodingException {
		Categorys cate=new Categorys(name, desc);
		 int a=categoryMapper.insertCate(cate);
		 System.out.println(a);
			if(a>0) {
			return "success";}
			else {return "添加失败";}
	  
	}
	//删除目录	
		@RequestMapping(value="deleteCate" , method = RequestMethod.DELETE)
		@ResponseBody
			public String  deleteCate(@RequestParam("id") int id)
					throws UnsupportedEncodingException {
		    List<Products> pu= productsMapper.selectProductByCateId(id);
		    System.out.println(productsMapper);
		    if(pu.size()==0) {
			 int a=categoryMapper.deleteCateById(id);
			 System.out.println(a);
				if(a>0) {
				return "success";}
				else {return "添加失败";}
		  
		}else {return "use";}
		    }
//ajax 请求验证重名	
		@RequestMapping(value="checkCanameByAjax")
		@ResponseBody
			public String  checkCanameByAjax(@RequestParam("catename") String name)
					throws UnsupportedEncodingException {
			String caname = new String(name .getBytes("iso8859-1"),"utf-8");
		Categorys cate=categoryMapper.selectCateByName(caname);
		System.out.println(caname);
		if(cate==null) {
			return "true";
		}else {return "false";}
		  
		}	
	
	
	

//下载excl表格
@RequestMapping("getCateByExcl")

	public String getCateByExcl(Map<String, Object> map) {
		List<Categorys> list = categoryMapper.selectAllCate();

		map.put("excel", list);
		return "myview";

	}
//导入excl表格并导入数据库，未完成
	@RequestMapping(value = "uplodeCateByExcl", method = RequestMethod.POST)
	@ResponseBody
	public String uplodeCateByExcl(@RequestParam("myfile") MultipartFile file) {
		if (!file.isEmpty()) {
			CheckResult a = new CheckResult();
			List<Categorys> list = new ArrayList<Categorys>();
			List<String> allname = categoryMapper.selectAllCateName();
			Map<Integer, String> map = new HashMap<Integer, String>();
			try {
				String filename = file.getOriginalFilename();
				// file.transferTo(new File("D:/java0718/"+file.getOriginalFilename()));
				if (filename.substring(filename.lastIndexOf(".") + 1).equals("xls")) {
					HSSFWorkbook hb = new HSSFWorkbook(file.getInputStream());
					HSSFSheet sheet = hb.getSheetAt(0);

					// String name=null;
					// String desc=null;
					for (int i = 1; i <= sheet.getLastRowNum(); i++) {
						HSSFRow row = sheet.getRow(i);
						for (int j = 0; j < sheet.getRow(i).getLastCellNum(); j++) {
							row.getCell(j).setCellType(CellType.STRING);
							// System.out.print(row.getCell(j).getStringCellValue()+" ");
						}
						System.out.println();
						Categorys cate = new Categorys(row.getCell(1).getStringCellValue(),
								row.getCell(2).getStringCellValue());
						String checkinf = cate.check();

						if (checkinf != null) {
							// 有错的时候
							map.put(Integer.parseInt(row.getCell(0).getStringCellValue()), checkinf);

						} else {
							if (allname.contains(cate.getCg_name())) {
								map.put(Integer.parseInt(row.getCell(0).getStringCellValue()), "名字重复");
							} else {
								list.add(cate);
							}
						}

					}

				}

				a.setOkcount(list.size());
				a.setErrcount(map.size());
				a.setErrors(map);
				System.out.println(a);
				return a.toString();

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "false";
			}
		}

		return "true";
  
}


}
