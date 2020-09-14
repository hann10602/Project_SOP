<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIUSER" value="/api-user" />
<c:url var="LISTUSER" value="/admin-user" />
<html>
<head>
<meta charset="UTF-8">
<title>Quản Lý User</title>
</head>
<body>
	<div class="page-content">
		<table class="table table-bordered">

			<a href="<c:url value="/admin-user?type=editUser"/> ">
				<button type="button" class="btn btn-primary active" id="addBook">
					Thêm User Mới</button>
			</a>


			<thead>
				<tr>
					<th>UserName</th>
					<th>FullName</th>
					<th>Role</th>
					<th>Xóa</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${ADMINUSER.listResult}">
					<tr>
						<td>${item.userName}</td>
						<td><a
							href="<c:url value ='/admin-user?type=editUser&ID=${item.ID}' />">${item.fullName}</a></td>
						<td>${item.role.name}</td>
						<td>
							<button type="button" class="btn btn-primary active"
								id="deletBook_${item.ID}" onclick="deleteUser(${item.ID})">
								Xóa User</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script type="text/javascript">
		function deleteUser(id){
			var data = {};
			var ids = [];
			ids.push(id);
			data['ids'] = ids;
			console.log(JSON.stringify(data));
			
			$.ajax({
				url : '${APIUSER}',
				type : 'DELETE',
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify(data),
				
				success : function(d){
					console.log(d);
					alert("Xóa thành công.");
					window.location.href = '${LISTUSER}';
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