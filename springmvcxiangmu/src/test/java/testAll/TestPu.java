package testAll;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xiangmu.dao.ProductsMapper;
import com.xiangmu.entity.Categorys;
import com.xiangmu.entity.Products;
import com.xiangmu.entity.Providers;



public class TestPu {
	private SqlSessionFactory myfactory;
	private ApplicationContext a;	
	@Autowired	
	ProductsMapper productsMapper;
//		@Before
//
//		public void before() throws IOException {
//			a=new ClassPathXmlApplicationContext("spring-mybatis.xml");
//			myfactory=(SqlSessionFactory)a.getBean("sqlSessionFactory");
//			/*Reader reader=Resources.getResourceAsReader("SqlmapConfig.xml");
//			myfactory=new SqlSessionFactoryBuilder().build(reader);**/
//			 /*SqlSession session=myfactory.openSession();
//			 System.out.println(session);*/
//		}
	 @Test
	 public void SelectCateByCateid() {
		 SqlSession session=myfactory.openSession();
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		ProductsMapper mapper= session.getMapper(ProductsMapper.class);
		Products pu=mapper.selectProductById(1);
        System.out.println(pu);
		
	 }
	 @Test
	 public void testSelectCateByCondition() {
		 SqlSession session=myfactory.openSession();
		Products pu=new Products (new Providers(0),new Categorys(0));
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		 ProductsMapper mapper= session.getMapper(ProductsMapper.class);
		List<Products> list=mapper.selectProductByCondition(pu);
        System.out.println(list);
		
	 }
	@Test
	 public void SelectAllCates() {
		 SqlSession session=myfactory.openSession();
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		ProductsMapper catemapper= session.getMapper(ProductsMapper.class);
		List<Products> list=catemapper.selectAllProduct();
        System.out.println(list);
		
	 }
	/* @Test
	 public void testSelectCateByArray() {
		 SqlSession session=myfactory.openSession();
		 int [] a= {1,2,3};
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		ProductsMapper catemapper= session.getMapper(ProductsMapper.class);
		List<Products> list=catemapper.(a);
        System.out.println(list);
		
	 }*/
	 @Test
	 public void SelectAllCatesbypage() {
		 SqlSession session=myfactory.openSession();
		 HashMap map=new HashMap<String ,Integer>();
		 map.put("startindex", 5);
			map.put("pagesize", 5);
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		ProductsMapper catemapper= session.getMapper(ProductsMapper.class);
		List<Products> list=catemapper.selectProductByPage(map);
        System.out.println(list);
		
	 }
	 @Test
	 public void insertcate() {
//		 SqlSession session=myfactory.openSession();
//		// System.out.println(session);
//		 Products pu=new Products("111", 11, 1, new Providers(1), new Categorys(1), 1);
//		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
//		ProductsMapper catemapper= session.getMapper(ProductsMapper.class);
//		int a=catemapper.insertProduct(pu);
//		session.commit();
//        System.out.println(a);
		
		 List<Products> pu= productsMapper.selectProductByCateId(100);
		  System.out.println(pu.size());
	 }
	 @Test
	 public void deletecate() {
		 SqlSession session=myfactory.openSession();
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		ProductsMapper catemapper= session.getMapper(ProductsMapper.class);
		int a=catemapper.deleteProductById(15);
		//session.commit();
        System.out.println(a);
        
		
	 }
	 @Test
	 public void updatecate() {
		 SqlSession session=myfactory.openSession();
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		ProductsMapper catemapper= session.getMapper(ProductsMapper.class);
		int a=catemapper.updateProduct(new Products(1,"111", 11, 1, new Providers(1), new Categorys(1), 1));
		//session.commit();
        System.out.println(a);
        
		
	 }
}

