<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="CartAPI" value="/api-cart"></c:url>
<c:url var="CommentAPI" value="/api-comment"></c:url>
<c:url var="ReportCommentAPI" value="/api-reportcomment" ></c:url>
<c:url var="UrlViewBook" value="/views-book?action=viewdetail&ID=${LISTBOOK.ID}" ></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Tiết</title>
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

			<div class="card mt-4">
				<img class="card-img-top img-fluid"
					src="${LISTBOOK.thumbnail }" alt="">
					<!--  src="http://placehold.it/900x400" alt=""> -->
				<div class="card-body">
					<h3 class="card-title">${LISTBOOK.bookName}</h3>
					<h4>${LISTBOOK.price}00đ</h4>
					<p class="card-text">${LISTBOOK.title}</p>
					<a class="btn btn-success" id="aAddToCart">Thêm Vào Giỏ Hàng</a><br>
					<span class="text-warning">&#9733; &#9733; &#9733; &#9733;
						&#9734;</span> 4.0 stars
						
				</div>
			</div>
			<!-- /.card -->

			<div class="card card-outline-secondary my-4">
				<div class="card-header"><b>Giới Thiệu</b></div>
				<div class="card-body">
							<p>${LISTBOOK.content }</p>
							<small class="text-muted">Posted by ${LISTBOOK.createBy }
								on ${LISTBOOK.createDate }</small>
							<hr>
						</div>
						
						<input type="hidden" value="${LISTBOOK.ID}" name ="id" id="dataBook">
						
						<!-- <a href="#" class="btn btn-success">Thêm Vào Giỏ Hàng</a> -->
						<button id="btnAddToCart" class ="btn btn-success">Thêm Vào Giỏ Hàng</button>
					</div>
					
					
					<!-- Comment -->
							<div class="row bootstrap snippets">
							    <div class="col-md-6 col-md-offset-2 col-sm-12">
							        <div class="comment-wrapper">
							            <div class="panel panel-info">
							                <div class="panel-heading">
							                    Comment
							                </div>
							                <div class="panel-body">
							                	 <form id = "CommentDataForm">
							                	 	<textarea class="form-control" placeholder="write a comment..." rows="3" name="commentContent"></textarea>
							                    	<br>
							                    	<input type="hidden" name="bookID" value="${LISTBOOK.ID}" />							                    
							                    	<button type="button" class="btn btn-info pull-right" id="addComment">Post</button>
							                	 </form>
							                    
							                    <div class="clearfix"></div>
							                    <hr>
							                    <ul class="media-list">
							               
							                    	<c:forEach var="item" items="${LISTCOMMENT}">
							                       		  <li class="media">
									                           <a href="#" class="pull-left">
									                               <img src="<c:url value="/Image/iconSV.jpg" />" alt="" width="100" height="100" class="img-circle">
									                           </a>
									                           <div class="media-body">
									                               <span class="text-muted pull-right">
									                                   <small class="text-muted"> <-${item.createDate}-></small>
									                               </span><br>
									                               <strong class="text-success">${item.name}</strong>
									                               <p>
									                                   ${item.commentContent} <br><a href="#">Sinh Viên HAU :Đ </a>
									                                   <br>
									                                   <c:if test="${not empty USERMODEL}">									                       
									                                   		<c:if test="${USERMODEL.ID == item.userID}" >
									                                   			<button type="button" class="btn btn-info pull-right" id="DeleteComment" onclick="deleteComment(${item.ID})">Xóa Bình Luận</button>									                       
									                                   		</c:if>
									                                   		<c:if test="${USERMODEL.ID != item.userID}">
									                                   			<button type="button" class="btn btn-info pull-right" id="ReportComment" onclick="ReportComment(${item.ID},${LISTBOOK.ID})" >Báo Cáo Vi Phạm</button>
									                                   		</c:if>
									                                   </c:if>
									                               </p>
									                           </div>
									                       </li>
								                     </c:forEach>
							                        
							                        <!-- <li class="media">
							                            <a href="#" class="pull-left">
							                                <img src="https://bootdey.com/img/Content/user_2.jpg" alt="" class="img-circle">
							                            </a>
							                            <div class="media-body">
							                                <span class="text-muted pull-right">
							                                    <small class="text-muted">30 min ago</small>
							                                </span>
							                                <strong class="text-success">@LaurenceCorreil</strong>
							                                <p>
							                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							                                    Lorem ipsum dolor <a href="#">#ipsumdolor </a>adipiscing elit.
							                                </p>
							                            </div>
							                        </li>
							                        <li class="media">
							                            <a href="#" class="pull-left">
							                                <img src="https://bootdey.com/img/Content/user_3.jpg" alt="" class="img-circle">
							                            </a>
							                            <div class="media-body">
							                                <span class="text-muted pull-right">
							                                    <small class="text-muted">30 min ago</small>
							                                </span>
							                                <strong class="text-success">@JohnNida</strong>
							                                <p>
							                                    Lorem ipsum dolor <a href="#">#sitamet</a> sit amet, consectetur adipiscing elit.
							                                </p>
							                            </div>
							                        </li> -->
							                    </ul>
							                </div>
							            </div>
							        </div>
							
							    </div>
							</div>
					<!-- end Comment -->
					
					
				</div>
			</div>
			<!-- /.card -->

		</div>
		<!-- /.col-lg-9 -->


		<!--  Các sản phẩm liên quan -->
		<div class="row">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Card One</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Rem magni quas ex numquam, maxime minus quam
							molestias corporis quod, ea minima accusamus.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Card Two</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Quod tenetur ex natus at dolorem enim! Nesciunt
							pariatur voluptatem sunt quam eaque, vel, non in id dolore
							voluptates quos eligendi labore.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Card Three</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Rem magni quas ex numquam, maxime minus quam
							molestias corporis quod, ea minima accusamus.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->

		</div>
		
		<script>
		
			<!-- Call API Cart -->
			$('#aAddToCart').click(function(){
				var data = {};
				var formdata = $('#dataBook').serializeArray();
				console.log(formdata);
				$.each(formdata,function(k,v){
					data[''+v.name+''] = v.value;
				});
				console.log(JSON.stringify(data));
				addToCart(data);
			});
		
			$('#btnAddToCart').click(function(){
				var data = {};
				var formdata = $('#dataBook').serializeArray();
				console.log(formdata);
				$.each(formdata,function(k,v){
					data[''+v.name+''] = v.value;
				});
				console.log(JSON.stringify(data));
				addToCart(data);
			});
			
			
			function addToCart(data){
				$.ajax({
					url : '${CartAPI}',
					type : 'POST',
					contentType : 'application/json',
					dataType : 'json',
					data : JSON.stringify(data),
					success : function(d){
						console.log(d);
						alert("Đã thêm vào giỏ hàng.");
					},
					
					error : function(e){
						console.log(e);
						alert("Thêm thất bại! Vui lòng thử lại.")
					}
				});
			}
			
			
			
			<!-- Call API Comment -->
			$('#addComment').click(function(){
				var data = {};
				var formData = $('#CommentDataForm').serializeArray();
				$.each(formData, function(k,v){
					data[''+v.name+''] = v.value;
				});
				console.log(JSON.stringify(data));
				addComment(data);
			});
			
			function addComment(data){
				$.ajax({
					url : '${CommentAPI}',
					type : 'POST',
					contentType : 'application/json',
					dataType : 'json',
					data : JSON.stringify(data),
					
					success : function(d){
						console.log(d);
						window.location.href = '${UrlViewBook}';
					},
					
					error : function(e){
						console.log(e);
						alert("Vui lòng đăng nhập để có thể bình luận.");
					}
				});
			}
			
			function deleteComment(id){
				var data = {};
				var ids = [];
				ids.push(id);
				data['ids'] = ids;
				console.log(JSON.stringify(data));
				alert("Xóa bình luận.");
				
				$.ajax({
					url : '${CommentAPI}',
					type : 'DELETE',
					contentType : 'application/json',
					dataType : 'json',
					data : JSON.stringify(data),
					
					success : function(d){
						console.log(d);
						window.location.href = '${UrlViewBook}';
					},
					
					error : function(e){
						console.log(e);
						alert("Có lỗi xảy ra vui lòng thử lại.");
					}
					
				});
			}
			
			function ReportComment(commentID,bookID){
				var data = {};
				data['commentID'] = commentID;
				data['bookID'] = bookID;
				console.log(JSON.stringify(data));
				
				$.ajax({
					url : '${ReportCommentAPI}',
					type : 'POST',
					contentType : 'application/json',
					dataType : 'json',
					data : JSON.stringify(data),
					
					success : function(d) {
						console.log(d);
						alert("Báo cáo vi phạm thành công.\nChờ Quản Trị xử lý.");
						window.href = '${UrlViewBook}';
					},
					
					error : function(e){
						console.log(e);
						alert("Có lỗi xảy ra vui lòng thử lại.");
					}
				});
			}
			
		</script>
		
</body>
</html>