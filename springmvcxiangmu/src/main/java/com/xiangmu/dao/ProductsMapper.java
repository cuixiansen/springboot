package com.xiangmu.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.xiangmu.entity.Products;



public interface ProductsMapper {
	public Products selectProductById(int id);
	public Products selectProductByName(String name);
	public int   deleteProductById(int id);
	public int  updateProduct(Products pe);
	public int   insertProduct (Products pe);
	public int   selectPuCount();
	public int   selectPuCountByCondition(HashMap map);
	public List<Products> selectProductByPage(HashMap map);
	public List<Products> selectProductByLike(String name);
	public List<Products> selectAllProduct();
	public List<Products> selectProductByCondition(Products pu);
	public List<Products> selectProductByConditionByPage(HashMap map);
	public List<Products> selectProductByCateId(int id);
	public List<Products> selectProductByPeId(int id);
	     
}
