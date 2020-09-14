package com.laptrinhjavaweb.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.BookModel;
import com.laptrinhjavaweb.model.categoryModel;

public class BookMapper implements DBMapper<BookModel>{

	@Override
	public BookModel mapRow(ResultSet rs) {
		BookModel book= new BookModel();
		try {
			book.setID(rs.getInt("ID"));
			book.setCategoryID(rs.getInt("categoryID"));
			book.setAuthorID(rs.getInt("authorID"));
			book.setBookName(rs.getString("bookName"));
			book.setPrice(rs.getDouble("price"));
			book.setTitle(rs.getString("title"));
			book.setThumbnail(rs.getString("thumbnail"));
			book.setShortdescription(rs.getString("shortdescription"));
			book.setContent(rs.getString("content"));
			book.setCreateBy(rs.getString("createBy"));
			book.setCreateDate(rs.getTimestamp("createDate"));
			book.setModifiedBy(rs.getString("modifiedBy"));
			book.setModifiedDate(rs.getTimestamp("modifiedDate"));
			try {
				categoryModel categoryModel = new categoryModel();
				categoryModel.setName(rs.getString("name"));
				categoryModel.setCode(rs.getString("code"));
				categoryModel.setID(rs.getInt("categoryID"));
				book.setCategoryModel(categoryModel);
			} catch (Exception e) {
				//System.out.println("--------------------"+e.getMessage());
			}
			return book;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
