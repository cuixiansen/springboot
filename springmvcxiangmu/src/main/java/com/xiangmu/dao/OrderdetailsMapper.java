package com.xiangmu.dao;

import java.util.List;
import java.util.Map;

import com.xiangmu.entity.OrderDetail;

public interface OrderdetailsMapper {
public int insertOrderdetail(OrderDetail a);
public int selectOrderDetailCountByOrderid(String id);
public List<OrderDetail> selectOrderDetailByOrderidByPage(Map map);
public List<OrderDetail> selectOrderDetailByOrderid(String id);
public int deleteOrderDetail(String a);
}
