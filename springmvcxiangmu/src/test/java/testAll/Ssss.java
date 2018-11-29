package testAll;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.event.ApplicationListenerMethodAdapter;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xiangmu.dao.CategoryMapper;
import com.xiangmu.entity.Categorys;

public class Ssss {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext a=new ClassPathXmlApplicationContext("spring-mybatis.xml");
		 CategoryMapper  catemapper=(CategoryMapper)a.getBean("categoryMapper");
		System.out.println(catemapper);
	}

}
