package com.laptrinhjavaweb.Service.Impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.laptrinhjavaweb.DAO.IOrderDAO;
import com.laptrinhjavaweb.Service.IOrderService;
import com.laptrinhjavaweb.model.OrderModel;

public class OrderServiceImpl implements IOrderService{

	@Inject
	private IOrderDAO iorderDAO;
	
	@Override
	public OrderModel findOne(int id) {
		return iorderDAO.findOne(id);
	}
	
	@Override
	public OrderModel add(OrderModel orderModel) {
		orderModel.setCreateDate(new Timestamp(System.currentTimeMillis()));
		Integer id = iorderDAO.add(orderModel);
		if(id != null) {
			orderModel = iorderDAO.findOne(id);
			return orderModel;
		}else {
			return null;
		}
	}

	@Override
	public OrderModel update(OrderModel orderModel) {
		int id = iorderDAO.update(orderModel);
		return iorderDAO.findOne(id);
	}

	@Override
	public List<OrderModel> findAllOrderByCreateDate() {
		List<OrderModel> listOrder = iorderDAO.findAllOrderByCreateDate();
		return listOrder;
	}

	@Override
	public List<OrderModel> findByStatus(String status) {
		List<OrderModel> listOrder = iorderDAO.findByStatus(status);
		return listOrder;
	}

	@Override
	public List<OrderModel> findByUserID(int id) {
		List<OrderModel> listOrder = iorderDAO.findByUserID(id);
		return listOrder;
	}

	@Override
	public void delete(OrderModel orderModel) {
		for(int id : orderModel.getIds()) {
			iorderDAO.delete(id);
		}
	}
}
