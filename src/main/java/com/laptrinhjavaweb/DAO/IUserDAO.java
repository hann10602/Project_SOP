package com.laptrinhjavaweb.DAO;

import java.util.List;

import com.laptrinhjavaweb.model.UserModel;

public interface IUserDAO extends GenericDAO<UserModel>{
	UserModel findOneByUserNameAndPassWord(String userName, String passWord);
	UserModel finOne(Integer id);
	List<UserModel> findAll();
	Integer insert(UserModel userModel);
	Integer update(UserModel userModel);
	void delete(Integer id);
}
