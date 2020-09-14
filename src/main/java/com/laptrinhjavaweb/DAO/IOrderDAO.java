package com.laptrinhjavaweb.DAO;

import java.util.List;

import com.laptrinhjavaweb.model.OrderModel;

public interface IOrderDAO {
	OrderModel findOne(Integer id);
	List<OrderModel> findAllOrderByCreateDate();
	Integer add(OrderModel orderModel);
	Integer update(OrderModel orderModel);
	List<OrderModel> findByStatus(String status);
	List<OrderModel> findByUserID(int id);
	void delete(int id);
}
