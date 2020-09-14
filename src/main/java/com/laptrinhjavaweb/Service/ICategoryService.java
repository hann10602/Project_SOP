package com.laptrinhjavaweb.Service;

import java.util.List;

import com.laptrinhjavaweb.model.categoryModel;

public interface ICategoryService {
	List<categoryModel> findALL();
	categoryModel findOne(Integer id);
}
