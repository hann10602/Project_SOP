package com.laptrinhjavaweb.model;

import java.util.ArrayList;
import java.util.List;

public class CartModel extends abstractModel{
	private UserModel user;
	private List<BookModel> listBooks = new ArrayList<>();
	private Double totalCash;
		
	public CartModel() {
		this.totalCash = 0.0;
	}

	public CartModel(UserModel user, List<BookModel> listBooks, Double totalCash) {
		this.user = user;
		this.listBooks = listBooks;
		this.totalCash = totalCash;
	}

	public UserModel getUser() {
		return user;
	}

	public void setUser(UserModel user) {
		this.user = user;
	}

	public List<BookModel> getListBooks() {
		return listBooks;
	}

	public void setListBooks(List<BookModel> listBooks) {
		this.listBooks = listBooks;
	}

	public Double getTotalCash() {
		return totalCash;
	}

	public void setTotalCash(Double totalCash) {
		this.totalCash = totalCash;
	}
	
	public void totalCash() {
		this.totalCash = 0.0;
		this.listBooks.stream().forEach(book -> this.totalCash += book.getPrice()*book.getAmount());
	}
}
