<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Tiết</title>
</head>
<body>
	<div class="row">

		<div class="col-lg-3">
			<h1 class="my-4">Shop Name</h1>
			<div class="list-group">
				<a href="#" class="list-group-item active">Category 1</a> <a
					href="#" class="list-group-item">Category 2</a> <a href="#"
					class="list-group-item">Category 3</a>
			</div>
		</div>
		<!-- /.col-lg-3 -->

		<div class="col-lg-9">

			<div class="card mt-4">
				<img class="card-img-top img-fluid"
					src="${LISTBOOK.thumbnail }" alt="">
					<!--  src="http://placehold.it/900x400" alt=""> -->
				<div class="card-body">
					<h3 class="card-title">${LISTBOOK.bookName}</h3>
					<h4>${LISTBOOK.price}VND</h4>
					<p class="card-text">${LISTBOOK.title}</p>
					<span class="text-warning">&#9733; &#9733; &#9733; &#9733;
						&#9734;</span> 4.0 stars
				</div>
			</div>
			<!-- /.card -->

			<div class="card card-outline-secondary my-4">
				<div class="card-header"><b>Giới Thiệu</b></div>
				<div class="card-body">
							<p>${LISTBOOK.content }</p>
							<small class="text-muted">Posted by ${LISTBOOK.createBy }
								on ${LISTBOOK.createDate }</small>
							<hr>
						</div>
						<a href="#" class="btn btn-success">Thêm Vào Giỏ Hàng</a>
					</div>
				</div>
			</div>
			<!-- /.card -->

		</div>
		<!-- /.col-lg-9 -->


		<!--  Các sản phẩm liên quan -->
		<div class="row">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Card One</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Rem magni quas ex numquam, maxime minus quam
							molestias corporis quod, ea minima accusamus.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Card Two</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Quod tenetur ex natus at dolorem enim! Nesciunt
							pariatur voluptatem sunt quam eaque, vel, non in id dolore
							voluptates quos eligendi labore.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Card Three</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Rem magni quas ex numquam, maxime minus quam
							molestias corporis quod, ea minima accusamus.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->

		</div>
</body>
</html>