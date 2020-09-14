<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp"%>
<c:url var="BOOKAPI" value="/api-book" />
<c:url var = "LISTBOOK" value="/admin-book" />
<html>
<head>
<meta charset="UTF-8">
<title>Quản Lý Order</title>
</head>
<body>
	<div class="page-content">
		<table class="table table-bordered">

			<a href="<c:url value="/admin-sales?type=XemDoanhThu" />">
				<button type="button" class="btn btn-primary active" id="addBook">
					Xem Doanh Thu</button>
			</a>


			<thead>
				<tr>
					<th>Tên Người Đặt Hàng</th>
					<th>Mã Hóa Đơn</th>
					<th>Tình Trạng Thanh Toán</th>
					<th>Giá Trị Đơn Hàng</th>
					<th>Ngày Đặt Hàng</th>
					<th>Tạo Báo Cáo</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${LISTORDER}">
					<tr>
						<td>${item.user.fullName} </td>
						<td>${item.ID} </td>
						<td>${item.status}</td>
						<td>${item.totalCash } $</td>
						<td>${item.createDate}</td>
						<td>
							<c:if test="${item.status == 'Đã Thanh Toán'}">
								<button type="button" class="btn btn-primary active" id="deletOrder_${item.ID}" onclick="deleteOrder(${item.ID})">
									Tạo báo cáo
								</button>
							</c:if>
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