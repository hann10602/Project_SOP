package com.laptrinhjavaweb.Service;

import java.util.List;

import com.laptrinhjavaweb.model.roleModel;

public interface IRoleService {
	List<roleModel> findAll();
	roleModel findOne(Integer id);
}
