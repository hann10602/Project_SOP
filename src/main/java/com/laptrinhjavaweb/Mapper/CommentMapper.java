package com.laptrinhjavaweb.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.CommentModel;

public class CommentMapper implements DBMapper<CommentModel> {

	@Override
	public CommentModel mapRow(ResultSet rs) {
		CommentModel commentModel = new CommentModel();
		try {
			commentModel.setID(rs.getInt("ID"));
			commentModel.setUserID(rs.getInt("userID"));
			commentModel.setBookID(rs.getInt("bookID"));
			commentModel.setCommentContent(rs.getString("contentComment"));
			commentModel.setCreateDate(rs.getTimestamp("createDate"));
			commentModel.setName(rs.getString("name"));
			
			return commentModel;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
