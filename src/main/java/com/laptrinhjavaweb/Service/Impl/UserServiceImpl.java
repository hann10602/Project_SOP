package com.laptrinhjavaweb.Service.Impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.laptrinhjavaweb.DAO.IUserDAO;
import com.laptrinhjavaweb.Service.IUserService;
import com.laptrinhjavaweb.model.UserModel;

public class UserServiceImpl implements IUserService{
	@Inject
	private IUserDAO UserDAOImpl;

	@Override
	public UserModel findOneByUserNameAndPassWord(UserModel userModel) {
		return UserDAOImpl.findOneByUserNameAndPassWord(userModel.getUserName(), userModel.getPassWord());
	}

	@Override
	public UserModel findOne(Integer id) {
		return UserDAOImpl.finOne(id);
	}

	@Override
	public UserModel save(UserModel userModel) {
		Integer id;
		if(userModel.getID() != null && userModel.getID() > 0) {
			userModel.setModifiedDate(new Timestamp(System.currentTimeMillis()));
			id = UserDAOImpl.update(userModel);
		}else {
			userModel.setCreateDate(new Timestamp(System.currentTimeMillis()));
			id = UserDAOImpl.insert(userModel);
		}
		if(id != null) {
			return findOne(id);
		}else {
			return null;
		}
	}

	@Override
	public void delete(UserModel userModel) {
		for(int id : userModel.getIds()) {
			UserDAOImpl.delete(id);
		}
	}

	@Override
	public List<UserModel> findAll() {
		return UserDAOImpl.findAll();
	}
}
