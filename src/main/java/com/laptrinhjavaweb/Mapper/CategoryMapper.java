package com.laptrinhjavaweb.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.categoryModel;

public class CategoryMapper implements DBMapper<categoryModel>{

	@Override
	public categoryModel mapRow(ResultSet rs) {
		categoryModel categoryModel = new categoryModel();
		try {
			categoryModel.setID(rs.getInt("ID"));
			categoryModel.setName(rs.getString("name"));
			categoryModel.setCode(rs.getString("code"));
			categoryModel.setCreateBy(rs.getString("createBy"));
			categoryModel.setCreateDate(rs.getTimestamp("createDate"));
			categoryModel.setModifiedBy(rs.getString("modifiedBy"));
			categoryModel.setModifiedDate(rs.getTimestamp("modifiedDate"));
			return categoryModel;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
