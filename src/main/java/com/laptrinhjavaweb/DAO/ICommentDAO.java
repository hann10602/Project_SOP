package com.laptrinhjavaweb.DAO;

import java.util.List;

import com.laptrinhjavaweb.model.CommentModel;

public interface ICommentDAO {
	CommentModel findOne(int id);
	List<CommentModel> findAll();
	List<CommentModel> findByBookID(Integer bookID);
	Integer addComment(CommentModel commentModel);
	Integer updateComment(CommentModel commentModel);
	int delete(int id);
}
