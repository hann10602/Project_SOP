<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="<c:url value="/trang-chu" />">Book Store</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="<c:url value='/trang-chu' />">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a>
					</li> -->
					
					<c:if test="${empty USERMODEL}">
						<li class="nav-item"><a class="nav-link" href="<c:url value="/dang-nhap?action=login" />">Đăng Nhập</a>
						</li>
					</c:if>
					<c:if test="${not empty USERMODEL }">
						<li class="nav-item"><a class="nav-link" href="<c:url value='/Xem-DanhSachDonHang' />">Xin chào : ${USERMODEL.fullName}</a>
						</li>
						<c:url var="URLLOGOUT" value="/dang-xuat">
							<c:param name="action" value="logout" />
							<c:param name="message" value="logout_success" />
							<c:param name="alertstatus" value="success"/> 
						</c:url>
						<li class="nav-item"><a class="nav-link" href="${URLLOGOUT}">Đăng Xuất</a>
						</li>
					</c:if>
					
					<li class="nav-item"><a class="nav-link" href="<c:url value='/view-cart' />">Giỏ Hàng</a>
						</li>
					
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>