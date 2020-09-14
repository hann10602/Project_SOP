package com.laptrinhjavaweb.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.roleModel;

public class RoleMapper implements DBMapper<roleModel>{

	@Override
	public roleModel mapRow(ResultSet rs) {
		roleModel role = new roleModel();
		try {
			role.setID(rs.getInt("id"));
			role.setName(rs.getString("name"));
			role.setCode(rs.getString("code"));
			role.setCreateBy(rs.getString("createBy"));
			role.setCreateDate(rs.getTimestamp("createDate"));
			role.setModifiedBy(rs.getString("modifiedBy"));
			role.setModifiedDate(rs.getTimestamp("modifiedDate"));
			return role;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
