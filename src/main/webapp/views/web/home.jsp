<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home of WEB</title>
</head>
<body>
	<div class="row">

		<div class="col-lg-3">
			<h2 class="my-4" >Book Store</h2>
			<div class="list-group">
				<c:forEach var="item" items="${LISTCATEGORY}">
					<a href="<c:url value="/views-book?action=findByCategory&categoryID=${item.ID}" />" class="list-group-item">${item.name }</a>	
				</c:forEach>
			</div>

		</div>
		<!-- /.col-lg-3 -->

		<div class="col-lg-9">

			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid object-fit-cover" src="https://images.theconversation.com/files/45159/original/rptgtpxd-1396254731.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=754&fit=clip"
							alt="First slide" width="900" height="350"/>
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid object-fit-cover" src="https://images.unsplash.com/photo-1495446815901-a7297e633e8d?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9va3N8ZW58MHx8MHx8fDA%3D"
							alt="Second slide" width="900" height="350"/>
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid object-fit-cover" src="https://st.depositphotos.com/1020422/55244/i/450/depositphotos_552443006-stock-photo-stack-books-wooden-background-back.jpg"
							alt="Third slide" width="900" height="350"/>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

			<div class="row">

				<c:forEach var="item" items="${LISTBOOK}">

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="<c:url value="/views-book?action=viewdetail&ID=${item.ID}" />"><img class="card-img-top"
								src="${item.thumbnail }" alt="" width="200px" height="250px"></a>
							<div class="card-body">
								<h4 class="card-title" style="height: 100px">
									<a href="<c:url value="/views-book?action=viewdetail&ID=${item.ID}" />">${item.bookName }</a>
								</h4>
								<p class="card-text">${item.shortdescription }</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>

				</c:forEach>

				<!-- <div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item One</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Amet numquam aspernatur!</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Two</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit
								amet.</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Three</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Amet numquam aspernatur!</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Four</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Amet numquam aspernatur!</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Five</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit
								amet.</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Six</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Amet numquam aspernatur!</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>
 -->
			</div>
			<!-- /.row -->

		</div>
		<!-- /.col-lg-9 -->

	</div>
</body>
</html>