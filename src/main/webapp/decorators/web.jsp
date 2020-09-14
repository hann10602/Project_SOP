<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APISEARCH" value="/views-book" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<title><dec:title>Shop Homepage - Start Bootstrap Template</dec:title></title>

<!-- Bootstrap core CSS -->
<!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<link href='<c:url value="/template/web/vendor/bootstrap/css/bootstrap.min.css" />' rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value="/template/web/css/shop-homepage.css" />" rel="stylesheet">
</head>
<body>
	<!-- Navigation -->
	<!-- //d header -->
	<%@include file="/common/web/header.jsp" %>

	<!-- Page Content -->
	<div class="container">
	
		<!-- Thanh Search -->
					<!--Navbar-->
						<nav class="navbar navbar-expand-lg navbar-dark indigo mb-4">
						
						  <!-- Navbar brand -->
						  <a class="navbar-brand" href="#"></a>
						
						  <!-- Collapsible content -->
						  <div class="collapse navbar-collapse" id="navbarSupportedContent">
						
						    <form class="form-inline ml-auto" action="<c:url value="/views-book"/>" method="GET">
						    	<input type="hidden" value="search" name="action" />
						      <div class="md-form my-0">
						        <input class="form-control" type="text" placeholder="Search..." aria-label="Search" id="keySearch" name="key">
						      </div>
						      <button href="#!" class="btn btn-outline-white btn-md my-0 ml-sm-2" type="submit">Search</button>
						    </form>
						
						  </div>
						  <!-- Collapsible content -->
						
						</nav>
						<!--/.Navbar-->

		<!-- //d body -->
		<dec:body></dec:body>
		
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<!-- //d footer -->
	<%@include file="/common/web/footer.jsp" %>

	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value="/template/web/vendor/jquery/jquery.min.js" />"></script>
	<script src="<c:url value="/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	
	
	<script type="text/javascript">
		function searchByKey(){
			var key = $('#keySearch').val();
			var url1 = '${APISEARCH}' + '?action=search&key='+key
			console.log(url1);
			
			$.ajax({
				url : url1,
				type : 'GET',
				contentType : 'application/json',
				dataType : 'json',
				success : function(d){
					console.log('success.');
				},
				error : function(e){
					console.log('error.',e);
				} 
			});
		}
	</script>
</body>
</html>