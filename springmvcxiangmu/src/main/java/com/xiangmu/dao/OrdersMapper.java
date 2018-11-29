package com.xiangmu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.xiangmu.entity.Orders;

public interface OrdersMapper {
public int insertOrders(Orders a);
public int selectOrderCount();
public List<Orders> selectAllOrder();
public List<Orders> selectAllOrderByPage(Map map);
public Orders selectAllOrderById(String id);
public int updateOrder(Orders a);
public List<Orders> selectOrderByConditionByPage(Map map);
public int  selectOrderCountByCondition(Map map);
public int  deleteOrder(String orderid);
}
