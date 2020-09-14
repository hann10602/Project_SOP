package com.laptrinhjavaweb.Service.Impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.google.protobuf.Empty;
import com.laptrinhjavaweb.DAO.IBookDAO;
import com.laptrinhjavaweb.Service.IBookService;
import com.laptrinhjavaweb.model.BookModel;

public class BookServiceImpl implements IBookService{
	
	@Inject
	private IBookDAO BookDAOImpl;
	
	@Override
	public List<BookModel> findAll() {
		return BookDAOImpl.findAll();
	}

	@Override
	public BookModel findOne(Integer id) {
		return BookDAOImpl.findOne(id);
	}

	@Override
	public BookModel save(BookModel bookModel) {
		Integer id;
		if(bookModel.getID() != null && bookModel.getID() > 0) {
			bookModel.setModifiedDate(new Timestamp(System.currentTimeMillis()));
			id = BookDAOImpl.updateBook(bookModel);
		}else {
			bookModel.setCreateDate(new Timestamp(System.currentTimeMillis()));
			id = BookDAOImpl.addBook(bookModel);
		}
		if(id != null) {
			return BookDAOImpl.findOne(id);
		}else {
			return null;
		}
	}

	@Override
	public void delete(BookModel bookModel) {
		for(int id : bookModel.getIds()) {
			BookDAOImpl.delete(id);
		}
	}

	@Override
	public List<BookModel> findByKey(String key) {
		return BookDAOImpl.findByKey(key).isEmpty() ? null : BookDAOImpl.findByKey(key) ;
	}

	@Override
	public List<BookModel> findByCategoryID(Integer categoryID) {
		return BookDAOImpl.findByCategoryID(categoryID);
	}
	
	
	
}
