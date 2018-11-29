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
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.RequestParam;

import com.xiangmu.dao.ProvidersMapper;
import com.xiangmu.entity.Bpage;
import com.xiangmu.entity.Categorys;
import com.xiangmu.entity.Providers;

import net.sf.json.JSONObject;




public class TestPe {
private SqlSessionFactory myfactory;
private ApplicationContext a;	
	
	@Before

	public void before() throws IOException {
		a=new ClassPathXmlApplicationContext("spring-mybatis.xml");
		myfactory=(SqlSessionFactory)a.getBean("sqlSessionFactory");
		/*Reader reader=Resources.getResourceAsReader("SqlmapConfig.xml");
		myfactory=new SqlSessionFactoryBuilder().build(reader);**/
		 /*SqlSession session=myfactory.openSession();
		 System.out.println(session);*/
	}
	@Test
	public void SelectProvider() {
		
		 SqlSession session=myfactory.openSession();
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		ProvidersMapper mapper= session.getMapper(ProvidersMapper.class);
		
		//c.andCategoryNameEqualTo("ˮ��");
		
		//List<Providers> list=mapper.selectByExample(example);
	  // System.out.println(list);
		
	}
	@Test
	public void insertProvider() {
		
		 SqlSession session=myfactory.openSession();
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		ProvidersMapper mapper= session.getMapper(ProvidersMapper.class);
	
		//c.andCategoryNameEqualTo("ˮ��");
		Providers record=new Providers("sdadsa","14545");
		//int a=mapper.insertSelective(record);
	   System.out.println(a);
		
	}
	@Test
	public void updateProvider() {
		
		 SqlSession session=myfactory.openSession();
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		ProvidersMapper mapper= session.getMapper(ProvidersMapper.class);
		
		
	   System.out.println(a);
		
	}
	@Test
	public void deleteProvider() {
		
		
		// System.out.println(session);
		                                      // ������Щ�������ռ䣨namespace�����id������������֮ǰ��Ϊ�Ľӿ��µķ��������������ǲ���
		ProvidersMapper mapper=(ProvidersMapper) a.getBean("providersMapper");
		
			HashMap <String ,Object> map=new HashMap<>();
			Providers pe=new Providers(0,"崔");
			//int currentpage=Integer.parseInt(cpage);
			//int offset=(currentpage-1)*limit;
			map.put("startindex", 0);
			map.put("pagesize", 5);
			map.put("pe", pe);
			List<Providers> list=mapper.selectPeByConditionByPage(map);
			
			
		
	   System.out.println(list);
		
	}
}
