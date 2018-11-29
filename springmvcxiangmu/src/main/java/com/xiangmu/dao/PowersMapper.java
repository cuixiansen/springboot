package com.xiangmu.dao;

import java.util.HashMap;
import java.util.List;

import com.xiangmu.entity.Powers;

public interface PowersMapper {
	public List<Powers> selectAllPowers();
	public List<Powers> selectPowersByPage(HashMap map);
	public List<Powers> selectPowerByRid(int id);
	public int selectPowerCount();
	public Powers selectPowerByPowerId(int id);
	public Powers selectPowerByPowerName(String name);
	public int updatePower(Powers a);
	public int insertPower(Powers a);
	public int deletePower(int id);
	public List<Powers> selectPowerByconditionByPage(HashMap map);
	public int selectPowerCountByCondition(HashMap map);
	//public List<Powers> getPowersById(int id);
}
