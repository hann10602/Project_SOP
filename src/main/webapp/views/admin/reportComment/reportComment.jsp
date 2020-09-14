<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp"%>
<c:url var="COMMENTAPI" value="/api-comment" />
<c:url var="REPORTCOMMENTAPI"  value="/api-reportcomment" />
<c:url var = "LISTREPORT" value="/admin-reportcomment" />
<html>
<head>
<meta charset="UTF-8">
<title>Quản Lý Vi Phạm</title>
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
					<th>Tên Sách</th>
					<th>Nội dung Comment</th>
					<th>Người báo cáo</th>
					<th>Xóa</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${ADMINLISTREPORTCOMMENT}">
					<tr>
						<td> ${item.books.bookName}</td>
						<td><a
							href="<c:url value ='/views-book?action=viewdetail&ID=${item.bookID}' />">${item.comment.commentContent}</a></td>
						<td> ${item.users.fullName} </td>
						<td>
							<button type="button" class="btn btn-primary active" id="deletBookComment_${item.comment.ID}" onclick="deleteComment(${item.comment.ID})">
								Xóa Comment
							</button>
							<button type="button" class="btn btn-primary active" id="deletReportComment_${item.ID}" onclick="deleteReportComment(${item.ID})">
								Xóa Báo Cáo
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script type="text/javascript">
	
	
	<!-- Call Đến Comment API để xóa comment bị báo cáo -->
		function deleteComment(id){
			var data = {};
			var ids = []
			ids.push(id);
			data['ids'] = ids;
			console.log(JSON.stringify(data));
			alert("Xóa Bình Luận.")
			
			$.ajax({
				url : '${COMMENTAPI}',
				contentType : 'application/json',
				dataType : 'json',
				type : 'DELETE',
				data : JSON.stringify(data),
				
				success : function(d){
					console.log(d);
					alert("Xóa thành công.");
					window.location.href = '${LISTREPORT}';
				},
				
				error : function(e){
					console.log(e);
					alert("Vui lòng thử lại.");
				}
			});
		}
		
	<!-- Call đến ReportComment API để xóa báo cáo  -->
		function deleteReportComment(id){
			var data = {};
			var ids = [];
			ids.push(id);
			data['ids'] = ids;
			console.log(JSON.stringify(data));
			alert("Xóa Báo Cáo.");
			
			$.ajax({
				url : '${REPORTCOMMENTAPI}',
				type : 'DELETE',
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify(data),
				
				success : function(d){
					console.log(d);
					window.location.href = '${LISTREPORT}';
				},
				
				error : function(e){
					console.log(e);
					alert("Có lỗi xảy ra vui lòng thử lại");
				}
			});
		}
	</script>

</body>
</html>