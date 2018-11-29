package com.xiangmu.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;

import com.xiangmu.entity.AdminRole;
import com.xiangmu.entity.Powers;
import com.xiangmu.entity.RolePower;
import com.xiangmu.entity.Roles;

public interface RolesMapper {
	public List<Roles> selectAllRoles();
	public List<Roles> selectRolesById(int id);
	public int deleteAdminRole(int id);
	public int insertAdminRole(AdminRole a);
	public List<Roles> selectRoleByPage(HashMap map);
	public int selectRoleCount();
	//通过adminid查找
	public Roles selectRoleById(int id);
	public Roles selectRoleByName(String name);
	public int updateRole(Roles a);
	public int deleteRolePower(int id);
	public int insertRolePower(RolePower a);
	public int insertRole(Roles a);
	public int selectRoleIdByName(String name);
	public int deleteRole(int id);
	public RolePower selectRolePowerByRid(int id);
	public AdminRole selectAdminRoleByAid(int id);
	public List<Roles> selectRoleByConditionByPage (HashMap map);
	public int selectRoleCountByCondition (HashMap map);
	public int deleteAdminRoleByRid(int id);
	public List<AdminRole> selectAdminRoleByRid(int id);
	
}
