package testAll;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xiangmu.dao.AdminsMapper;
import com.xiangmu.dao.OrdersMapper;
import com.xiangmu.dao.PowersMapper;
import com.xiangmu.dao.RolesMapper;
import com.xiangmu.entity.Admins;
import com.xiangmu.entity.Navi;
import com.xiangmu.entity.Orders;
import com.xiangmu.entity.Powers;
import com.xiangmu.entity.Roles;
import com.xiangmu.entity.SecondNavi;

public class Testadmin {
ApplicationContext a=new ClassPathXmlApplicationContext("spring-mybatis.xml");
AdminsMapper ad=(AdminsMapper)a.getBean("adminsMapper");
OrdersMapper o=(OrdersMapper)a.getBean("ordersMapper");
PowersMapper aa=(PowersMapper) a.getBean("powersMapper");
RolesMapper ro=(RolesMapper) a.getBean("rolesMapper");
@Test
public void aa() {
	Admins aa=new Admins("jack","123456");
	Admins a=ad.selectAdminByLogin(aa);
	System.out.println(a);
	
}
@Test
public void a() {
	List<Roles> a=ad.getRoleByName("cui");
	System.out.println(a);
	Set rolesSet=new HashSet();
	if(a.size()!=0) {
		for (Roles b:a)
			rolesSet.add(b.getRole_desc());
			
		 
		
}
	System.out.println(rolesSet.size());}
@Test
public void b() {
	List<Powers> a=ad.getPowersByRole_desc("classadmin");
	System.out.println(a);
	
		}
	
@Test
public void d() {
	List<Powers> a=aa.selectAllPowers();
	System.out.println(a);
	
		}
	
@Test
public void c() {
//	List<SecondNavi> a=ad.getSecondNavi(1);
//	System.out.println(a);
//	List<Navi> list=ad.getFirstNavi();
//	for(Navi a:list)
//	{  System.out.println(a.getPower_name());
//		List<SecondNavi> p=ad.getSecondNavi(a.getPowerID());
//		for(SecondNavi s:p) {
//			System.out.println(s.getPower_name());
//		}
//		a.setList(p);
//	}
//		}
	HashMap<String,Integer> map=new HashMap<>();
	map.put("startindex", 0);
	map.put("pagesize", 5);
	List<Admins> list=ad.selectAdminByPage(map);
	System.out.println(list);
	
	}
@Test
public void s() {
List<Powers> list=aa.selectPowerByRid(1);
	
	String a="";
	for (Powers aa:list) {
		a=a+aa.getPower_name()+" ";

	
	System.out.println(a);
		}
	


}
@Test
public void ss() {
String a="";
String s=a.trim();
if(s=="") {
	System.out.println("sae");
}
	
	System.out.println(s);
		}
	


}

