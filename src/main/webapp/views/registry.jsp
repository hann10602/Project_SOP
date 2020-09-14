<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIUSER" value="/api-user" />
<c:url var="LOGIN" value="/dang-nhap?action=login" />
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Kí Tài Khoản</title>
</head>
<body>
	<div class="container register">
		<div class="row">
			<div class="col-md-3 register-left">
				<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
				<h3>Welcome</h3>
				<p>Sign up to become a member of the <b>PTIT Book Store</b></p>
				<a  href="${LOGIN}"><input type="button" name="" value="Login" /></a><br />
			</div>
			<div class="col-md-9 register-right">
				<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">PTIT</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">Book Store</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">
				
				<form action="" id="registryForm1">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<h3 class="register-heading">Apply as a PTITER</h3>
						<div class="row register-form">
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Full Name *" name="fullName" />
								</div>
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="User Name *" name="userName" />
								</div>
								<div class="form-group">
									<input type="password" class="form-control"
										placeholder="Password *" value="" id="Password" />
								</div>
								<div class="form-group">
									<input type="password" class="form-control"
										placeholder="Confirm Password *" name="passWord" id="ConfirmPassword" />
								</div>
								<div class="form-group">
									<div class="maxl">
										<label class="radio inline"> <input type="radio"
											 value="male" checked> <span>
												Male </span>
										</label> <label class="radio inline"> <input type="radio"
											 value="female"> <span>Female </span>
										</label>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="email" class="form-control"
										placeholder="Your Email *" value="" />
								</div>
								<div class="form-group">
									<input type="text" minlength="10" maxlength="10"
										 class="form-control"
										placeholder="Your Phone *" value="" />
								</div>
								<div class="form-group">
									<select class="form-control">
										<option class="hidden" selected disabled>Please
											select your Sequrity Question</option>
										<option>What is your Birthdate?</option>
										<option>What is Your old Phone Number</option>
										<option>What is your Pet Name?</option>
									</select>
								</div>
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Enter Your Answer *" value="" />
								</div>
								<input type="hidden" value="0" name="facebookID">
								<input type="hidden" value="2" name="roleID">
								<input type="button" class="btnRegister" value="Register" id="btnRegister1" />
							</div>
						</div>
					</div>
					</form>
					
					
					<div class="tab-pane fade show" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<h3 class="register-heading">Apply as a Hirer</h3>
						<div class="row register-form">
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="First Name *" value="" />
								</div>
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Last Name *" value="" />
								</div>
								<div class="form-group">
									<input type="email" class="form-control" placeholder="Email *"
										value="" />
								</div>
								<div class="form-group">
									<input type="text" maxlength="10" minlength="10"
										class="form-control" placeholder="Phone *" value="" />
								</div>


							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="password" class="form-control"
										placeholder="Password *" value="" />
								</div>
								<div class="form-group">
									<input type="password" class="form-control"
										placeholder="Confirm Password *" value="" />
								</div>
								<div class="form-group">
									<select class="form-control">
										<option class="hidden" selected disabled>Please
											select your Sequrity Question</option>
										<option>What is your Birthdate?</option>
										<option>What is Your old Phone Number</option>
										<option>What is your Pet Name?</option>
									</select>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="`Answer *"
										value="" />
								</div>
								<input type="button" class="btnRegister" value="Register" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	
	
	<script type="text/javascript">
		
		$('#btnRegister1').click(function(e){
			e.preventDefault();
			var data = {};
			var formData = $('#registryForm1').serializeArray();
			$.each(formData,function(k,v){
				data[''+v.name+''] = v.value;
			});
			var passWord = $('#Password').val();
			var comfirmPassWord = $('#ConfirmPassword').val();
			if(passWord === comfirmPassWord){
				if(passWord.length >= 8){
					console.log(JSON.stringify(data));
					addUser(data);
				}else{
					alert("Vui lòng nhập mật khẩu dài hơn 8 kí tự để đảm bảo an toàn.");
				}
			}else{
				alert("Yêu cầu xác nhận đúng PassWord.");
			}
		});
		
		function addUser(data){
			$.ajax({
				url : '${APIUSER}',
				type : 'POST',
				contentType : 'applicaition/json',
				dataType : 'json',
				data : JSON.stringify(data),
						
				success : function(d){
					console.log(d);
					if(null == d){
						alert("UserName đã tồn tại. Vui lòng thay đổi và thử lại");
					}else{
						alert("Chúc mừng bạn đã trở thành PTITER <3");
						window.location.href = '${LOGIN}';
					}
				},
				
				error : function(e){
					console.log(e);
					alert("Vui lòng nhập đủ thông tin và thử lại.");
				}
			});
		}
		
	</script>
</body>
</html>