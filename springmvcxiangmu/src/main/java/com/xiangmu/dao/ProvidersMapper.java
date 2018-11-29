package com.xiangmu.dao;

import java.util.HashMap;
import java.util.List;

import com.xiangmu.entity.Providers;





public interface ProvidersMapper {
	public Providers selectProviderById(int id);
	public int   deleteProviderById(int id);
	public int  updateProvider(Providers pe);
	public int   insertProvider (Providers pe);
	public List<Providers> selectProviderByPage(HashMap map);
	public List<Providers> selectProviderByLike(String name);
	public List<Providers> selectAllProvider();
	public int   selectCountPe();
	public List<Providers> selectPeByConditionByPage(HashMap map);
	public Providers selectProviderByName(String name);
}
//mapper.getmapper(ProviderMapper.class) ����������