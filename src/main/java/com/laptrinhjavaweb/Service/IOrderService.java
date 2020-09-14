package com.laptrinhjavaweb.Service;

import java.util.List;

import com.laptrinhjavaweb.model.OrderModel;

public interface IOrderService {
	OrderModel findOne(int id);
	List<OrderModel> findAllOrderByCreateDate();
	OrderModel add(OrderModel orderModel);
	OrderModel update(OrderModel orderModel);
	List<OrderModel> findByStatus(String status);
	List<OrderModel> findByUserID(int id);
	void delete(OrderModel orderModel);
}
