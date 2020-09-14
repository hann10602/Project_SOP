package com.laptrinhjavaweb.Service;

import java.util.List;

import com.laptrinhjavaweb.model.CommentModel;

public interface ICommentService {
	CommentModel findOne(int id);
	List<CommentModel> findAll();
	List<CommentModel> findByBookID(Integer bookID);
	CommentModel save(CommentModel commentModel);
	Integer[] delete(CommentModel commentModel);
}
