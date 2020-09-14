package com.laptrinhjavaweb.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.model.roleModel;

public class UserMapper implements DBMapper<UserModel>{

	@Override
	public UserModel mapRow(ResultSet rs) {
		UserModel user = new UserModel();
		try {
			user.setID(rs.getInt("ID"));
			user.setUserName(rs.getString("userName"));
			user.setPassWord(rs.getString("passWord"));
			user.setFullName(rs.getString("fullName"));
			user.setRoleID(rs.getInt("roleID"));
			user.setFacebookID(rs.getLong("facebookID"));
			try {
				roleModel role = new roleModel();
				role.setID(rs.getInt(11));
				role.setName(rs.getString("name"));
				role.setCode(rs.getString("code"));
				user.setRole(role);
			} catch (Exception e) {
				System.out.println("-----"+e.getMessage());
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
