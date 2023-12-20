<%@page import="com.laptrinhjavaweb.Constants.SystemConstants"%>
<%@page import="com.laptrinhjavaweb.Utils.SessionUtils"%>
<%@page import="com.laptrinhjavaweb.model.CartModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="CartAPI" value="/api-cart" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ Hàng</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="<c:url value='/template/cart/styles.css' />"
	rel="stylesheet">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Product</th>
							<th>Quantity</th>
							<th class="text-center">Price</th>
							<th class="text-center">Total</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
						<c:set var="stt" value="-1"></c:set>
						<c:forEach var="item" items="${MYCART.listBooks}">
							<c:set var="stt" value="${stt + 1 }"></c:set>
							<tr>
								<td class="col-sm-8 col-md-6">
									<div class="media">
										<a class="thumbnail pull-left" href="#"> <img
											class="media-object" src="${item.thumbnail }"
											style="width: 72px; height: 72px;">
										</a>
										<div class="media-body">
											<h4 class="media-heading">
												<a href="#">${item.bookName}</a>
											</h4>
											<!-- <h5 class="media-heading">
												by <a href="#">Brand name</a>
											</h5> -->
											<span>Status: </span><span class="text-success"><strong>Còn
													Sách</strong></span>
										</div>
									</div>
								</td>
								<td class="col-sm-1 col-md-1" style="text-align: center"><input
									type="email" class="form-control"
									id="exampleInputEmail1_${stt}" value="${item.amount}"
									onchange="upDateBookFromCart(${stt})"></td>
								<td class="col-sm-1 col-md-1 text-center"><strong>${item.price}00đ</strong></td>
								<td class="col-sm-1 col-md-1 text-center"><strong>${item.price*item.amount}00đ</strong></td>
								<td class="col-sm-1 col-md-1">
									<button type="button" class="btn btn-danger"
										onclick="deleteBookFromCart(${stt})">
										<span class="glyphicon glyphicon-remove"></span> Remove
									</button>
								</td>
							</tr>
						</c:forEach>




						<!-- <tr>
							<td class="col-md-6">
								<div class="media">
									<a class="thumbnail pull-left" href="#"> <img
										class="media-object"
										src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png"
										style="width: 72px; height: 72px;">
									</a>
									<div class="media-body">
										<h4 class="media-heading">
											<a href="#">Product name</a>
										</h4>
										<h5 class="media-heading">
											by <a href="#">Brand name</a>
										</h5>
										<span>Status: </span><span class="text-warning"><strong>Leaves
												warehouse in 2 - 3 weeks</strong></span>
									</div>
								</div>
							</td>
							<td class="col-md-1" style="text-align: center"><input
								type="email" class="form-control" id="exampleInputEmail1"
								value="2"></td>
							<td class="col-md-1 text-center"><strong>$4.99</strong></td>
							<td class="col-md-1 text-center"><strong>$9.98</strong></td>
							<td class="col-md-1">
								<button type="button" class="btn btn-danger">
									<span class="glyphicon glyphicon-remove"></span> Remove
								</button>
							</td>
						</tr> -->



						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h5>Subtotal</h5></td>
							<td class="text-right"><h5>
									<strong>${MYCART.totalCash}00đ</strong>
								</h5></td>
						</tr>
						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h5>Estimated shipping</h5></td>
							<td class="text-right"><h5>
									<c:set var="shipCash" value="0.0"></c:set>
									<c:if test="${not empty MYCART.listBooks}">
										<c:set var="shipCash" value="5.0"></c:set>
									</c:if>
									<strong>${shipCash}00đ</strong>
								</h5></td>
						</tr>
						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h3>Total</h3></td>
							<td class="text-right"><h3>
									<strong>${MYCART.totalCash + shipCash}00đ</strong>
								</h3></td>
						</tr>
						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td>
								<!-- <button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-shopping-cart"></span>
									Continue Shopping
								</button> --> <a class="btn btn-default"
								href="<c:url value='/trang-chu' />"> <span
									class="glyphicon glyphicon-shopping-cart"></span> Continue
									Shopping
							</a>

							</td>
							<td>
											<!-- Call API của PAYPAL để thực hiện thanh toán -->
								<form action="https://www.sandbox.paypal.com/cgi-bin/webscr"
									method="post" target="_top">
									<input type="hidden" name="cmd" value="_xclick"> <input
										type="hidden" name="business" value="ptitshop@ptit.edu.vn">
									<input type="hidden" name="lc" value="US"> <input
										type="hidden" name="item_name" value="Items of PTIT SHOP">
									<input type="hidden" name="button_subtype" value="services">
									<input type="hidden" name="no_note" value="0"> <input
										type="hidden" name="currency_code" value="USD"> <input
										type="hidden" name="tax_rate" value="0"> <input
										type="hidden" name="shipping" value="5.0"> <input
										type="hidden" name="bn"
										value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest">
									<table>
										<tr>
											<td><input type="hidden" name="on0" value="Package">Package</td>
										</tr>
									</table>
									<input type="hidden" name="amount"
										value="${MYCART.totalCash + shipCash}00đ"> <input
										type="hidden" name="currency_code" value="USD">
									<!-- <input type="hidden" name="option_select0" value="Monthly Membership">
								<input type="hidden" name="option_amount0" value="10.00">
								<input type="hidden" name="option_select1" value="Life Membership">
								<input type="hidden" name="option_amount1" value="100.00">  -->
									<input type="hidden" name="option_index" value="0"> <input
										type="hidden" name="return"
										value="http://localhost:8080/PTPM_HuongDichVu/view-cart">
									<input type="hidden" name="cancel_return"
										value="http://localhost:8080/PTPM_HuongDichVu/view-cart">
									<input type="hidden" name="page_style" value="TestLocal">
									<!-- <input type="image"
										src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif"
										border="0" name="submit"
										alt="PayPal - The safer, easier way to pay online!"> <img
										alt="" border="0"
										src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif"
										width="1" height="1"> -->
								<!-- 	<button type="submit" class="btn btn-success">
										Checkout <span class="glyphicon glyphicon-play"></span>
									</button> -->
									
									<a href="http://localhost:8080/PTPM_HuongDichVu/views/web/cart/payStep1.jsp"><button type="button" class="btn btn-success">
										Checkout <span class="glyphicon glyphicon-play"></span>
									</button></a>
									
								</form>

							</td>


							<!-- FORM Thanh Toán PAYPAL -->
							<%-- 
							<form action="https://www.sandbox.paypal.com/cgi-bin/webscr"
								method="post" target="_top">
								<input type="hidden" name="cmd" value="_xclick"> <input
									type="hidden" name="business"
									value="ptitshop@ptit.edu.vn"> <input
									type="hidden" name="lc" value="US"> <input
									type="hidden" name="item_name" value="Items of PTIT SHOP"> <input
									type="hidden" name="button_subtype" value="services"> <input
									type="hidden" name="no_note" value="0"> <input
									type="hidden" name="currency_code" value="USD"> <input
									type="hidden" name="tax_rate" value="1"> <input
									type="hidden" name="shipping" value="6.9"> <input
									type="hidden" name="bn"
									value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest">
								<table>
									<tr>
										<td><input type="hidden" name="on0" value="Package">Package</td>
									</tr>
								</table>
								<input type="hidden" name="amount" value="${MYCART.totalCash + shipCash}" >
								<input type="hidden" name="currency_code" value="USD"> 
								<!-- <input type="hidden" name="option_select0" value="Monthly Membership">
								<input type="hidden" name="option_amount0" value="10.00">
								<input type="hidden" name="option_select1" value="Life Membership">
								<input type="hidden" name="option_amount1" value="100.00">  -->
								<input type="hidden" name="option_index" value="0"> 
								<input type="hidden" name="return" value="http://localhost:8080/PTPM_HuongDichVu/view-cart"> 
								<input type="hidden" name="cancel_return" value="http://localhost:8080/PTPM_HuongDichVu/view-cart"> 
								<input type="hidden" name="page_style" value="TestLocal"> 
								<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif"
									border="0" name="submit"
									alt="PayPal - The safer, easier way to pay online!"> 
								<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
							</form>
 --%>
							<!-- END FORM thanh toán PayPal -->

						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	
	<!-- Call API Cart (để quản lý giỏ hàng sửa xóa sản phẩm) -->
	<script>
		function deleteBookFromCart(stt){
			var data = {};
			data['sttDelete'] = stt;
			console.log(JSON.stringify(data));
			$.ajax({
				url : '${CartAPI}' + '?sttDelete='+ stt ,
				type : 'DELETE',
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify(data),
				
				success : function(d){
					console.log(d);
					window.location.href = '<c:url value="/view-cart" />';
				},
				
				error : function(e){
					console.log(e);
				}
			});
		}
		
		function upDateBookFromCart(stt){
			var idtext = '#exampleInputEmail1_'+stt;
			var amount = $(idtext).val();
			var urlAPI = '${CartAPI}' + '?sttUpdate='+stt+'&amountUpdate='+amount;
			console.log(urlAPI);
			if(amount > 0){
				$.ajax({
					url : urlAPI,
					type : 'PUT',
					contentType : 'application/json',
					dataType : 'json',
					data : JSON.stringify(stt),
					success : function(d){
						console.log(d);
						window.location.href = '<c:url value="/view-cart" />';
					},
					error : function(e){
						console.log(e)
					} 
				});
			}else{
				alert("Dữ liệu nhập không hợp lệ!!!");
				window.location.href = '<c:url value="/view-cart" />';
			}
		}
		
	</script>

</body>
</html>