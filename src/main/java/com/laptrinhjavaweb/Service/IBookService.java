package com.laptrinhjavaweb.Service;

import java.util.List;

import com.laptrinhjavaweb.model.BookModel;

public interface IBookService {
	BookModel findOne(Integer id);
	List<BookModel> findAll();
	BookModel save(BookModel bookModel);
	void delete(BookModel bookModel);
	List<BookModel> findByKey(String key);
	List<BookModel> findByCategoryID(Integer categoryID);
}
