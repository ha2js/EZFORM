<%@page import="com.ezform.domain.EZ_empVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include/header.jsp"%>

<div class="conatiner-fluid content-inner mt-n5 py-0">
	<div class="row">
		<div class="col-md-12 col-lg-9">
			<div class="row">
				<!--------------------------------- 캘린더 영역 ------------------------------>
				<div class="col-md-12">
					<div class="row">
						<div class="col-lg-12">
							<div class="row">
								<div class="col-lg-12">
									<div class="card  ">
										<div class="card-body">
											<div id="wrapper">
												<!-- <div id="calendar1" class="calendar-s" style="height:200px;"></div> -->
												<!-- <div id="loading"></div> -->
												<div id="calendar" class="calendar-s"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--------------------------------- 캘린더 영역 ------------------------------>

				<!--------------------------------- 커뮤니티 영역 ------------------------------>
				<div class="col-md-12 col-xl-6">
					<div class="card">
						<div class="card-header d-flex justify-content-between flex-wrap">
							<div class="header-title">
								<h4 class="card-title">커뮤니티</h4>
							</div>
							<div class="dropdown">

								<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="dropdownMenuButton1">
									<li><a class="dropdown-item" href="#">This Week</a></li>
									<li><a class="dropdown-item" href="#">This Month</a></li>
									<li><a class="dropdown-item" href="#">This Year</a></li>
								</ul>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="datatable" class="table table-striped"
									data-toggle="data-table">
									<thead>
										<tr>
											<th>Name</th>
											<th>Position</th>
											<th>Office</th>
											<th>Age</th>
											<th>Start date</th>
											<th>Salary</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Tiger Nixon</td>
											<td>System Architect</td>
											<td>Edinburgh</td>
											<td>61</td>
											<td>2011/04/25</td>
											<td>$320,800</td>
										</tr>
										<tr>
											<td>Garrett Winters</td>
											<td>Accountant</td>
											<td>Tokyo</td>
											<td>63</td>
											<td>2011/07/25</td>
											<td>$170,750</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<th>Name</th>
											<th>Position</th>
											<th>Office</th>
											<th>Age</th>
											<th>Start date</th>
											<th>Salary</th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!--------------------------------- 커뮤니티 영역 ------------------------------>

				<!--------------------------------- 공지사항 영역 ------------------------------>
				<div class="col-md-12 col-xl-6">
					<div class="card">
						<div class="card-header d-flex justify-content-between flex-wrap">
							<div class="header-title">
								<h4 class="card-title">공지사항</h4>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="datatable" class="table table-striped"
									data-toggle="data-table">
									<thead>
										<tr>
											<th>Name</th>
											<th>Position</th>
											<th>Office</th>
											<th>Age</th>
											<th>Start date</th>
											<th>Salary</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Tiger Nixon</td>
											<td>System Architect</td>
											<td>Edinburgh</td>
											<td>61</td>
											<td>2011/04/25</td>
											<td>$320,800</td>
										</tr>
										<tr>
											<td>Garrett Winters</td>
											<td>Accountant</td>
											<td>Tokyo</td>
											<td>63</td>
											<td>2011/07/25</td>
											<td>$170,750</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<th>Name</th>
											<th>Position</th>
											<th>Office</th>
											<th>Age</th>
											<th>Start date</th>
											<th>Salary</th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!--------------------------------- 공지사항 영역 ------------------------------>
			</div>
		</div>
		<div class="col-md-12 col-lg-3">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<div class="card">
						<div class="card-body d-flex justify-content-around text-center" style="padding: 24px 24px 0 24px;">
							<div
								style="color: #666; font-size: 40px; text-align: center;"
								id="clock">
							</div>
						</div>
						<div class="card-body">
							<div class="text-center">
	                           <div class="user-profile">
		                           <div class="mt-3">
		                              <h3 class="d-inline-block">${resultVO.em_name}</h3><br>
		                              <p class="d-inline-block pl-3">${resultVO.em_dept}</p>
		                           </div>
		                           <img
											src="${pageContext.request.contextPath }/resources/upload/mem_Image/${resultVO.em_image}"
											alt="User-Profile"
											class="img-fluid avatar avatar-155 avatar-rounded"
											onerror="this.src='${pageContext.request.contextPath }/resources/images/silhouette.png'">
	                           </div>
	                        </div>
						</div>
						<div class="card-header">
							<div class="header-title">
								<h4 class="card-title">출퇴근</h4>
							</div>
						</div>
						<div class="card-body">
							
							<div class="d-grid grid-cols-2 gap">
								<button class="btn btn-outline-success rounded-pill d-inline-block">출근하기</button>
								<button class="btn btn-outline-danger rounded-pill d-inline-block">퇴근하기</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header">
							<div class="header-title">
								<h4 class="card-title">접속 사원 현황</h4>
							</div>
						</div>
						<div class="card-body">
							<ul class="list-inline m-0 p-0">
								<li class="d-flex mb-4 align-items-center">
									<div class="img-fluid bg-soft-warning rounded-pill">
										<img
											src="${pageContext.request.contextPath }/resources/images/icons/05.png"
											alt="story-img" class="rounded-pill avatar-40">
									</div>
									<div class="ms-3 flex-grow-1">
										<h6>Paul Molive</h6>
										<p class="mb-0">4 mutual friends</p>
									</div> <a href="javascript:void(0);"
									class="btn btn-outline-primary rounded-circle btn-icon btn-sm p-2">
										<span class="btn-inner"> <svg width="20"
												viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg">
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.87651 15.2063C6.03251 15.2063 2.74951 15.7873 2.74951 18.1153C2.74951 20.4433 6.01251 21.0453 9.87651 21.0453C13.7215 21.0453 17.0035 20.4633 17.0035 18.1363C17.0035 15.8093 13.7415 15.2063 9.87651 15.2063Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.8766 11.886C12.3996 11.886 14.4446 9.841 14.4446 7.318C14.4446 4.795 12.3996 2.75 9.8766 2.75C7.3546 2.75 5.3096 4.795 5.3096 7.318C5.3006 9.832 7.3306 11.877 9.8456 11.886H9.8766Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M19.2036 8.66919V12.6792"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M21.2497 10.6741H17.1597"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                 
	                              </svg>
									</span>
								</a>
								</li>
								<li class="d-flex mb-4 align-items-center">
									<div class="img-fluid bg-soft-danger rounded-pill">
										<img
											src="${pageContext.request.contextPath }/resources/images/icons/03.png"
											alt="story-img" class="rounded-pill avatar-40">
									</div>
									<div class="ms-3 flex-grow-1">
										<h6>Robert Fox</h6>
										<p class="mb-0">4 mutual friends</p>
									</div> <a href="javascript:void(0);"
									class="btn btn-outline-primary rounded-circle btn-icon btn-sm p-2">
										<span class="btn-inner"> <svg width="20"
												viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg">
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.87651 15.2063C6.03251 15.2063 2.74951 15.7873 2.74951 18.1153C2.74951 20.4433 6.01251 21.0453 9.87651 21.0453C13.7215 21.0453 17.0035 20.4633 17.0035 18.1363C17.0035 15.8093 13.7415 15.2063 9.87651 15.2063Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.8766 11.886C12.3996 11.886 14.4446 9.841 14.4446 7.318C14.4446 4.795 12.3996 2.75 9.8766 2.75C7.3546 2.75 5.3096 4.795 5.3096 7.318C5.3006 9.832 7.3306 11.877 9.8456 11.886H9.8766Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M19.2036 8.66919V12.6792"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M21.2497 10.6741H17.1597"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                 
	                              </svg>
									</span>
								</a>
								</li>
								<li class="d-flex mb-4 align-items-center">
									<div class="img-fluid bg-soft-dark rounded-pill">
										<img
											src="${pageContext.request.contextPath }/resources/images/icons/06.png"
											alt="story-img" class="rounded-pill avatar-40">
									</div>
									<div class="ms-3 flex-grow-1">
										<h6>Jenny Wilson</h6>
										<p class="mb-0">6 mutual friends</p>
									</div> <a href="javascript:void(0);"
									class="btn btn-outline-primary rounded-circle btn-icon btn-sm p-2">
										<span class="btn-inner"> <svg width="20"
												viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg">
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.87651 15.2063C6.03251 15.2063 2.74951 15.7873 2.74951 18.1153C2.74951 20.4433 6.01251 21.0453 9.87651 21.0453C13.7215 21.0453 17.0035 20.4633 17.0035 18.1363C17.0035 15.8093 13.7415 15.2063 9.87651 15.2063Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.8766 11.886C12.3996 11.886 14.4446 9.841 14.4446 7.318C14.4446 4.795 12.3996 2.75 9.8766 2.75C7.3546 2.75 5.3096 4.795 5.3096 7.318C5.3006 9.832 7.3306 11.877 9.8456 11.886H9.8766Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M19.2036 8.66919V12.6792"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M21.2497 10.6741H17.1597"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                 
	                              </svg>
									</span>
								</a>
								</li>
								<li class="d-flex mb-4 align-items-center">
									<div class="img-fluid bg-soft-primary rounded-pill">
										<img
											src="${pageContext.request.contextPath }/resources/images/icons/07.png"
											alt="story-img" class="rounded-pill avatar-40">
									</div>
									<div class="ms-3 flex-grow-1">
										<h6>Cody Fisher</h6>
										<p class="mb-0">8 mutual friends</p>
									</div> <a href="javascript:void(0);"
									class="btn btn-outline-primary rounded-circle btn-icon btn-sm p-2">
										<span class="btn-inner"> <svg width="20"
												viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg">
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.87651 15.2063C6.03251 15.2063 2.74951 15.7873 2.74951 18.1153C2.74951 20.4433 6.01251 21.0453 9.87651 21.0453C13.7215 21.0453 17.0035 20.4633 17.0035 18.1363C17.0035 15.8093 13.7415 15.2063 9.87651 15.2063Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.8766 11.886C12.3996 11.886 14.4446 9.841 14.4446 7.318C14.4446 4.795 12.3996 2.75 9.8766 2.75C7.3546 2.75 5.3096 4.795 5.3096 7.318C5.3006 9.832 7.3306 11.877 9.8456 11.886H9.8766Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M19.2036 8.66919V12.6792"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M21.2497 10.6741H17.1597"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                 
	                              </svg>
									</span>
								</a>
								</li>
								<li class="d-flex mb-4 align-items-center">
									<div class="img-fluid bg-soft-info rounded-pill">
										<img
											src="${pageContext.request.contextPath }/resources/images/icons/04.png"
											alt="story-img" class="rounded-pill avatar-40">
									</div>
									<div class="ms-3 flex-grow-1">
										<h6>Bessie Cooper</h6>
										<p class="mb-0">1 mutual friends</p>
									</div> <a href="javascript:void(0);"
									class="btn btn-outline-primary rounded-circle btn-icon btn-sm p-2">
										<span class="btn-inner"> <svg width="20"
												viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg">
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.87651 15.2063C6.03251 15.2063 2.74951 15.7873 2.74951 18.1153C2.74951 20.4433 6.01251 21.0453 9.87651 21.0453C13.7215 21.0453 17.0035 20.4633 17.0035 18.1363C17.0035 15.8093 13.7415 15.2063 9.87651 15.2063Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.8766 11.886C12.3996 11.886 14.4446 9.841 14.4446 7.318C14.4446 4.795 12.3996 2.75 9.8766 2.75C7.3546 2.75 5.3096 4.795 5.3096 7.318C5.3006 9.832 7.3306 11.877 9.8456 11.886H9.8766Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M19.2036 8.66919V12.6792"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M21.2497 10.6741H17.1597"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                 
	                              </svg>
									</span>
								</a>
								</li>
								<li class="d-flex mb-4 align-items-center">
									<div class="img-fluid bg-soft-warning rounded-pill">
										<img
											src="${pageContext.request.contextPath }/resources/images/icons/02.png"
											alt="story-img" class="rounded-pill avatar-40">
									</div>
									<div class="ms-3 flex-grow-1">
										<h6>Wade Warren</h6>
										<p class="mb-0">3 mutual friends</p>
									</div> <a href="javascript:void(0);"
									class="btn btn-outline-primary rounded-circle btn-icon btn-sm p-2">
										<span class="btn-inner"> <svg width="20"
												viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg">
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.87651 15.2063C6.03251 15.2063 2.74951 15.7873 2.74951 18.1153C2.74951 20.4433 6.01251 21.0453 9.87651 21.0453C13.7215 21.0453 17.0035 20.4633 17.0035 18.1363C17.0035 15.8093 13.7415 15.2063 9.87651 15.2063Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.8766 11.886C12.3996 11.886 14.4446 9.841 14.4446 7.318C14.4446 4.795 12.3996 2.75 9.8766 2.75C7.3546 2.75 5.3096 4.795 5.3096 7.318C5.3006 9.832 7.3306 11.877 9.8456 11.886H9.8766Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M19.2036 8.66919V12.6792"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M21.2497 10.6741H17.1597"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                 
	                              </svg>
									</span>
								</a>
								</li>
								<li class="d-flex mb-4 align-items-center">
									<div class="img-fluid bg-soft-success rounded-pill">
										<img
											src="${pageContext.request.contextPath }/resources/images/icons/01.png"
											alt="story-img" class="rounded-pill avatar-40">
									</div>
									<div class="ms-3 flex-grow-1">
										<h6>Guy Hawkins</h6>
										<p class="mb-0">12 mutual friends</p>
									</div> <a href="javascript:void(0);"
									class="btn btn-outline-primary rounded-circle btn-icon btn-sm p-2">
										<span class="btn-inner"> <svg width="20"
												viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg">
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.87651 15.2063C6.03251 15.2063 2.74951 15.7873 2.74951 18.1153C2.74951 20.4433 6.01251 21.0453 9.87651 21.0453C13.7215 21.0453 17.0035 20.4633 17.0035 18.1363C17.0035 15.8093 13.7415 15.2063 9.87651 15.2063Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.8766 11.886C12.3996 11.886 14.4446 9.841 14.4446 7.318C14.4446 4.795 12.3996 2.75 9.8766 2.75C7.3546 2.75 5.3096 4.795 5.3096 7.318C5.3006 9.832 7.3306 11.877 9.8456 11.886H9.8766Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M19.2036 8.66919V12.6792"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M21.2497 10.6741H17.1597"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                 
	                              </svg>
									</span>
								</a>
								</li>
								<li class="d-flex align-items-center">
									<div class="img-fluid bg-soft-info rounded-pill">
										<img
											src="${pageContext.request.contextPath }/resources/images/icons/08.png"
											alt="story-img" class="rounded-pill avatar-40">
									</div>
									<div class="ms-3 flex-grow-1">
										<h6>Floyd Miles</h6>
										<p class="mb-0">2 mutual friends</p>
									</div> <a href="javascript:void(0);"
									class="btn btn-outline-primary rounded-circle btn-icon btn-sm p-2">
										<span class="btn-inner"> <svg width="20"
												viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg">
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.87651 15.2063C6.03251 15.2063 2.74951 15.7873 2.74951 18.1153C2.74951 20.4433 6.01251 21.0453 9.87651 21.0453C13.7215 21.0453 17.0035 20.4633 17.0035 18.1363C17.0035 15.8093 13.7415 15.2063 9.87651 15.2063Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M9.8766 11.886C12.3996 11.886 14.4446 9.841 14.4446 7.318C14.4446 4.795 12.3996 2.75 9.8766 2.75C7.3546 2.75 5.3096 4.795 5.3096 7.318C5.3006 9.832 7.3306 11.877 9.8456 11.886H9.8766Z"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M19.2036 8.66919V12.6792"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                                    
	                                 <path d="M21.2497 10.6741H17.1597"
													stroke="currentColor" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round"></path>                 
	                              </svg>
									</span>
								</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="include/footer.jsp"%>