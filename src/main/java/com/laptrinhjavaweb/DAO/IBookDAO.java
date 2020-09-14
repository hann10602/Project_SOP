package com.laptrinhjavaweb.DAO;

import java.util.List;

import com.laptrinhjavaweb.model.BookModel;

public interface IBookDAO extends GenericDAO<BookModel>{
	List<BookModel> findAll();
	BookModel findOne(Integer id);
	Integer addBook(BookModel bookModel);
	Integer updateBook(BookModel bookModel);
	void delete(int id);
	List<BookModel> findByKey(String key);
	List<BookModel> findByCategoryID(Integer categoryID);
}
