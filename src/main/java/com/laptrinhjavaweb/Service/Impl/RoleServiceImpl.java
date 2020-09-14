package com.laptrinhjavaweb.Service.Impl;

import java.util.List;

import javax.inject.Inject;

import com.laptrinhjavaweb.DAO.IRoleDAO;
import com.laptrinhjavaweb.Service.IRoleService;
import com.laptrinhjavaweb.model.roleModel;

public class RoleServiceImpl implements IRoleService{
	
	@Inject
	private IRoleDAO iRoleDAO;
	
	@Override
	public List<roleModel> findAll() {
		return iRoleDAO.findAll();
	}

	@Override
	public roleModel findOne(Integer id) {
		if(id != null && id > 0) {
			return iRoleDAO.findOne(id);
		}else {
			return null;
		}
	}
	
}
