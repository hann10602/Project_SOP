package com.laptrinhjavaweb.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.OrderModel;
import com.laptrinhjavaweb.model.UserModel;

public class OrderMapper implements DBMapper<OrderModel>{

	@Override
	public OrderModel mapRow(ResultSet rs) {
		OrderModel orderModel = new OrderModel();
		
		try {
			orderModel.setID(rs.getInt("ID"));
			orderModel.setUserId(rs.getInt("userID"));
			orderModel.setTotalCash(rs.getDouble("totalCash"));
			orderModel.setStatus(rs.getString("status"));
			orderModel.setCreateDate(rs.getTimestamp("createDate"));
			
			try {
				UserModel userModel = new UserModel();
				userModel.setID(orderModel.getUserId());
				//try {
					userModel.setFullName(rs.getString("fullName"));
				//} catch (SQLException e1) {
				//	System.out.println("----------khong Innerjoin Table Users");
				//}
				orderModel.setUser(userModel);
			} catch (Exception e) {
				System.out.println("----------khong Innerjoin Table Users");
			}
			return orderModel;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
