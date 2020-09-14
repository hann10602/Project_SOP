package com.laptrinhjavaweb.Service;

import java.util.List;

import com.laptrinhjavaweb.model.UserModel;

public interface IUserService {
	UserModel findOneByUserNameAndPassWord(UserModel userModel);
	UserModel findOne(Integer id);
	List<UserModel> findAll();
	UserModel save(UserModel userModel);
	void delete(UserModel userModel);
}
