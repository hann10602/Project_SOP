<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp"%>
<c:url var="BOOKAPI" value="/api-book" />
<c:url var = "LISTBOOK" value="/admin-book" />
<html>
<head>
<meta charset="UTF-8">
<title>Quản Lý Book</title>
</head>
<body>
	<div class="page-content">
		<table class="table table-bordered">

			<a href="<c:url value="/admin-book?type=editBook" />">
				<button type="button" class="btn btn-primary active" id="addBook">
					Thêm Sách Mới</button>
			</a>


			<thead>
				<tr>
					<th>Firstname</th>
					<th>Tên Sách</th>
					<th>Mô tả</th>
					<th>Xóa</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${ADMINBOOK.listResult}">
					<tr>
						<td><img src="${item.thumbnail}" height="100" width="100">
							</img></td>
						<td><a
							href="<c:url value ='/admin-book?type=editBook&ID=${item.ID}' />">${item.bookName}</a></td>
						<td>${item.shortdescription}</td>
						<td>
							<button type="button" class="btn btn-primary active" id="deletBook_${item.ID}" onclick="deletebook(${item.ID})">
								Xóa Sách
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script type="text/javascript">
		function deletebook(id){
			var data = {};
			var ids = []
			ids.push(id);
			data['ids'] = ids;
			console.log(JSON.stringify(data));
			
			$.ajax({
				url : '${BOOKAPI}',
				contentType : 'application/json',
				dataType : 'json',
				type : 'DELETE',
				data : JSON.stringify(data),
				
				success : function(d){
					console.log(d);
					alert("Xóa thành công.");
					window.location.href = '${LISTBOOK}';
				},
				
				error : function(e){
					console.log(e);
					alert("Vui lòng thử lại.");
				}
			});
			
		}
	</script>

</body>
</html>