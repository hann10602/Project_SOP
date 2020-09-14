package com.laptrinhjavaweb.Service.Impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.laptrinhjavaweb.DAO.ICommentDAO;
import com.laptrinhjavaweb.Service.ICommentService;
import com.laptrinhjavaweb.model.CommentModel;

public class CommentServiceImpl implements ICommentService{
	
	@Inject
	private ICommentDAO iCommentDAO;
	
	@Override
	public List<CommentModel> findAll() {
		return iCommentDAO.findAll();
	}

	@Override
	public List<CommentModel> findByBookID(Integer bookID) {
		return iCommentDAO.findByBookID(bookID);
	}

	@Override
	public CommentModel findOne(int id) {
		return iCommentDAO.findOne(id);
	}

	@Override
	public CommentModel save(CommentModel commentModel) {
		Integer id = 0;
		commentModel.setCreateDate(new Timestamp(System.currentTimeMillis()));
		if(commentModel.getID() != null && commentModel.getID() > 0) {
			id = iCommentDAO.updateComment(commentModel);
		}else {
			id = iCommentDAO.addComment(commentModel);			
		}
		if(id != null) {
			return findOne(id);
		}
		return null;
	}

	@Override
	public Integer[] delete(CommentModel commentModel) {
		int n = commentModel.getIds().length;
		Integer[] result = new Integer[n];
		for(int i = 0; i< n; i++) {
			result[i] = iCommentDAO.delete(commentModel.getIds()[i]);
		}
		return result;
	}
	
}
