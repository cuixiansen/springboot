package com.xiangmu.dao;

import java.util.HashMap;
import java.util.List;

import com.xiangmu.entity.Admins;
import com.xiangmu.entity.Navi;
import com.xiangmu.entity.Powers;
import com.xiangmu.entity.Roles;
import com.xiangmu.entity.SecondNavi;

public interface AdminsMapper {
public Admins selectAdminByLogin( Admins a);
//shiro 认证
public Admins selectAdminByName(String name);
//shiro 授权(包括权限和角色)
public List<Roles> getRoleByName(String name);
public List<Powers> getPowersByRole_desc(String role_desc);
public List<Powers> getAllPowers();
public List<Powers> getPowersByName(String name);
public List<Navi> getFirstNavi();
public List<SecondNavi> getSecondNavi(int id);
public List<Admins> selectAdminByPage(HashMap map);
public int selectAdminCount();
public int insertAdmin(Admins a);
public int selectAdminIdByName(String name);
public int deleteAdmin(int id);
public List<Admins> selectAdminByConditionByPage(HashMap map);
public int selectAdminCountByCondition(HashMap map);


}
