<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp"%>
<c:url var = "APIBOOK" value="/api-book" />
<c:url var = "LISTBOOK" value="/admin-book" />
<html>
<head>
<meta charset="UTF-8">
<title>${ADMINBOOK.bookName}</title>
</head>
<body>
	<div class="page-content">
		<form id="formEditBook" name="formEditBook">
			<div class="form-row">
				<div class="form-group col-md-3">
					<%-- 	<label for="inputEmail4">Thumbnail</label> <input type="image"
						class="form-control" id="thumbnail" name="thumbnail"
						src="${ADMINBOOK.thumbnail}" placeholder="" width="100" height="100"> --%>
						
					<c:set var="Thumbnail" value="https://salt.tikicdn.com/cache/280x280/ts/product/e4/18/85/0e6d4d33c5fa17eed48dbe3d2b88cca5.jpg" ></c:set>
					<c:if test="${not empty ADMINBOOK.thumbnail }">
						<c:set var="Thumbnail" value="${ADMINBOOK.thumbnail}" ></c:set>
					</c:if>
					
					<img alt="" src="${Thumbnail}" height="100" width="100" ">
					<input type="hidden" name="thumbnail" id="thumbnail" value="${Thumbnail}" />
					
				</div>

				<div class="form-group col-md-9">
					<label for="inputPassword4">BookName</label> <input type="text"
						class="form-control" id="bookName" name="bookName"
						placeholder="Tên Sách" value="${ADMINBOOK.bookName }">
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputAddress">Title</label> <input
					type="text" class="form-control" id="title"
					name="title" placeholder="Tiêu đề"
					value="${ADMINBOOK.title }">
			</div>

			<div class="form-group">
				<label for="inputAddress">ShortDescription</label> <input
					type="text" class="form-control" id="shortdescription"
					name="shortdescription" placeholder="Mô tả ngắn"
					value="${ADMINBOOK.shortdescription }">
			</div>
			<%-- <div class="form-group">
				<label for="inputAddress2">Content</label> <input type="text"
					class="form-control" id="content" name="content"
					placeholder="Nội Dung" value="${ADMINBOOK.content }">
			</div> --%>

			<div class="form-group">
				<label for="inputAddress2">Content</label>
				<textarea style="width: 1120px; height: 800px" class="form-control"
					id="content" name="content" placeholder="Nội Dung"
					value="${ADMINBOOK.content }"> ${ADMINBOOK.content} </textarea>
			</div>

			<div class="form-row">
				<!-- <div class="form-group col-md-6">
					<label for="inputCity">City</label> <input type="text"
						class="form-control" id="inputCity">
				</div> -->
				<div class="form-group col-md-4">
					<label for="inputState">Category</label> <select id="categoryID"
						name="categoryID" class="form-control">
						<option selected>Chọn thể loại</option>
						<c:forEach var="item" items="${ADMINLISTCATEGORY}">
							<option value="${item.ID}"
								<c:if test="${item.ID == ADMINBOOK.categoryID}">
															selected="selected"				
														</c:if>>
								${item.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-md-2">
					<label for="inputZip">Price</label> <input type="number"
						class="form-control" name="price" id="price" placeholder="Giá Sách" value="${ADMINBOOK.price}">
				</div>
			</div>
			<div class="form-group">
				<!-- <div class="form-check">
					<input class="form-check-input" type="checkbox" id="gridCheck">
					<label class="form-check-label" for="gridCheck"> Check me
						out </label>
				</div> -->
			</div>
			<br>
			<br>
			<br>
			<br>
			
			<input type="hidden" name="id" id="id" value="${ADMINBOOK.ID}" />
			
			<c:set var="nameButtonEdit" value="ADD BOOK"></c:set>
			<c:if test="${not empty ADMINBOOK.ID }">
				<c:set var="nameButtonEdit" value="UPDATE BOOK"></c:set>
			</c:if>
			<button type="button" class="btn btn-primary"
				style="text-align: center;" id="editBook">${nameButtonEdit}</button>
		</form>
	</div>

	<script type="text/javascript">
		var editor = '';
		$(document).ready(function() {
			editor = CKEDITOR.replace('content');
		});

		$('#editBook').click(function(e) {
			e.preventDefault();
			console.log("ahjfhlsjfhjs");
			var data = {};
			var formData = $('#formEditBook').serializeArray();
			$.each(formData, function(k,v){
				data[""+v.name+""] = v.value;
			});
			data['content'] = editor.getData();
			console.log(data);
			
			var id = $('#id').val();
			if( 0 < id){
				console.log("update : ", id);
				updateBook(data)
			}else{
				console.log("add : ", id);
				addBook(data);
			}
			
		});
		
		function addBook(data){
			$.ajax({
				url : '${APIBOOK}',
				type : 'POST',
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify(data),
				
				success : function(d){
					console.log(d);
					alert("Thêm thành công.");
					window.location.href = '${LISTBOOK}';
				} ,
				
				error : function(e){
					console.log(e);
					alert("Vui lòng nhập đủ thông tin và thử lại.");
				}
			});
		}
		
		function updateBook(data){
			$.ajax({
				url : '${APIBOOK}',
				type : 'PUT',
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify(data),
				
				success : function(d){
					console.log(d);
					alert("Cập nhật thành công.");
					window.location.href = '${LISTBOOK}';
				} ,
				
				error : function(e){
					console.log(e);
					alert("Vui lòng nhập đủ thông tin và thử lại.");
				}
			});
		}
		
		
	</script>

</body>
</html>