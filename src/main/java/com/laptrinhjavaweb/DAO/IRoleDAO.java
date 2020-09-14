package com.laptrinhjavaweb.DAO;

import java.util.List;

import com.laptrinhjavaweb.model.roleModel;

public interface IRoleDAO extends GenericDAO<roleModel>{
	List<roleModel> findAll();
	roleModel findOne(Integer id);
}
