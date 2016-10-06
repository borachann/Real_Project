<%@page import="com.kosign.wecafe.entities.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/favicon_1.ico">
<title>KOSIGN WECAFE - BEVERAGE STOCK</title>

<!-- Base Css Files -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- Font Icons -->
<link
	href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/ionicon/css/ionicons.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/material-design-iconic-font.min.css"
	rel="stylesheet">

<!-- animate css -->
<link
	href="${pageContext.request.contextPath}/resources/css/animate.css"
	rel="stylesheet" />

<!-- Waves-effect -->
<link
	href="${pageContext.request.contextPath}/resources/css/waves-effect.css"
	rel="stylesheet">

<!-- sweet alerts -->
<link
	href="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.css"
	rel="stylesheet">

<!-- Custom Files -->
<link href="${pageContext.request.contextPath}/resources/css/helper.css"	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/resources/css/style.css"	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/resources/css/customize.css"	rel="stylesheet" type="text/css" />

<script	src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script>


</head>
<body class="fixed-left-void" ng-app="wecafe">
	<!-- Begin page -->
	<div id="wrapper">
		<!-- Top Bar Start -->
		<%@ include file="topbar.jsp"%>
		<!-- Top Bar End -->

		<!-- ========== Left Sidebar Start ========== -->
		<%@ include file="left_sidebar.jsp"%>
		<!-- Left Sidebar End -->

		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container">
					<!-- Page-Title -->
					<div class="row">
						<div class="col-sm-12">
							<h4 class="pull-left page-title">Product List</h4>
							<ol class="breadcrumb pull-right">
								<!-- <li><a href="#">KOSIGN WECAFE</a></li> -->
								<li class="active">Product List</li>
							</ol>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="row">
									<!-- <h3 class="panel-title">Product Lists</h3> -->
									<div class="col-md-8">
										<div class="form-inline">
											<div class="form-group">
												<label>Search : </label> <input type="text"
													class="form-control" id="txtSearch" placeholder="Search" width="400%">
												<input type="button" class="btn btn-default" id="btnSearch" value="Search">
											</div> 
										</div>
									</div>									
									<div class="col-md-2 pull-right" style="text-align: right;">
										<button id="btn_add_product" class="btn btn-primary">Add Product</button>
									</div>								
									</div>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-md-12 col-sm-12 col-xs-12 ellipsis" >
											<table id="datatable" >
												<thead>
													<tr>
														<th>#</th>
														<th>Name</th>
														<th>Quantity</th>
														<th>Unit Price</th>
														<th>Retail Price</th>
														<th>Sale Price</th>
														<th>Category</th>
														<th>Unit</th>
														<!-- <th>Image</th> -->
														<th>Status</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody id="CONTENTS">
												</tbody>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-md-2">
											<select id="PER_PAGE" class="form-control">
												
												<option value="15">15</option>
												<option value="30">30</option>
												<option value="50">50</option>
												<option value="100">100</option>
											</select>
										</div>
										<div id="PAGINATION" class="pull-right"></div>
									</div>
								</div>
						</div>
					</div>
					
				</div>
				<!-- container -->
			</div>
			<!-- content -->
		</div>
		<%@ include file="footer.jsp"%>
	</div>
	</div>
	<div id="modalMessage" style="display: none; width: 50%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" aria-hidden="true">
					<span class="button b-close"><span>×</span></span>
				</button>
				<h4 class="modal-title">
					<strong>Message</strong>
				</h4>
			</div>
			<div class="modal-body">
				<h4>Do you want to delete?</h4>
			</div>
			<div class="modal-footer">
				<div align="right">
					<button type="button" id="btnOK" class="btn btn-primary btn-flat"
						style="width: 70px;">Ok</button>
					<button type="button" id="btnClose"
						class="btn btn-default btn-flat" style="width: 70px;">
						<span class="button b-close"><span>Close</span></span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<div id="modalMessageAlert" style="display: none; width: 50%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" aria-hidden="true">
					<span class="button b-close"><span>×</span></span>
				</button>
				<h4 class="modal-title">
					<strong>Message</strong>
				</h4>
			</div>
			<div class="modal-body">
				<h4 id="messageBody">You have been deleted successfully.</h4>
			</div>
			<div class="modal-footer">
				<div align="right">
					<button type="button" id="btnOKAlert"
						class="btn btn-primary btn-flat" style="width: 70px;">
						<span class="button b-close">Ok</span>
					</button>
					<button type="button" id="btnCloseAlert"
						class="btn btn-default btn-flat" style="width: 70px;">
						<span class="button b-close"><span>Close</span></span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<%-- <td style="text-align:center;"><img style="text-align:center;" src="${pageContext.request.contextPath}/resources/images/products/{{= image}}" class="img-thumbnail" alt="" width="30px" height="30px"/></td> --%>
	<!-- ========== Include product add ========== -->
	<%@ include file="productadd.jsp"%>
	
	<script id="CONTENT_TEMPLATE" type="text/x-jquery-tmpl">
	    	<tr>
				<td style="display: none;">{{= productId}}</td>
				<td>{{= importDetail}}</td>
				<td class="content-left"><span class="ellipsis">{{= productName}}</span></td>
				<td class="content-left" >{{= quantity + " " + unit.to}}</td>
				<td class="content-left">1 {{= unit.unitName}} = {{= unitPrice}} <span style="font-weight:bold;"> $ </span></td>
				<td class="content-left">1 {{= unit.to}} = {{= costPrice}} <span style="font-weight:bold;"> $ </span></td>
				<td style="text-align:right;">{{= salePrice}} <span style="font-weight:bold;"> $ </span></td>
				<td class="content-left">{{= category.catName}}</td>
				<td class="content-left">{{= unit.unitName +" (" + unit.qty + " " + unit.to +")"}}</td>
				
				<td style="text-align:center;">
					<span>
						<a href="javascript:;" class="btn {{= button}} btn-sm waves-effect" type="button" id="btnStatus">{{= status}}</a>
					</span>
				</td>
				<td class="actions" style="text-align:center;">
					<a class="on-default edit-row" href="${pageContext.request.contextPath}/admin/product/{{= productId}}" id="btnUpdate" data-id="{{= productId}}"><i class="fa fa-pencil"></i></a>
					
				</td>
			</tr>
        </script>
