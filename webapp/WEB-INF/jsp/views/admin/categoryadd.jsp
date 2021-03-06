<%@page import="com.kosign.wecafe.entities.Unit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kosign.wecafe.entities.Category"%>
<%@page import="java.util.List"%>


<!-- Modal -->
<div class="modal fade" id="form_add_category" role="dialog ">
	<div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Form Add Products</h4>
			</div>
			<div class="modal-body">
				<div class=" form">
					<form class="cmxform form-horizontal tasi-form" id="frmAddCategory"
						method="POST" action="#">
						<div class="form-group ">
							<label for="productname" class="control-label col-lg-2">Category
								Name *</label>
							<div class="col-lg-10">
								<input class=" form-control" id="categoryName"
									name="categoryName" type="text" required="required">
							</div>
						</div>
						<div class="form-group ">
							<label for="productname" class="control-label col-lg-2">Image
								*</label>
							<div class="col-lg-10">
								<input class="form-control " id="images" name="images"
									type="file" required="required"> <input type="hidden"
									id="image" name="image" /> <img src="" id="images_sample"
									name="images_sample" class="img-thumbnail"
									style="display: none; width: 450px; height: 450px;">
							</div>
						</div>

						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
								<button class="btn btn-success waves-effect waves-light"
									type="button" id="btnSubmit">Save</button>
								<button class="btn btn-default waves-effect" type="button" id="btn_cancel">Cancel</button>
							</div>
						</div>
					</form>
				</div>
				<!-- .form -->


			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>









