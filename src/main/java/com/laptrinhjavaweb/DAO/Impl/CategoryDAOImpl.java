package com.laptrinhjavaweb.DAO.Impl;

import java.util.List;

import com.laptrinhjavaweb.DAO.ICategoryDAO;
import com.laptrinhjavaweb.Mapper.CategoryMapper;
import com.laptrinhjavaweb.model.categoryModel;

public class CategoryDAOImpl extends AbstractDAO<categoryModel> implements ICategoryDAO{

	@Override
	public List<categoryModel> findAll() {
		String sql = "SELECT * FROM `category`";
		return queryList(sql, new CategoryMapper());
	}

	@Override
	public categoryModel findOne(Integer id) {
		String sql = "SELECT * FROM `category` WHERE id = ?";
		return query(sql, new CategoryMapper(), id);
	}
	
}
