package com.laptrinhjavaweb.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.BookModel;
import com.laptrinhjavaweb.model.CommentModel;
import com.laptrinhjavaweb.model.ReportCommentModel;
import com.laptrinhjavaweb.model.UserModel;

public class ReportCommentMapper implements DBMapper<ReportCommentModel> {

	@Override
	public ReportCommentModel mapRow(ResultSet rs) {
		ReportCommentModel reportComment = new ReportCommentModel();
		try {
			reportComment.setID(rs.getInt("ID"));
			reportComment.setContent(rs.getString("reportContent"));
			reportComment.setUsersID(rs.getInt("userID"));
			reportComment.setBookID(rs.getInt("BookID"));
			reportComment.setCommentID(rs.getInt("CommentID"));
			try {
				CommentModel comment = new CommentModel();
				comment.setID(reportComment.getCommentID());
				comment.setUserID(reportComment.getUsersID());
				comment.setBookID(reportComment.getBookID());
				comment.setCommentContent(rs.getString("contentComment"));
				comment.setName(rs.getString("name"));
				comment.setCreateDate(rs.getTimestamp(11));
				reportComment.setComment(comment);
			} catch (Exception e) {
				System.out.println("---- không thực hiện map bảng report vs bảng comment----" + e.getMessage());
			}
			try {
				BookModel book = new BookModel();
				book.setID(reportComment.getBookID());
				book.setCategoryID(rs.getInt("categoryID"));
				book.setAuthorID(0);
				book.setBookName(rs.getString("bookName"));
				book.setPrice(rs.getDouble("price"));
				book.setTitle(rs.getString("title"));
				book.setThumbnail(rs.getString("thumbnail"));
				book.setShortdescription(rs.getString("shortdescription"));
				book.setContent(rs.getString("content"));
				reportComment.setBooks(book);
			} catch (Exception e) {
				System.out.println("---- không thực hiện map bảng report vs bảng book----" + e.getMessage());
			}
			try {
				UserModel users = new UserModel();
				users.setID(reportComment.getUsersID());
				users.setRoleID(rs.getInt("roleID"));
				users.setUserName(rs.getString("userName"));
				users.setPassWord(rs.getString("passWord"));
				users.setFullName(rs.getString("fullName"));
				reportComment.setUsers(users);
			} catch (Exception e) {
				System.out.println("---- không thực hiện map bảng report vs bảng user----" + e.getMessage());
			}
			return reportComment;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
