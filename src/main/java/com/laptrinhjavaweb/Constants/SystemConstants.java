package com.laptrinhjavaweb.Constants;

public class SystemConstants {
	//quyền đăng nhập
	public static String ADMIN_ROLE = "ADMIN";  //admin
	public static String USER_ROLE = "USER";	//user
	
	//tham số truyền ra có frontEnd phía 
			//thông tin tài khoản
	public static String USER_MODEL = "USERMODEL";
			//thông tin list book
	public static String LIST_BOOK = "LISTBOOK";
	
	//thanh toán
	public static String MY_CART = "MYCART";
	
	//tham số truyền ra cho frontEnd
			//thông tin truyền ra từ admin
			//thông tin book
	public static String ADMIN_BOOK = "ADMINBOOK";
	public static String ADMIN_LIST_CATEGORY = "ADMINLISTCATEGORY";
	public static String ADMIN_LIST_REPORTCOMMENT = "ADMINLISTREPORTCOMMENT";
			//thông tin user
	public static String ADMIN_USER = "ADMINUSER";
	public static String ADMIN_LIST_ROLE = "ADMINLISTROLE";
	
		//thông tin về list category
	public static String LIST_CATEGORY = "LISTCATEGORY";
		//thông tin về comment theo bài viết
	public static String LIST_COMMENT = "LISTCOMMENT";
	
		//thông tin về  danh sách order cho admin quản lí;
	public static String LIST_ORDER = "LISTORDER";
		//thông tin về tổng danh thu để admin xem
	public static String TOTAL_SALES = "TOTALSALES";
}	
