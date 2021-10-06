<%@page import="com.ezform.domain.EZ_empVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include/header.jsp"%>

<div class="container">
	<input type="hidden" name="em_id" id="em_id" value="${em_id}" />


	<!-- 일자 클릭시 메뉴오픈 -->
	<div id="contextMenu" class="dropdown clearfix">
		<ul class="dropdown-menu dropNewEvent" role="menu"
			aria-labelledby="dropdownMenu"
			style="display: block; position: static; margin-bottom: 5px;">
			<li><a tabindex="-1" href="#">카테고리1</a></li>
			<li><a tabindex="-1" href="#">카테고리2</a></li>
			<li><a tabindex="-1" href="#">카테고리3</a></li>
			<li><a tabindex="-1" href="#">카테고리4</a></li>
			<li class="divider"></li>
			<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
		</ul>
	</div>
	<div class="col-md-12">
		<div class="card">
			<div class="card-body">
				<div id="wrapper">
					<div id="loading"></div>
					<div id="calendar"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- 일정 추가 MODAL -->
	<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="padding: 15px; border-bottom: 1px solid #e5e5e5;">
					
					<h4 class="modal-title" style="font-size: 18px;"></h4>
					<button type="button" class="close" data-dismiss="modal" id="button3"
						aria-label="Close"
						style="padding: 0; cursor: pointer; background: 0 0; border: 0; ">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="">

					<div class="row">
						<div class="col-xs-12" style="width: 100%;">
							<label class="col-xs-4" for="edit-allDay"
								style="width: 33.33333333%;">하루종일</label> <input
								class='allDayNewEvent' id="edit-allDay" type="checkbox" />
						</div>
					</div>

					<div class="row">
						<div class="col-xs-12" style="width: 100%;">
							<label class="col-xs-4" for="edit-title"
								style="width: 33.33333333%;">일정명</label> <input
								class="inputModal" type="text" name="edit-title" id="edit-title"
								required="required" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12" style="width: 100%;">
							<label class="col-xs-4" for="edit-start"
								style="width: 33.33333333%;">시작</label> <input
								class="inputModal" type="text" name="edit-start" id="edit-start" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12" style="width: 100%;">
							<label class="col-xs-4" for="edit-end"
								style="width: 33.33333333%;">끝</label> <input class="inputModal"
								type="text" name="edit-end" id="edit-end" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12" style="width: 100%;">
							<label class="col-xs-4" for="edit-type"
								style="width: 33.33333333%;">구분</label> <select
								class="inputModal" type="text" name="edit-type" id="edit-type">
								<option value="카테고리1">카테고리1</option>
								<option value="카테고리2">카테고리2</option>
								<option value="카테고리3">카테고리3</option>
								<option value="카테고리4">카테고리4</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12" style="width: 100%;">
							<label class="col-xs-4" for="edit-color"
								style="width: 33.33333333%;">색상</label> <select
								class="inputModal" name="color" id="edit-color">
								<option value="rgba(206, 32, 20, 1)"
									style="color: rgba(206, 32, 20, 1);">빨간색</option>
								<option value="rgba(133, 21, 208, 1)"
									style="color: rgba(133, 21, 208, 1);">보라색</option>
								<option value="rgba(235, 153, 27, 1)"
									style="color: rgba(235, 153, 27, 1);">주황색</option>
								<option value="rgba(58, 87, 232, 1)"
									style="color: rgba(58, 87, 232, 1);">파란색</option>
								<option value="rgba(208, 21, 152, 1)"
									style="color: rgba(208, 21, 152, 1);">핑크색</option>
								<option value="rgba(114, 208, 21, 1)"
									style="color: rgba(114, 208, 21, 1);">연두색</option>
								<option value="rgba(21, 208, 58, 1)"
									style="color: rgba(21, 208, 58, 1);">초록색</option>
								<option value="rgba(21, 0, 128, 1)"
									style="color: rgba(21, 0, 128, 1);">남색</option>
								<option value="rgba(73, 80, 87, 1)"
									style="color: rgba(73, 80, 87, 1);">검정색</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12"
							style="width: 100%; display: flex; align-items: flex-start;">
							<label class="col-xs-4" for="edit-desc"
								style="width: 33.33333333%;">설명</label>
							<textarea rows="4" cols="50" class="inputModal" name="edit-desc"
								id="edit-desc"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer modalBtnContainer-addEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="button1">취소</button>
					<button type="button" class="btn btn-primary" id="save-event">저장</button>
				</div>
				<div class="modal-footer modalBtnContainer-modifyEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="button2" >닫기</button>
					<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
					<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- <div class="panel panel-default">

		<div class="panel-heading">
			<h3 class="panel-title">필터</h3>
		</div>

		<div class="panel-body">

			<div class="col-lg-6">
				<label for="calendar_view">구분별</label>
				<div class="input-group">
					<select class="filter" id="type_filter" multiple="multiple">
						<option value="카테고리1">카테고리1</option>
						<option value="카테고리2">카테고리2</option>
						<option value="카테고리3">카테고리3</option>
						<option value="카테고리4">카테고리4</option>
					</select>
				</div>
			</div>

		</div>
	</div> -->
	<!-- /.filter panel -->
</div>
<!-- /.container -->
<%@ include file="include/footer.jsp"%>