<!--         <a class="on-default remove-row" href="javascript:;" id="btnRemove" data-id="{{= productId}}"><i class="fa fa-trash-o"></i></a> -->
	<script>
            var resizefunc = [];
            var ctx = "${pageContext.request.contextPath}"
        </script>
	<!-- jQuery  -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/waves.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-detectmobile/detect.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-blockui/jquery.blockUI.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.tmpl.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.bootpag.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/js/numeral.min.js"></script>
	
	<!-- Product Add -->
	
	<!-- CUSTOM JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>
	<!-- Chat -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.chat.js"></script>

	<!-- Todo -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.todo.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/assets/notifications/notify.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/notifications/notify-metro.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/notifications/notifications.js"></script>

	<!--  <script src="http://malsup.github.com/jquery.form.js"></script> -->

	<script	src="${pageContext.request.contextPath}/resources/js/jquery.form.min.js"></script>	
	<script>
            var resizefunc = [];
     </script>
	
	
	<script>
	var isAdded=false;
        	$(function(){
        		var products = {};
        		var check = true;
        		var order = 1;
    			var v=[];
    			var b = true;
        		// TODO: FIND ALL PRODUCTS WITH CURRENT PAGE
        		products.findAllProducts = function(currentPage){
        			$.ajax({ 
    				    url: "${pageContext.request.contextPath}/api/admin/products", 
    				    type: 'GET', 
    				    data: {
   				    		"currentPage" : currentPage,
   				    		"perPage"     : $("#PER_PAGE").val(),
   				    		"startDate"   : "03/12/2015",
   				    		"endDate"     : "03/12/2015"
    				    },
    				    beforeSend: function(xhr) {
    	                    xhr.setRequestHeader("Accept", "application/json");
    	                    xhr.setRequestHeader("Content-Type", "application/json");
    	                },
    				    success: function(data) {
							console.log(data);
							 b = true;
							 v = data;	
							if(data.products.length>0){
								$("tbody#CONTENTS").html('');
								for(var i=0;i<data.products.length;i++){
									data.products[i]["button"] = "btn-success";
									products.format(data.products[i]);
									data.products[i]["quantity"] = Math.floor(data.products[i].quantity/data.products[i].unit.qty) + " " + data.products[i].unit.unitName + ", " +
									(parseInt(data.products[i].quantity) % parseInt(data.products[i].unit.qty));
								}
								$("#CONTENT_TEMPLATE").tmpl(data.products).appendTo("tbody#CONTENTS");
							}else{
								$("tbody#CONTENTS").html('<tr>NO CONTENTS</tr>');
							}
					    	if(check){
					    		products.setPagination(data.pagination.totalPages,1);
					    		check=false;
					    	}
    				    },
    				    error:function(data,status,er) { 
    				        console.log("error: "+data+" status: "+status+" er:"+er);
    				    }
    				});
        		};
        		
        		products.format = function(value){
        			value["quantity"] = numeral(value["quantity"]).format('0,0');
        			
        			if(value["status"]==false){
        				value["status"] = "Inactive";
        				value["button"] = "btn-danger";
        			}else{
        				value["status"] = "Active";
        				value["button"] = "btn-success";
        			}
        			if(b){
			 			order = v.pagination.perPage * (v.pagination.currentPage-1);
			 			j = order + 1;
			 			value["importDetail"] =j;
			 			b = false;
			 		}
			 		else  
			 		value["importDetail"] = ++j;
        		}
        		// TODO: FIND PRODUCT BY Name
        		$("#txtSearch").keyup(function(e){
        			 if (e.keyCode == 13) {
        				 $("#btnSearch").click();
        			 }
        		});
        		
        		$("#btnSearch").click(function(){
        			str = $("#txtSearch").val();
        			if(str == ""){
        				products.findAllProducts(1);
        				return ;
        			}
        			
        			$.ajax({
        				url: "${pageContext.request.contextPath}/api/admin/products/searchproduct/" + str,
        				type: 'GET',
        				dataType: 'JSON',
        				beforeSend: function(xhr){
        					xhr.setRequestHeader("Accept", "application/json");
        					xhr.setRequestHeader("Context-Type", "application/json");
        				},
        				success: function(data){
        					console.log(data);
        					b = true;
							 v = data;	
							if(data.productName.length>0){
								
								$("tbody#CONTENTS").html('');
								for(var i=0;i<data.productName.length;i++){
									data.productName[i]["button"] = "btn-success";
									products.format(data.productName[i]);
									data.productName[i]["quantity"] = Math.floor(data.productName[i].quantity/data.productName[i].unit.qty) + " " + data.productName[i].unit.unitName + ", " +
										(parseInt(data.productName[i].quantity) % parseInt(data.productName[i].unit.qty));
								}
								$("#CONTENT_TEMPLATE").tmpl(data.productName).appendTo("tbody#CONTENTS");
							}else{
								$("tbody#CONTENTS").html('<tr>NO CONTENTS</tr>');
							}
					    	if(check){
					    		products.setPagination(data.pagination.totalPages,1);
					    		check=false; 
					    	}
        				},
        				error:function(data,status,er){
        					console.log("error: "+data+" status: "+status+" er:"+er);
        				}
        			});
        		});
        		
        		// TODO: DELETE PRODUCT BY ID
        		products.deleteProductById = function(id){
        			$.ajax({ 
    				    url: "${pageContext.request.contextPath}/admin/product/delete/"+id, 
    				    type: 'POST', 
    				    dataType: 'JSON', 
    				    beforeSend: function(xhr) {
    	                    xhr.setRequestHeader("Accept", "application/json");
    	                    xhr.setRequestHeader("Content-Type", "application/json");
    	                },
    				    success: function(data) { 
    				        if(data){
    				        	$("#modalMessageAlert").bPopup();
    				        	products.findAllProducts(1);
    				        }else{
    				        	$("#messageBody").html("You have errors when delete the product");
    				        	$("#modalMessageAlert").bPopup();
    				        }
    				    },
    				    error:function(data,status,er) { 
    				    	$("#messageBody").html("error: "+data+" status: "+status+" er:"+er);
    				    	$("#modalMessageAlert").bPopup();
    				        console.log("error: "+data+" status: "+status+" er:"+er);
    				    }
    				});
        		};
        		
        		// TODO: UPDATE PRODUCT
        		products.updateProduct = function(){
        			
        		};
        		
        		products.setPagination = function(totalPage, currentPage){
       		    	$('#PAGINATION').bootpag({
       			        total: totalPage,
       			        page: currentPage,
       			        maxVisible: 10,
       			        leaps: true,
       			        firstLastUse: true,
       			        first: 'First',
       			        last: 'Last',
       			        wrapClass: 'pagination',
       			        activeClass: 'active',
       			        disabledClass: 'disabled',
       			        nextClass: 'next',
       			        prevClass: 'prev',
       			        lastClass: 'last',
       			        firstClass: 'first'
       			    }).on("page", function(event, currentPage){
       			    	check = false;
       			    	products.findAllProducts(currentPage);
       			    }); 
        		};
        		
        		products.findAllProducts(1);
        		
        		$(document).on('click','#btnRemove',function(){
        			
        			var id = $(this).data("id");
        			$("#modalMessage").bPopup();
        			$("#btnOK").data("id", $(this).data("id")); 
        			
        		});       		
        		$(document).on('click','#btnStatus',function(){
      			
               			      			var id= $(this).parents("tr").children().eq(0).html() ; 
        			         			var _this = $(this);
        			       				$.ajax({ 
        			        				    url: "${pageContext.request.contextPath}/admin/product/status/"+id, 
        			       				    type: 'POST', 
        			       				    dataType: 'JSON', 
        			        				    //data: JSON.stringify(json), 
        			        				    beforeSend: function(xhr) {
        			        	                    xhr.setRequestHeader("Accept", "application/json");
        			        	                    xhr.setRequestHeader("Content-Type", "application/json");
        			        	                },
        			       				    success: function(data) { 
        			      				        if(data){
        			        				        	if(_this.hasClass('btn-success')){
        			       				        		_this.removeClass('btn-success');
        			       				        		_this.addClass('btn-danger');
        			        				        		_this.html('Inactive');
        			       				        	}else if(_this.hasClass('btn-danger')){
        			      				        		_this.removeClass('btn-danger');
        			       				        		_this.addClass('btn-success');
        			     				        		_this.html('Active');
        			      				        	}
        			      				        }else{
        			     				        	alert('YOU HAVE ERRORS WHEN CHANGING THE STATUS.');
        			       				        }
        			        				    },
        			       				    error:function(data,status,er) { 
        			       				        console.log("error: "+data+" status: "+status+" er:"+er);
        			       				    }
        			       				});
        			        		});
        		$("#btnOK").click(function(){
        			$("#modalMessage").bPopup().close();
        			products.deleteProductById($(this).data("id"));
        			
        		});
        		$("#PER_PAGE").change(function(){
        			check = true;
    		    	products.findAllProducts(1);
    		    });
        		
        		//
        		$("#btnClose").click(function(){
        			$("#modalMessage").bPopup().close();
        		});
        		
        		$("#btnOKAlert, #btnCloseAlert").click(function(){
        			$("#modalMessageAlert").bPopup().close();
        		});
        		
        		
        		//Form Add Product
        		
        		$('#btn_add_product').on('hidden.bs.modal', function (event) {
	    		if(isAdded==true)products.findAllProducts(1);
				})
        		
        		$("#btn_cancel").click(function(){
        			$('#form_add_product').modal('hide');
        			
        		});
            		
    			$("#btn_add_product").click(function(){    	
    				clearFormAdd();
    				$('#form_add_product').modal({
    					"backdrop":"static"
    				}) ;
    			});
    			
    			$("#frmProductAdd").submit(function(e){
    				e.preventDefault();    				
    				if($("#productName").val()==""){
    					alert("PLEASE CHOOSE THE CATEGORY");
    					return;
    				}
    				if($("#optUnit").val()==""){
    					alert("PLEASE CHOOSE THE UNIT");
    					return;
    				}
    				
    				if($("#image").val()==""){
    					alert("PLEASE SELECT THE IMAGE.");
    					return;
    				} 
    				  $("#frmProductAdd").ajaxSubmit({
    					url: "${pageContext.request.contextPath}/admin/product/add",
    					dataType: 'JSON', 
    					type: 'POST',
    					success: function(data) { 
    						console.log(data);
     				        if(data){
     				        	alert('YOU HAVE BEEN INSERTED SUCCESSFULLY.');
     				        	isAdded=true;
     				        	clearFormAdd();
     				        	//
     				        }else{
     				        	alert('YOU HAVE ERRORS WHEN INSERT NEW PRODUCT.');
     				        }
     				    },
     				    error:function(data,status,er) { 
     				        console.log("error: "+data+" status: "+status+" er:"+er);
     				    }
    				});  
    			});
    			$('#form_add_product').on('hidden.bs.modal', function () {
    				location.href="${pageContext.request.contextPath}/admin/products";
    			})
    				$("#images").change(function(){			
    					$("#frmProductAdd").ajaxSubmit({
    						url: "${pageContext.request.contextPath}/admin/rest/images/",
    						dataType: 'JSON', 
    						type: 'POST',
    						success: function(data) { 
    							console.log(data);
    					        if(data){
    					        	$("#images_sample").attr("src", "${pageContext.request.contextPath}/resources/images/products/"+data.IMAGE);
    					        	$("#images_sample").show();
    					        	$("#image").val(data.IMAGE);
    					        	//alert('YOU HAVE BEEN INSERTED SUCCESSFULLY.');
    					        }else{
    					        	//alert('YOU HAVE ERRORS WHEN INSERT NEW PRODUCT.');
    					        }
    					    },
    					    error:function(data,status,er) { 
    					        console.log("error: "+data+" status: "+status+" er:"+er);
    					    }
    					});
    				});
    		});
        	
        	function clearFormAdd(){
        		$("#productName").val("");
        		$("#optCategory").val("");
        		$("#optUnit").val("");
        		$("#image").val("");
        		$("#images_sample").attr("src","");
        	}
    	</script>

</body>
</html>