<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="OrderAPI" value="/api-order" />
<c:url var="viewListOrder" value="/Xem-DanhSachDonHang"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh Sách Đơn Hàng Đã Đặt</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<%-- <link href="<c:url value ='/template/order/style.scc' />" rel="stylesheet"> --%>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style type="text/css">
	.filterable {
    margin-top: 15px;
	}
	.filterable .panel-heading .pull-right {
	    margin-top: -20px;
	}
	.filterable .filters input[disabled] {
	    background-color: transparent;
	    border: none;
	    cursor: auto;
	    box-shadow: none;
	    padding: 0;
	    height: auto;
	}
	.filterable .filters input[disabled]::-webkit-input-placeholder {
	    color: #333;
	}
	.filterable .filters input[disabled]::-moz-placeholder {
	    color: #333;
	}
	.filterable .filters input[disabled]:-ms-input-placeholder {
	    color: #333;
	}
</style>
</head>
<body>
	<div class="container">
	    
	    <div class="row">
	        <div class="panel panel-primary filterable">
	            <div class="panel-heading">
	                <h3 class="panel-title">Danh Sách Đơn Hàng</h3>
	                <div class="pull-right">
	                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
	                </div>
	            </div>
	            <table class="table">
	                <thead>
	                    <tr class="filters">
	                        <!-- <th><input type="text" class="form-control" placeholder="stt" disabled></th> -->
	                        <th><input type="text" class="form-control" placeholder="Mã Đơn Hàng" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Tình Trạng Thanh Toán" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Giá Trị Đơn Hàng" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Ngày Đặt Hàng" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Hủy Đơn Hàng" disabled></th>
	                    </tr>
	                </thead>
	                <tbody>
		                <c:forEach var="item" items="${LISTORDER}">
		                	<tr>
		                        <td>${item.ID}</td>
		                        <td>${item.status}</td>
		                        <td>${item.totalCash}00đ</td>
		                        <td>${item.createDate}</td>
		                        <td>
		                        	<c:if test="${item.status != 'Đã Thanh Toán.' }">
		                        			<button type="button" class="btn btn-danger" onclick="deleteOrder(${item.ID})">Hủy Đơn Hàng</button>	
		                        	</c:if>
		                        </td>
		                    </tr>	
		                </c:forEach>
	                    
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>	

	
<script type="text/javascript">
	
	function deleteOrder(id){
		alert("Bạn muốn hủy đơn hàng : " + id);
		var data = {};
		var ids = [];
		ids.push(id);
		data['id'] = id;
		data['ids'] = ids;
		deleteOrderAPI(data);
	}
	
	
	function deleteOrderAPI(data){
		$.ajax({
			url : '${OrderAPI}',
			type : 'DELETE',
			contentType : 'application/json',
			dataType : 'JSON',
			data : JSON.stringify(data),
			
			success : function(d){
				alert("Hủy đơn hàng thành công.");
				window.location.href = '${viewListOrder}';
			},
			
			error : function(e){
				alert("Có lỗi xảy ra, Vui lòng thử lại.");
			}
		});
	}
	
</script>	
	
	
</body>
</html>