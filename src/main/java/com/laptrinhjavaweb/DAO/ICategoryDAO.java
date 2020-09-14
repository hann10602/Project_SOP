package com.laptrinhjavaweb.DAO;

import java.util.List;

import com.laptrinhjavaweb.model.categoryModel;

public interface ICategoryDAO extends GenericDAO<categoryModel>{
	List<categoryModel> findAll();
	categoryModel findOne(Integer id);
}
