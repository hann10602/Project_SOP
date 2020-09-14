package com.laptrinhjavaweb.Service.Impl;

import java.util.List;

import javax.inject.Inject;

import com.laptrinhjavaweb.DAO.ICategoryDAO;
import com.laptrinhjavaweb.Service.ICategoryService;
import com.laptrinhjavaweb.model.categoryModel;

public class CategoryServiceImpl implements ICategoryService{
	
	@Inject
	private ICategoryDAO iCategoryDAO; 
	
	@Override
	public List<categoryModel> findALL() {
		return iCategoryDAO.findAll();
	}

	@Override
	public categoryModel findOne(Integer id) {
		return iCategoryDAO.findOne(id);
	}
	
}
