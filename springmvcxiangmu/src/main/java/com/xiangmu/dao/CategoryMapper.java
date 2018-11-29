package com.xiangmu.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.xiangmu.entity.Categorys;
@Repository
public interface CategoryMapper {
public Categorys selectCateById(int id);
public Categorys selectCateByName(String name);
public int   deleteCateById(int id);
public int  updateCate(Categorys cate);
public int  selectCount();
public int  selectCountByCondition(HashMap map);
public int   insertCate (Categorys cate);
public List<Categorys> selectCateByPage(HashMap map);
public List<Categorys> selectCateByLike(String name);
public List<Categorys> selectAllCate();
public List<Categorys> selectCateByCondition(Categorys cate);
public List<Categorys> selectCateByConditionByPage(HashMap map);
public List<Categorys> selectCateByArray(int [] a);
public List<String> selectAllCateName();
public int  insertCateBypiliang(List<Categorys> list);
	
}
