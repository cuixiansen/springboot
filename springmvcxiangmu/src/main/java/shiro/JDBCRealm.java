package shiro;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.xiangmu.dao.AdminsMapper;
import com.xiangmu.entity.Admins;
import com.xiangmu.entity.Powers;
import com.xiangmu.entity.Roles;


public class JDBCRealm extends AuthorizingRealm{
@Autowired
AdminsMapper adminsMapper;
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//角色集合
		Set<String> rolesSet=new HashSet<String>();
		//权限集合
		Set<String> powersSet=new HashSet<String>();
		String name=principals.getPrimaryPrincipal().toString();
		List <Roles> list=adminsMapper.getRoleByName(name);
	
		//principals.getPrimaryPrincipal()是得到传进来的名字
		if(list.size()!=0) {
			for (Roles a:list)
			rolesSet.add(a.getRole_desc()); 
			System.out.println(rolesSet);
			}
		
		//权限的管理
		if(rolesSet.contains("superadmin")) {
			List <Powers> plist=adminsMapper.getAllPowers();
			for(Powers p:plist) {
				  powersSet.add(p.getPower_code());
			}
		}else {
		for(String desc:rolesSet) {
			List <Powers> plist=adminsMapper.getPowersByRole_desc(desc);
		  for(Powers p:plist) {
			  System.out.println(p.getPower_code());
			  powersSet.add(p.getPower_code());
		}} }
		SimpleAuthorizationInfo inf=new SimpleAuthorizationInfo();
		inf.setRoles(rolesSet);
		inf.setStringPermissions(powersSet);
		return inf;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		 UsernamePasswordToken t=( UsernamePasswordToken ) token;
		 String name =t.getUsername();
		 Admins a=adminsMapper.selectAdminByName(name);
		 String password=a.getAdmin_password();
		 if(a==null) {
			 throw new UnknownAccountException("用户"+name+"不存在");
			 //password="66cb87e4e66a825d10cf4227e0e82eee";
			//password="123456";
		 }
		
		 /*if(!"jack".equals(name)) {
			 throw new UnknownAccountException("用户"+name+"不存在");
		 }
		 if("jack".equals(name)) {
			 password="66cb87e4e66a825d10cf4227e0e82eee";
			//password="123456";
		 }
		 System.out.println(password+"============");
		 System.out.println(token.getCredentials().toString()+"-------------");*/
		 SimpleAuthenticationInfo inf=new SimpleAuthenticationInfo(name,password,ByteSource.Util.bytes(name),getName());
		return inf;
		
	}

public static void main(String []args ) {
	SimpleHash a=new SimpleHash("md5", "123456");
	System.out.println(a);
	a=new SimpleHash("md5", "121212","cui");
	System.out.println(a);
	a=new SimpleHash("md5", "123456","abc",1);
	System.out.println(a);
}

	
}
