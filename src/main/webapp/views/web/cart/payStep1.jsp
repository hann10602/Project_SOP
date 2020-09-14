<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/common/taglib.jsp" %>

<c:url var="ORDERAPI" value="/api-order" />
<c:url var="URLHOME" value="/trang-chu" />
<c:url var="URLLOGIN" value="/dang-nhap?action=login" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh Toán</title>
<link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/checkout/">

    <!-- Bootstrap core CSS -->
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
</head>
<body>
    <div class="container">
      <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        <h2>Ptit Book Store</h2>
        <p class="lead">Cảm ơn quý khách đã mua hàng ở Ptit Book Store. Chúc quý khách một ngày vui vẻ</p>
      </div>

      <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Your cart</span>
            <span class="badge badge-secondary badge-pill">3</span>
          </h4>
          <ul class="list-group mb-3">
          	
          	<c:forEach var="item" items="${MYCART.listBooks}">
          		<li class="list-group-item d-flex justify-content-between lh-condensed">
	              <div>
	                <h6 class="my-0"> <a href="<c:url value='/views-book?action=viewdetail&ID=${item.ID}'/>">${item.bookName }</a> </h6>
	                <small class="text-muted">${item.title }</small>
	              </div>
	              <span class="text-muted">$${item.price}</span>
	            </li>	
          	</c:forEach>
          
           <!--  <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Product name</h6>
                <small class="text-muted">Brief description</small>
              </div>
              <span class="text-muted">$12</span>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Second product</h6>
                <small class="text-muted">Brief description</small>
              </div>
              <span class="text-muted">$8</span>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Third item</h6>
                <small class="text-muted">Brief description</small>
              </div>
              <span class="text-muted">$5</span>
            </li>
            <li class="list-group-item d-flex justify-content-between bg-light">
              <div class="text-success">
                <h6 class="my-0">Promo code</h6>
                <small>EXAMPLECODE</small>
              </div>
              <span class="text-success">-$5</span>
            </li> -->
            
            <li class="list-group-item d-flex justify-content-between">
              <span>Total (USD)</span>
              <strong>$${MYCART.totalCash} + 5.0$</strong>
            </li>
          </ul>

          <form class="card p-2">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Promo code">
              <div class="input-group-append">
                <button type="submit" class="btn btn-secondary">Redeem</button>
              </div>
            </div>
          </form>
        </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">Billing address</h4>
          <!--<form class="needs-validation" novalidate>-->
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">First name</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="lastName">Last name</label>
                <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
                <div class="invalid-feedback">
                  Valid last name is required.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="username">Người Nhận Hàng</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">@</span>
                </div>
                <input type="text" class="form-control" id="username" placeholder="Username" required>
                <div class="invalid-feedback" style="width: 100%;">
                  Vui lòng nhập tên người nhận hàng.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="email">Email người nhận <span class="text-muted">(Optional)</span></label>
              <input type="email" class="form-control" id="email" placeholder="you@example.com">
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

            <div class="mb-3">
              <label for="address2">Số điện thoại liên lạc <span class="text-muted">(Optional)</span></label>
              <input type="text" class="form-control" id="address2" placeholder="0xxxxxxxxxx">
            </div>
			
			<div class="mb-3">
              <label for="address">Địa điểm nhận hàng</label>
              <input type="text" class="form-control" id="address" placeholder="số 55 Ỷ La, Dương Nội, Hà Đông, Hà Nội" required>
              <div class="invalid-feedback">
                Vui lòng nhập rõ địa chỉ nhập hàng
              </div>
            </div>
			
            <div class="row">
              <div class="col-md-5 mb-3">
                <label for="country">Phương thức thanh toán</label>
                <select class="custom-select d-block w-100" id="country" required>
                  <option value="">Choose...</option>
                  <option>Thanh Toán Khi Nhận Hàng</option>
                  <option>Thanh Toán Qua PayPal</option>
                </select>
                <div class="invalid-feedback">
                	Vui lòng chọn phương thức thanh toán.
                  
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <label for="state">Phương thức giao hàng</label>
                <select class="custom-select d-block w-100" id="state" required>
                  <option value="">Choose...</option>
                  <option>Giao Hàng Nhanh</option>
                  <option>Giao Hàng Tiết Kiệm</option>
                  <option>Giao Hàng Qua Bưu Điện</option>
                </select>
                <div class="invalid-feedback">
                	Vui lòng chọn phương thức giao hàng.
                  
                </div>
              </div>
              
              <!-- <div class="col-md-3 mb-3">
                <label for="zip">Zip</label>
                <input type="text" class="form-control" id="zip" placeholder="" required>
                <div class="invalid-feedback">
                  Zip code required.
                </div>
              </div> -->
            </div>
            
            
            <!-- <hr class="mb-4">
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="same-address">
              <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
            </div>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="save-info">
              <label class="custom-control-label" for="save-info">Save this information for next time</label>
            </div> -->
            <hr class="mb-4">

            <!-- <h4 class="mb-3">Payment</h4>

            <div class="d-block my-3">
              <div class="custom-control custom-radio">
                <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                <label class="custom-control-label" for="credit">Credit card</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                <label class="custom-control-label" for="debit">Debit card</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                <label class="custom-control-label" for="paypal">Paypal</label>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-name">Name on card</label>
                <input type="text" class="form-control" id="cc-name" placeholder="" required>
                <small class="text-muted">Full name as displayed on card</small>
                <div class="invalid-feedback">
                  Name on card is required
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">Credit card number</label>
                <input type="text" class="form-control" id="cc-number" placeholder="" required>
                <div class="invalid-feedback">
                  Credit card number is required
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">Expiration</label>
                <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                <div class="invalid-feedback">
                  Expiration date required
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">CVV</label>
                <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                <div class="invalid-feedback">
                  Security code required
                </div>
              </div>
            </div> -->
            
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="Button" id="BTNContinuetocheckout" >Continue to checkout</button>
            
          <!--  </form>  -->
          
          	
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
											<td><input type="hidden" name="on0" value="Package">Thanh Toán Nhanh Với PayPal</td>
										</tr>
									</table>
									<input type="hidden" name="amount"
										value="${MYCART.totalCash}"> <input
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
									<button type="submit" class="btn btn-success" id="BTNpayPal">
										Checkout <span class="glyphicon glyphicon-play"></span>
									</button>

								</form>
          
          
          
        </div>
      </div>

      <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; Ptit Book Store</p>
        <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
      </footer>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {
        'use strict';

        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
  	
      var idDonHang;
      
      $('#BTNContinuetocheckout').click(function(){
    	  
    	  var tenNguoiNhan = $('#username').val();
    	  var diaChiNhanHang = $('#address').val();
    	  var phuongThucThanhToan = $('#country').val();
    	  var phuongThucGiaoHang = $('#state').val();
    	  
    	  console.log(tenNguoiNhan);
    	  console.log(diaChiNhanHang);
    	  console.log(phuongThucThanhToan);
    	  console.log(phuongThucGiaoHang);
    	  
    	   if(tenNguoiNhan === ''){
    		  alert("Vui lòng nhập tên người nhận hàng.");
    	  }else if(diaChiNhanHang === ''){
    		  alert("Vui lòng nhập địa chỉ nhận hàng.");
    	  }else if(phuongThucThanhToan === ''){
    		  alert("Vui lòng chọn phương thức thanh toán.");
    	  }else if(phuongThucGiaoHang === ''){
    		  alert("Vui lòng chọn phương thức giao hàng.");
    	  }else{ 
    		  var data = {};
        	  data['totalCash'] = ${MYCART.totalCash} + 5.0;
        	  console.log(JSON.stringify(data)); 
        	  
    		  if(phuongThucThanhToan == 'Thanh Toán Khi Nhận Hàng'){
    			  alert('Đặt hàng thành công.\n\Cảm ơn bạn đã mua hàng tại Ptit Book Store.');
    			  TaoDonHang(data);
    			  ThanhToanTienMat();
    		  }else{
    			  TaoDonHangPayPal(data);
    			  console.log(idDonHang);
            	  $("#BTNpayPal").click();	 
    		  }
    	  }
      });
      
      function ThanhToanTienMat(){
    	  window.location.href = '${URLHOME}';
      }
      
      function TaoDonHang(data){
    	  $.ajax({
    		  url : '${ORDERAPI}',
    		  type : 'POST',
    		  data : JSON.stringify(data),
    		  contentType : 'application/json',
    		  dataType : 'JSON',
    		  error : function(e){
    			console.log(e);  
    			alert('Vui lòng đăng nhập.');
    			window.location.href = '${URLLOGIN}';
    		  },
    		  success : function(d){
    			console.log(d);
    			idDonHang = d.id;
    		  }
    	  });
      }
      
      function TaoDonHangPayPal(data){
    	  $.ajax({
    		  url : '${ORDERAPI}',
    		  type : 'POST',
    		  data : JSON.stringify(data),
    		  contentType : 'application/json',
    		  dataType : 'JSON',
    		  error : function(e){
    			console.log(e);  
    			alert('Vui lòng đăng nhập.');
    			window.location.href = '${URLLOGIN}';
    		  },
    		  success : function(d){
    			console.log(d);
    			idDonHang = d.id;
    			updateDonhang(d.id);
    		  }
    	  });
      }
      
      function updateDonhang(id){
    	  $.ajax({
    		  url : '${ORDERAPI}'+'?ID='+id,
    		  type : 'PUT',
    		  contentType : 'application/json',
    		  dataType : 'JSON',
    		  error : function(e){
    			  console.log("Lỗi");
    			  console.log(e);
    		  },
    		  success : function(d){
    			  console.log("Thành Công");
    			  console.log(d);
    		  }
    	  });
      }
      
    </script>
</body>
</html>
