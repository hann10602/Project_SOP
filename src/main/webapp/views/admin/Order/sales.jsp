<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp"%>
<c:url var="BOOKAPI" value="/api-book" />
<c:url var = "LISTBOOK" value="/admin-book" />
<html>
<head>
<meta charset="UTF-8">
<title>Xem Doanh Thu</title>
</head>
<body>
	<div class="page-content">
		<table class="table table-bordered">

			<%-- <a href="<c:url value="/admin-book?type=editBook" />">
				<button type="button" class="btn btn-primary active" id="addBook">
					Xem Doanh Thu</button>
			</a> --%>
			
			<div class="col-sm-7 infobox-container">
						<!-- <div class="infobox infobox-green">
							<div class="infobox-icon">
								<i class="ace-icon fa fa-comments"></i>
							</div>

							<div class="infobox-data">
								<span class="infobox-data-number">32</span>
								<div class="infobox-content">comments + 2 reviews</div>
							</div>

							<div class="stat stat-success">8%</div>
						</div> -->

						<!-- <div class="infobox infobox-blue">
							<div class="infobox-icon">
								<i class="ace-icon fa fa-twitter"></i>
							</div>

							<div class="infobox-data">
								<span class="infobox-data-number">11</span>
								<div class="infobox-content">new followers</div>
							</div>

							<div class="badge badge-success">
								+32% <i class="ace-icon fa fa-arrow-up"></i>
							</div>
						</div> -->

						<div class="infobox infobox-pink">
							<div class="infobox-icon">
								<i class="ace-icon fa fa-shopping-cart"></i>
							</div>

							<div class="infobox-data">
								<span class="infobox-data-number">${LISTORDER.size() }</span>
								<div class="infobox-content">Số Đơn Hàng</div>
							</div>
							<div class="badge badge-success">
								% <i class="ace-icon fa fa-arrow-up"></i>
							</div>
						</div>

						<div class="infobox infobox-red">
							<div class="infobox-icon">
								<i class="ace-icon fa fa-flask"></i>
							</div>

							<div class="infobox-data">
								<span class="infobox-data-number">${TOTALSALES}</span>
								<div class="infobox-content">Doanh Thu</div>
							</div>
						</div>

						<div class="infobox infobox-orange2">
							<div class="infobox-chart">
								<span class="sparkline"
									data-values="196,128,202,177,154,94,100,170,224"></span>
							</div>

							<div class="infobox-data">
								<span class="infobox-data-number">${TOTALSALES*0.9}</span>
								<div class="infobox-content">Thực Nhận</div>
							</div>
							<div class="stat stat-important">10%</div>
						</div>

						<!-- <div class="infobox infobox-blue2">
							<div class="infobox-progress">
								<div class="easy-pie-chart percentage" data-percent="42"
									data-size="46">
									<span class="percent">42</span>%
								</div>
							</div>

							<div class="infobox-data">
								<span class="infobox-text">traffic used</span>

								<div class="infobox-content">
									<span class="bigger-110">~</span> 58GB remaining
								</div>
							</div>
						</div> -->

						<div class="space-6"></div>

<!-- 						<div class="infobox infobox-green infobox-small infobox-dark">
							<div class="infobox-progress">
								<div class="easy-pie-chart percentage" data-percent="61"
									data-size="39">
									<span class="percent">61</span>%
								</div>
							</div>

							<div class="infobox-data">
								<div class="infobox-content">Task</div>
								<div class="infobox-content">Completion</div>
							</div>
						</div>

						<div class="infobox infobox-blue infobox-small infobox-dark">
							<div class="infobox-chart">
								<span class="sparkline" data-values="3,4,2,3,4,4,2,2"></span>
							</div>

							<div class="infobox-data">
								<div class="infobox-content">Earnings</div>
								<div class="infobox-content">$32,000</div>
							</div>
						</div>

						<div class="infobox infobox-grey infobox-small infobox-dark">
							<div class="infobox-icon">
								<i class="ace-icon fa fa-download"></i>
							</div>

							<div class="infobox-data">
								<div class="infobox-content">Downloads</div>
								<div class="infobox-content">1,205</div>
							</div>
						</div> -->
					</div>

			<thead>
				<tr>
					<th>Tên Người Đặt Hàng</th>
					<th>Mã Hóa Đơn</th>
					<th>Tình Trạng Thanh Toán</th>
					<th>Giá Trị Đơn Hàng</th>
					<th>Ngày Đặt Hàng</th>
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