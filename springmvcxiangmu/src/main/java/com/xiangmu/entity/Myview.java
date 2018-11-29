package com.xiangmu.entity;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.servlet.view.document.AbstractExcelView;

@SuppressWarnings("deprecation")
@Component
public class Myview extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map<String, Object> modle, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		List<Categorys> list=(List<Categorys>)modle.get("excel");
		String filename="java0718cate.xls";
		HSSFSheet sheet=workbook.createSheet("菜單信息");
		
		 response.setContentType("application/vnd.ms-excel;charset=utf-8");
         response.setCharacterEncoding("utf-8");

         // 对文件名进行处理。防止文件名乱码
       //s  String fileName = CharEncodingEdit.processFileName(request, "合同.xls");
         // Content-disposition属性设置成以附件方式进行下载
         response.setHeader("Content-disposition", "attachment;filename=" + new String(filename.getBytes()));
		
		
		
		HSSFRow  row=sheet.createRow(0);
		row.createCell(0).setCellValue("id");
		row.createCell(1).setCellValue("目錄名");
		row.createCell(2).setCellValue("备注");
		int i=1;
		for (Categorys c:list) {
			HSSFRow  title=sheet.createRow(i);
			title.createCell(0).setCellValue(c.getCgID());
			title.createCell(1).setCellValue(c.getCg_name());
			title.createCell(2).setCellValue(c.getCg_desc());
			i++;
		}
		OutputStream os=response.getOutputStream();
	workbook.write(os);
		os.flush();
		os.close();
	}
	

}
