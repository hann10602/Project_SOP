<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIUSER" value="/api-user" />
<c:url var="LISTUSER" value="/admin-user" />
<html>
<head>
<meta charset="UTF-8">
<title>${ADMINUSER.fullName}</title>
</head>
<body>
	<div class="page-content">
		<form id="editUserForm" name="editUserForm">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">UserName</label> <input type="text"
						class="form-control" id="userName" name="userName" placeholder="Tài Khoản" value="${ADMINUSER.userName}">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Password</label> <input type="text"
						class="form-control" id="passWord" name="passWord" placeholder="Mật Khẩu" value="${ADMINUSER.passWord}">
				</div>
			</div>
			<div class="form-group">
				<label for="inputAddress">FullName</label> <input type="text"
					class="form-control" id="fullName" name="fullName" placeholder="Họ Tên" value="${ADMINUSER.fullName}">
			</div>
			
				<div class="form-group col-md-4">
					<label for="inputState">State</label> <select id="roleID" name="roleID"
						class="form-control">
						<option selected>Chọn Quyền</option>
						<c:forEach var="item" items="${ADMINLISTROLE}">
						<c:if test=""></c:if>
							<option value="${item.ID}" 
								<c:if test="${item.ID == ADMINUSER.roleID}"> 
									selected="selected"
								</c:if> >${item.name}</option>
						</c:forEach>
					</select>
				</div>
			
			<c:set var="btnEdit" value="Add User"></c:set>
			<c:if test="${not empty ADMINUSER.ID}">
				<c:set var="btnEdit" value="Update User"></c:set>
			</c:if>
			
			<input type="hidden" name="id" id="id" value="${ADMINUSER.ID}" />
			<br><br><br>
			<button type="submit" class="btn btn-primary" id="btnEdit">${btnEdit}</button>
		</form>
	</div>
	
	<script type="text/javascript">
		$('#btnEdit').click(function(e){
			e.preventDefault();
			var data = {};
			var formData = $('#editUserForm').serializeArray();
			$.each(formData,function(k,v){
				data[""+v.name+""] = v.value;
			});
			console.log(JSON.stringify(data));
			var id = $('#id').val();
			if(0 < id){
				console.log("Update : ", id);
				updateUser(data);
			}else {
				console.log("Add : ", id);
				addUser(data);
			}
		});
		
		
		<!-- Call User API để quản lý user (thêm sửa xóa) -->
		function addUser(data){
			$.ajax({
				url : '${APIUSER}',
				type : 'POST',
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify(data),
				
				success : function(d){
					console.log(d);
					if(null == d){
						alert("UserName đã tồn tại. Vui lòng thay đổi và thử lại");
					}else{
						alert("Thêm thành công.");
						window.location.href = '${LISTUSER}';
					}
				},
				
				error : function(e){
					console.log(e);
					alert("Vui lòng nhập đủ thông tin và thử lại.");
				}
			});
		}
		
		function updateUser(data){
			$.ajax({
				url : '${APIUSER}',
				type : 'PUT',
				contentType : 'application/json',
				dataType : 'json',
				data : JSON.stringify(data),
				
				success : function(d){
					console.log(d);
					alert("Cập nhật thành công.");
					window.location.href = '${LISTUSER}';
				},
				
				error : function(e){
					console.log(e);
					alert("Vui lòng nhập đủ thông tin và thử lại.")
				}
			});
		}
		
	</script>
</body>
</html>