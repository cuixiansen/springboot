package testAll;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiangmu.dao.CategoryMapper;
import com.xiangmu.entity.Categorys;






public class TestAll {
	private SqlSessionFactory myfactory;
	private ApplicationContext a;
	private CategoryMapper ca;
	
	
	
	@Before

	public void before() throws IOException {
	 a=new ClassPathXmlApplicationContext("spring-mybatis.xml");
		myfactory=(SqlSessionFactory)a.getBean("sqlSessionFactory");
			ca=(CategoryMapper)a.getBean("categoryMapper");
		
	}
//----------================categorys==================------------------
	/* @Test
	 public void SelectCateByCateid() {
		 SqlSession session=myfactory.openSession();
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		CategorysMapper catemapper= session.getMapper(CategorysMapper.class);
		Categorys cate=catemapper.selectByPrimaryKey(1);
        System.out.println(cate);
		
	 }
	 @Test
	 public void SelectCateByCateidspring() {
		 //SqlSession session=myfactory.openSession();
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		//CategorysMapper catemapper= session.getMapper(CategorysMapper.class);
		Categorys cate=ca.selectByPrimaryKey(1);
        System.out.println(cate);
		
	 }
	 @Test
	 public void SelectCate() {
		 SqlSession session=myfactory.openSession();
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		CategorysMapper catemapper= session.getMapper(CategorysMapper.class);
		CategorysExample example= new CategorysExample();
		Criteria c=	example.createCriteria();
		//c.andCategoryNameEqualTo("ˮ��");
		//c.andCategoryNameLike("ˮ��");
		List<Categorys> catelist=catemapper.selectByExampleWithBLOBs(example);
        System.out.println(catelist);
		
	 }
	 @Test
	 public void updateCate() {
		 SqlSession session=myfactory.openSession();
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		CategorysMapper catemapper= session.getMapper(CategorysMapper.class);
		CategorysExample example= new CategorysExample();
		Criteria c=example.createCriteria();
		c.andCategoryidEqualTo(1);
		Categorys record =new Categorys("������","�Լ��ֵ�");
		int a=catemapper.updateByExampleSelective(record, example);
		
		
        System.out.println(a);
		
	 }
	 @Test
	 public void insertCate() {
		 SqlSession session=myfactory.openSession();
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		CategorysMapper catemapper= session.getMapper(CategorysMapper.class);
		CategorysExample example= new CategorysExample();
		Criteria c=example.createCriteria();
		c.andCategoryidEqualTo(1);
		Categorys record =new Categorys("������","�Լ��ֵ�");
		int a=catemapper.insertSelective(record);
		
		session.commit();
        System.out.println(a);
		
	 }


@Test
public void deleteCate() {
	 SqlSession session=myfactory.openSession();
	// System.out.println(session);
	                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
	CategorysMapper catemapper= session.getMapper(CategorysMapper.class);
	CategorysExample example= new CategorysExample();
	Criteria c=example.createCriteria();
	c.andCategoryidEqualTo(1);
	Categorys record =new Categorys("������","�Լ��ֵ�");
	int a=catemapper.deleteByPrimaryKey(3);

	//session.commit();
   System.out.println(a);
	
}*/
@Test
public void selectAllCate() {
	//ApplicationContext a=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	//myfactory=(SqlSessionFactory)a.getBean("sqlSessionFactory");
	 a=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	 CategoryMapper  catemapper=(CategoryMapper)a.getBean("categoryMapper");
	  
		
		List<Categorys> list=catemapper.selectAllCate();
		//PageInfo<Categorys> calist= new PageInfo<Categorys>(list);
	System.out.println(list);
	//session.commit();
  
}
@Test
public void selectCatesByPage() {
	ApplicationContext a=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	//myfactory=(SqlSessionFactory)a.getBean("sqlSessionFactory");
	 a=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	 CategoryMapper  catemapper=(CategoryMapper)a.getBean("categoryMapper");
	 HashMap<String,Object> map=new HashMap<>();
	 HashMap<String,Integer> pmap=new HashMap<>();
	Categorys c=new Categorys ("水");
	pmap.put("startindex",1);
	pmap.put("pagesize",5);
	
	map.put("pmap", pmap);
	//map.put("cate", c);
	//int aaa=catemapper.selectCountByCondition("果");
		
		List<Categorys> list=catemapper.selectCateByPage(map);
		//PageInfo<Categorys> calist= new PageInfo<Categorys>(list);
	//System.out.println(aaa);
	//session.commit();
  
}
@Test
public void selectCateByconditionByPage() {
	ApplicationContext a=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	//myfactory=(SqlSessionFactory)a.getBean("sqlSessionFactory");
	 a=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	 CategoryMapper  catemapper=(CategoryMapper)a.getBean("categoryMapper");
	 HashMap<String,Object> map=new HashMap<>();
	 HashMap<String,Integer> pmap=new HashMap<>();
	Categorys c=new Categorys (1);
	map.put("startindex",1);
	map.put("pagesize",5);
	/*map.put("cgID",0);
	map.put("cg_name","");*/
	     
		
	map.put("cate", c);
	
		
		List<Categorys> list=catemapper.selectCateByConditionByPage(map);
		//PageInfo<Categorys> calist= new PageInfo<Categorys>(list);
		int aaa=catemapper.selectCountByCondition(map);
	System.out.println(list);
	System.out.println(aaa);
	//session.commit();
  
}
/*@Test
public void deleteCate(int a) throws IOException {
	Reader r=Resources.getResourceAsReader("SqlmapConfig.xml");
	SqlSessionFactory f=new SqlSessionFactoryBuilder().build(r);
	SqlSession Session =f.openSession();
	CategorysMapper m=Session.getMapper(CategorysMapper.class);
	
}*/

//-------=============provider============--------------------
@Autowired
private CategoryMapper  categoryMapper;
@Test
public void selec() {
	System.out.print(categoryMapper);
  
}
}
