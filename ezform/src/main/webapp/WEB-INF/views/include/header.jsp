<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>EZFORM | business Flatform Project</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/images/favicon.ico" />
<!-- Library / Plugin Css Build -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/libs.min.css">

<!-- FullCalendar 2 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/vendor/css/fullcalendar.min.css" />
<%--  <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/vendor/css/bootstrap.min.css" />  --%>
<link rel="stylesheet"
	href='${pageContext.request.contextPath }/resources/vendor/css/select2.min.css' />
<link rel="stylesheet"
	href='${pageContext.request.contextPath }/resources/vendor/css/bootstrap-datetimepicker.min.css' />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/main.css">

<!-- Custom Css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/hope-ui.css?v=1.0.2">
<!-- jQuery -->
<script
	src="${pageContext.request.contextPath }/resources/js/jQuery-2.1.4.min.js"></script>

<script type="text/javascript">
	// 세션 제어
	var result = "${result}";
	var resultVO = "${resultVO}";
	var sessionID = "${resultVO.em_id}";

	if (sessionID == "" && result == "") {
		location.href = "/test/login";
	}

	// 로그인 처리
	if (result == -2) {
		alert("이메일이 존재하지 않습니다");
		location.href = "/test/login";
	} else if (result == -1) {
		alert("패스워드가 틀립니다. 다시 입력해주세요.");
		location.href = "/test/login";
	} else if (result == 1) {

	} else {

	}
</script>

<%
Integer em_id = 0;

if (session.getAttribute("em_id") != null) {
	em_id = (Integer) session.getAttribute("em_id");
}
%>


</head>
<body class="  " onload="printClock()">
	<!-- dark/light/auto mode -->
	<!-- loader Start -->
	<div id="loading">
		<div class="loader simple-loader">
			<div class="loader-body"></div>
		</div>
	</div>
	<!-- loader END -->

	<aside class="sidebar sidebar-default navs-rounded-all ">
		<div
			class="sidebar-header d-flex align-items-center justify-content-start">
			<a href="/test/main" class="navbar-brand"> <!--Logo start--> <img
				src="${pageContext.request.contextPath }/resources/images/logo_ezform.svg" />
				<h4 class="logo-title">EZFORM</h4>
			</a>
			<div class="sidebar-toggle" data-toggle="sidebar" data-active="true">
				<i class="icon"> <svg width="20" height="20" viewBox="0 0 24 24"
						fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M4.25 12.2744L19.25 12.2744"
							stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
							stroke-linejoin="round"></path>
                        <path
							d="M10.2998 18.2988L4.2498 12.2748L10.2998 6.24976"
							stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
							stroke-linejoin="round"></path>
                    </svg>
				</i>
			</div>
		</div>

		<!------------------------------------------------------- HOME 영역 ------------------------------------------------------------->

		<div class="sidebar-body pt-0 data-scrollbar">
			<div class="collapse navbar-collapse" id="sidebar">
				<!-- Sidebar Menu Start -->
				<ul class="navbar-nav iq-main-menu">
					<li class="nav-item static-item"><a
						class="nav-link static-item disabled" href="#" tabindex="-1">
							<span class="default-icon">Home</span> <span class="mini-icon">-</span>
					</a></li>
					<li class="nav-item"><a class="nav-link "
						aria-current="page" href="/test/main"> <i class="icon"><svg
									width="20" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
							<path
										d="M9.14373 20.7821V17.7152C9.14372 16.9381 9.77567
								 16.3067 10.5584 16.3018H13.4326C14.2189 16.3018 14.8563 
								 16.9346 14.8563 17.7152V20.7732C14.8562 21.4473 15.404 
								 21.9951 16.0829 22H18.0438C18.9596 22.0023 19.8388 21.6428 
								 20.4872 21.0007C21.1356 20.3586 21.5 19.4868 21.5 
								 18.5775V9.86585C21.5 9.13139 21.1721 8.43471 20.6046
								  7.9635L13.943 2.67427C12.7785 1.74912 11.1154 1.77901
								   9.98539 2.74538L3.46701 7.9635C2.87274 8.42082 2.51755 
								   9.11956 2.5 9.86585V18.5686C2.5 20.4637 4.04738 22 5.95617
								    22H7.87229C8.19917 22.0023 8.51349 21.8751 8.74547 21.6464C8.97746
								     21.4178 9.10793 21.1067 9.10792 20.7821H9.14373Z"
										fill="currentColor">
							</path></svg> </i> <span class="item-name">홈</span>
					</a></li>

					<!------------------------------------------------------- HOME 영역 ------------------------------------------------------------->

					<!------------------------------------------------------- Pages 영역 ------------------------------------------------------------->

					<li><hr class="hr-horizontal"></li>
					<li class="nav-item static-item"><a
						class="nav-link static-item disabled" href="#" tabindex="-1">
							<span class="default-icon">Company</span> <span class="mini-icon">-</span>
					</a></li>

					<!---------------------------------- 사이드메뉴 : 출근정보 ---------------------------------------------->
					<li class="nav-item"><a class="nav-link "
						href="./dashboard/table/table-data.html"> <i class="icon">
								<svg width="20" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
                            	    <path
										d="M22.4541 11.3918C22.7819 11.7385 22.7819 12.2615 22.4541 12.6082C21.0124 14.1335 16.8768 18 12 18C7.12317 18 2.98759 14.1335 1.54586 12.6082C1.21811 12.2615 1.21811 11.7385 1.54586 11.3918C2.98759 9.86647 7.12317 6 12 6C16.8768 6 21.0124 9.86647 22.4541 11.3918Z"
										fill="#130F26" fill-opacity="0.4" stroke="#130F26"></path>                                    
                            	    <circle cx="12" cy="12" r="5"
										stroke="#130F26"></circle>                                    
                            	    <circle cx="12" cy="12" r="3"
										fill="#130F26"></circle>                                    
                            	    <mask mask-type="alpha"
										maskUnits="userSpaceOnUse" x="9" y="9" width="6" height="6">                                    
                            	    <circle cx="12" cy="12" r="3"
										fill="#130F26"></circle></mask>                                    
                            	    <circle opacity="0.53" cx="13.5"
										cy="10.5" r="1.5" fill="white"></circle>
                            	</svg>
						</i> <span class="item-name">출퇴근</span>
					</a></li>

					<!---------------------------------- 사이드메뉴 : 출근정보 ---------------------------------------------->

					<!---------------------------------- 사이드메뉴 : 사원목록(관리자 권한) ---------------------------------------------->
					<%
					if (em_id == 9999) {
					%>
					<li class="nav-item"><a class="nav-link "
						href="/test/ez_emp/list"> <i class="icon"> <svg width="20"
									viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
                            		<path
										d="M11.9488 14.54C8.49884 14.54 5.58789 15.1038 5.58789 17.2795C5.58789 19.4562 8.51765 20.0001 11.9488 20.0001C15.3988 20.0001 18.3098 19.4364 18.3098 17.2606C18.3098 15.084 15.38 14.54 11.9488 14.54Z"
										fill="currentColor"></path>
                            		<path opacity="0.4"
										d="M11.949 12.467C14.2851 12.467 16.1583 10.5831 16.1583 8.23351C16.1583 5.88306 14.2851 4 11.949 4C9.61293 4 7.73975 5.88306 7.73975 8.23351C7.73975 10.5831 9.61293 12.467 11.949 12.467Z"
										fill="currentColor"></path>
                            		<path opacity="0.4"
										d="M21.0881 9.21923C21.6925 6.84176 19.9205 4.70654 17.664 4.70654C17.4187 4.70654 17.1841 4.73356 16.9549 4.77949C16.9244 4.78669 16.8904 4.802 16.8725 4.82902C16.8519 4.86324 16.8671 4.90917 16.8895 4.93889C17.5673 5.89528 17.9568 7.0597 17.9568 8.30967C17.9568 9.50741 17.5996 10.6241 16.9728 11.5508C16.9083 11.6462 16.9656 11.775 17.0793 11.7948C17.2369 11.8227 17.3981 11.8371 17.5629 11.8416C19.2059 11.8849 20.6807 10.8213 21.0881 9.21923Z"
										fill="currentColor"></path>                                
                            		<path
										d="M22.8094 14.817C22.5086 14.1722 21.7824 13.73 20.6783 13.513C20.1572 13.3851 18.747 13.205 17.4352 13.2293C17.4155 13.232 17.4048 13.2455 17.403 13.2545C17.4003 13.2671 17.4057 13.2887 17.4316 13.3022C18.0378 13.6039 20.3811 14.916 20.0865 17.6834C20.074 17.8032 20.1698 17.9068 20.2888 17.8888C20.8655 17.8059 22.3492 17.4853 22.8094 16.4866C23.0637 15.9589 23.0637 15.3456 22.8094 14.817Z"
										fill="currentColor"></path>                                
                            		<path opacity="0.4"
										d="M7.04459 4.77973C6.81626 4.7329 6.58077 4.70679 6.33543 4.70679C4.07901 4.70679 2.30701 6.84201 2.9123 9.21947C3.31882 10.8216 4.79355 11.8851 6.43661 11.8419C6.60136 11.8374 6.76343 11.8221 6.92013 11.7951C7.03384 11.7753 7.09115 11.6465 7.02668 11.551C6.3999 10.6234 6.04263 9.50765 6.04263 8.30991C6.04263 7.05904 6.43303 5.89462 7.11085 4.93913C7.13234 4.90941 7.14845 4.86348 7.12696 4.82926C7.10906 4.80135 7.07593 4.78694 7.04459 4.77973Z"
										fill="currentColor"></path>                                
                            		<path
										d="M3.32156 13.5127C2.21752 13.7297 1.49225 14.1719 1.19139 14.8167C0.936203 15.3453 0.936203 15.9586 1.19139 16.4872C1.65163 17.4851 3.13531 17.8066 3.71195 17.8885C3.83104 17.9065 3.92595 17.8038 3.91342 17.6832C3.61883 14.9167 5.9621 13.6046 6.56918 13.3029C6.59425 13.2885 6.59962 13.2677 6.59694 13.2542C6.59515 13.2452 6.5853 13.2317 6.5656 13.2299C5.25294 13.2047 3.84358 13.3848 3.32156 13.5127Z"
										fill="currentColor"></path>                                
                            	</svg>
						</i> <span class="item-name">사원목록</span>
					</a></li>
					<%
					}
					%>

					<!---------------------------------- 사이드메뉴 : 사원목록 ---------------------------------------------->

					<!---------------------------------- 사이드메뉴 : 메일 ---------------------------------------------->

					<li class="nav-item"><a class="nav-link"
						data-bs-toggle="collapse" href="#sidebar-user" role="button"
						aria-expanded="false" aria-controls="sidebar-user"><i
							class="icon"> <svg width="20" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
                            		<path opacity="0.4"
										d="M22 15.94C22 18.73 19.76 20.99 16.97 21H16.96H7.05C4.27 21 2 18.75 2 15.96V15.95C2 15.95 2.006 11.524 2.014 9.298C2.015 8.88 2.495 8.646 2.822 8.906C5.198 10.791 9.447 14.228 9.5 14.273C10.21 14.842 11.11 15.163 12.03 15.163C12.95 15.163 13.85 14.842 14.56 14.262C14.613 14.227 18.767 10.893 21.179 8.977C21.507 8.716 21.989 8.95 21.99 9.367C22 11.576 22 15.94 22 15.94Z"
										fill="currentColor"></path>
                            		<path
										d="M21.4759 5.67351C20.6099 4.04151 18.9059 2.99951 17.0299 2.99951H7.04988C5.17388 2.99951 3.46988 4.04151 2.60388 5.67351C2.40988 6.03851 2.50188 6.49351 2.82488 6.75151L10.2499 12.6905C10.7699 13.1105 11.3999 13.3195 12.0299 13.3195C12.0339 13.3195 12.0369 13.3195 12.0399 13.3195C12.0429 13.3195 12.0469 13.3195 12.0499 13.3195C12.6799 13.3195 13.3099 13.1105 13.8299 12.6905L21.2549 6.75151C21.5779 6.49351 21.6699 6.03851 21.4759 5.67351Z"
										fill="currentColor"></path>                               
                            	</svg>
						</i> <span class="item-name">메일</span><i class="right-icon"> <svg
									xmlns="http://www.w3.org/2000/svg" width="18" fill="none"
									viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                                </svg>
						</i> </a>
						<ul class="sub-nav collapse" id="sidebar-user"
							data-bs-parent="#sidebar">
							<li class="nav-item"><a class="nav-link "
								href="/test/ez_mail/recMail"> <i class="icon"> <svg
											xmlns="http://www.w3.org/2000/svg" width="10"
											viewBox="0 0 24 24" fill="currentColor">
                                            <g>
                                            <circle cx="12" cy="12"
												r="8" fill="currentColor"></circle>
                                            </g>
                                        </svg>
								</i> <i class="sidenav-mini-icon"> U </i> <span class="item-name">받은
										메일함</span>
							</a></li>
							<li class="nav-item"><a class="nav-link "
								href="/test/ez_mail/sendMail"> <i class="icon"> <svg
											xmlns="http://www.w3.org/2000/svg" width="10"
											viewBox="0 0 24 24" fill="currentColor">
                                            <g>
                                            <circle cx="12" cy="12"
												r="8" fill="currentColor"></circle>
                                            </g>
                                        </svg>
								</i> <i class="sidenav-mini-icon"> A </i> <span class="item-name">보낸
										메일함</span>
							</a></li>
							<li class="nav-item"><a class="nav-link "
								href="/test/ez_mail/impMail"> <i class="icon"> <svg
											xmlns="http://www.w3.org/2000/svg" width="10"
											viewBox="0 0 24 24" fill="currentColor">
                                            <g>
                                            <circle cx="12" cy="12"
												r="8" fill="currentColor"></circle>
                                            </g>
                                        </svg>
								</i> <i class="sidenav-mini-icon"> U </i> <span class="item-name">중요
										보관함</span>
							</a></li>
						</ul></li>


					<!---------------------------------- 사이드메뉴 : 메일 ---------------------------------------------->

					<!---------------------------------- 사이드메뉴 : 캘린더 게시판 ------------------------------------->

					<li class="nav-item"><a class="nav-link "
						href="/test/calendar/"> <i class="icon"> <svg width="20"
									viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
                                	<path fill-rule="evenodd"
										clip-rule="evenodd"
										d="M3 16.8701V9.25708H21V16.9311C21 20.0701 19.0241 22.0001 15.8628 22.0001H8.12733C4.99561 22.0001 3 20.0301 3 16.8701ZM7.95938 14.4101C7.50494 14.4311 7.12953 14.0701 7.10977 13.6111C7.10977 13.1511 7.46542 12.7711 7.91987 12.7501C8.36443 12.7501 8.72997 13.1011 8.73985 13.5501C8.7596 14.0111 8.40395 14.3911 7.95938 14.4101ZM12.0198 14.4101C11.5653 14.4311 11.1899 14.0701 11.1701 13.6111C11.1701 13.1511 11.5258 12.7711 11.9802 12.7501C12.4248 12.7501 12.7903 13.1011 12.8002 13.5501C12.82 14.0111 12.4643 14.3911 12.0198 14.4101ZM16.0505 18.0901C15.596 18.0801 15.2305 17.7001 15.2305 17.2401C15.2206 16.7801 15.5862 16.4011 16.0406 16.3911H16.0505C16.5148 16.3911 16.8902 16.7711 
                                	16.8902 17.2401C16.8902 17.7101 16.5148 18.0901 16.0505 18.0901ZM11.1701 17.2401C11.1899 17.7001 11.5653 18.0611 12.0198 18.0401C12.4643 18.0211 12.82 17.6411 12.8002 17.1811C12.7903 16.7311 12.4248 16.3801 11.9802 16.3801C11.5258 16.4011 11.1701 16.7801 11.1701 17.2401ZM7.09989 17.2401C7.11965 17.7001 7.49506 18.0611 7.94951 18.0401C8.39407 18.0211 8.74973 17.6411 8.72997 17.1811C8.72009 16.7311 8.35456 16.3801 7.90999 16.3801C7.45554 16.4011 7.09989 16.7801 7.09989 17.2401ZM15.2404 13.6011C15.2404 13.1411 15.596 12.7711 16.0505 12.7611C16.4951 12.7611 16.8507 13.1201 16.8705 13.5611C16.8804 14.0211 16.5247 14.4011 16.0801 14.4101C15.6257 14.4201 15.2503 14.0701 15.2404 13.6111V13.6011Z"
										fill="currentColor"></path>
                                	<path opacity="0.4"
										d="M3.00293 9.25699C3.01577 8.66999 3.06517 7.50499 3.15803 7.12999C3.63224 5.02099 5.24256 3.68099 7.54442 3.48999H16.4555C18.7376 3.69099 20.3677 5.03999 20.8419 7.12999C20.9338 7.49499 20.9832 8.66899 20.996 9.25699H3.00293Z"
										fill="currentColor"></path>
                                	<path
										d="M8.30465 6.59C8.73934 6.59 9.06535 6.261 9.06535 5.82V2.771C9.06535 2.33 8.73934 2 8.30465 2C7.86996 2 7.54395 2.33 7.54395 2.771V5.82C7.54395 6.261 7.86996 6.59 8.30465 6.59Z"
										fill="currentColor"></path>                                
                                	<path
										d="M15.6953 6.59C16.1201 6.59 16.456 6.261 16.456 5.82V2.771C16.456 2.33 16.1201 2 15.6953 2C15.2606 2 14.9346 2.33 14.9346 2.771V5.82C14.9346 6.261 15.2606 6.59 15.6953 6.59Z"
										fill="currentColor"></path>
                                </svg>
						</i> <span class="item-name">캘린더</span>
					</a></li>

					<!---------------------------------- 사이드메뉴 : 캘린더 게시판 ------------------------------------->


					<!-- ------------------------------------------------------사이드 메뉴 3번-------------------------------------------------------------->

					<li class="nav-item static-item"><a
						class="nav-link static-item disabled" href="#" tabindex="-1">
							<span class="default-icon">Contact</span> <span class="mini-icon">-</span>
					</a></li>

					<!---------------------------------- 사이드메뉴 : 커뮤니티 게시판 ----------------------------------->
					<li class="nav-item"><a class="nav-link"
						href="/test/board/listPage"> <i class="icon"> <svg
									width="20" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">                                
                               		<path opacity="0.4"
										d="M2 11.0786C2.05 13.4166 2.19 17.4156 2.21 17.8566C2.281 18.7996 2.642 19.7526 3.204 20.4246C3.986 21.3676 4.949 21.7886 6.292 21.7886C8.148 21.7986 10.194 21.7986 12.181 21.7986C14.176 21.7986 16.112 21.7986 17.747 21.7886C19.071 21.7886 20.064 21.3566 20.836 20.4246C21.398 19.7526 21.759 18.7896 21.81 17.8566C21.83 17.4856 21.93 13.1446 21.99 11.0786H2Z"
										fill="currentColor"></path>                                <path
										d="M11.2451 15.3843V16.6783C11.2451 17.0923 11.5811 17.4283 11.9951 17.4283C12.4091 17.4283 12.7451 17.0923 12.7451 16.6783V15.3843C12.7451 14.9703 12.4091 14.6343 11.9951 14.6343C11.5811 14.6343 11.2451 14.9703 11.2451 15.3843Z"
										fill="currentColor"></path>                                <path
										fill-rule="evenodd" clip-rule="evenodd"
										d="M10.211 14.5565C10.111 14.9195 9.762 15.1515 9.384 15.1015C6.833 14.7455 4.395 13.8405 2.337 12.4815C2.126 12.3435 2 12.1075 2 11.8555V8.38949C2 6.28949 3.712 4.58149 5.817 4.58149H7.784C7.972 3.12949 9.202 2.00049 10.704 2.00049H13.286C14.787 2.00049 16.018 3.12949 16.206 4.58149H18.183C20.282 4.58149 21.99 6.28949 21.99 8.38949V11.8555C21.99 12.1075 21.863 12.3425 21.654 12.4815C19.592 13.8465 17.144 14.7555 14.576 15.1105C14.541 15.1155 14.507 15.1175 14.473 15.1175C14.134 15.1175 13.831 14.8885 13.746 14.5525C13.544 13.7565 12.821 13.1995 11.99 13.1995C11.148 13.1995 10.433 13.7445 10.211 14.5565ZM13.286 3.50049H10.704C10.031 3.50049 9.469 3.96049 9.301 4.58149H14.688C14.52 3.96049 13.958 3.50049 13.286 3.50049Z"
										fill="currentColor">
                               		</path>
                               	</svg>
						</i> <span class="item-name">커뮤니티 게시판</span>
					</a></li>

					<!---------------------------------- 사이드메뉴 : 커뮤니티 게시판 ----------------------------------->

					<!---------------------------------- 사이드메뉴 : 공지사항 ---------------------------------------------->
					<li class="nav-item"><a class="nav-link "
						href="/test/ez_notice/listAll"> <i class="icon"> <svg
									width="20" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
                            		<path opacity="0.4"
										d="M16.34 1.99976H7.67C4.28 1.99976 2 4.37976 2 7.91976V16.0898C2 19.6198 4.28 21.9998 7.67 21.9998H16.34C19.73 21.9998 22 19.6198 22 16.0898V7.91976C22 4.37976 19.73 1.99976 16.34 1.99976Z"
										fill="currentColor"></path>
                            		<path fill-rule="evenodd"
										clip-rule="evenodd"
										d="M11.1246 8.18921C11.1246 8.67121 11.5156 9.06421 11.9946 9.06421C12.4876 9.06421 12.8796 8.67121 12.8796 8.18921C12.8796 7.70721 12.4876 7.31421 12.0046 7.31421C11.5196 7.31421 11.1246 7.70721 11.1246 8.18921ZM12.8696 11.362C12.8696 10.88 12.4766 10.487 11.9946 10.487C11.5126 10.487 11.1196 10.88 11.1196 11.362V15.782C11.1196 16.264 11.5126 16.657 11.9946 16.657C12.4766 16.657 12.8696 16.264 12.8696 15.782V11.362Z"
										fill="currentColor"></path>
                            	</svg>
						</i> <span class="item-name">공지사항</span>
					</a></li>

					<!---------------------------------- 사이드메뉴 : 공지사항 ---------------------------------------------->


				</ul>
				<!-- Sidebar Menu End -->
			</div>
		</div>
		<div class="sidebar-footer"></div>
	</aside>

	<main class="main-content">
		<div class="position-relative">
			<!--Nav Start-->
			<nav class="nav navbar navbar-expand-lg navbar-light iq-navbar">
				<div class="container-fluid navbar-inner">
					<a href="../dashboard/index.html" class="navbar-brand"> <!--Logo start-->
						<svg width="30" class="text-primary" viewBox="0 0 30 30"
							fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect x="-0.757324" y="19.2427" width="28"
								height="4" rx="2" transform="rotate(-45 -0.757324 19.2427)"
								fill="currentColor" />
                    <rect x="7.72803" y="27.728" width="28" height="4"
								rx="2" transform="rotate(-45 7.72803 27.728)"
								fill="currentColor" />
                    <rect x="10.5366" y="16.3945" width="16" height="4"
								rx="2" transform="rotate(45 10.5366 16.3945)"
								fill="currentColor" />
                    <rect x="10.5562" y="-0.556152" width="28"
								height="4" rx="2" transform="rotate(45 10.5562 -0.556152)"
								fill="currentColor" />
                </svg> <!--logo End-->
						<h4 class="logo-title">EZFORM</h4>
					</a>
					<div class="sidebar-toggle" data-toggle="sidebar"
						data-active="true">
						<i class="icon"> <svg width="20px" height="20px"
								viewBox="0 0 24 24">
                    <path fill="currentColor"
									d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z" />
                </svg>
						</i>
					</div>
					<div class="input-group search-input">
						<span class="input-group-text" id="search-input"> <svg
								width="18" viewBox="0 0 24 24" fill="none"
								xmlns="http://www.w3.org/2000/svg">
                    <circle cx="11.7669" cy="11.7666" r="8.98856"
									stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
									stroke-linejoin="round"></circle>
                    <path d="M18.0186 18.4851L21.5426 22"
									stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
									stroke-linejoin="round"></path>
                </svg>
						</span> <input type="search" class="form-control" placeholder="Search...">
					</div>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"> <span
							class="navbar-toggler-bar bar1 mt-2"></span> <span
							class="navbar-toggler-bar bar2"></span> <span
							class="navbar-toggler-bar bar3"></span>
						</span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto  navbar-list mb-2 mb-lg-0">
							<li class="nav-item dropdown"><a href="#" class="nav-link"
								id="mail-drop" data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <svg width="24" viewBox="0 0 24 24"
										fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path opacity="0.4"
											d="M22 15.94C22 18.73 19.76 20.99 16.97 21H16.96H7.05C4.27 21 2 18.75 2 15.96V15.95C2 15.95 2.006 11.524 2.014 9.298C2.015 8.88 2.495 8.646 2.822 8.906C5.198 10.791 9.447 14.228 9.5 14.273C10.21 14.842 11.11 15.163 12.03 15.163C12.95 15.163 13.85 14.842 14.56 14.262C14.613 14.227 18.767 10.893 21.179 8.977C21.507 8.716 21.989 8.95 21.99 9.367C22 11.576 22 15.94 22 15.94Z"
											fill="currentColor"></path>
                      <path
											d="M21.4759 5.67351C20.6099 4.04151 18.9059 2.99951 17.0299 2.99951H7.04988C5.17388 2.99951 3.46988 4.04151 2.60388 5.67351C2.40988 6.03851 2.50188 6.49351 2.82488 6.75151L10.2499 12.6905C10.7699 13.1105 11.3999 13.3195 12.0299 13.3195C12.0339 13.3195 12.0369 13.3195 12.0399 13.3195C12.0429 13.3195 12.0469 13.3195 12.0499 13.3195C12.6799 13.3195 13.3099 13.1105 13.8299 12.6905L21.2549 6.75151C21.5779 6.49351 21.6699 6.03851 21.4759 5.67351Z"
											fill="currentColor"></path>
                    </svg> <span class="bg-primary count-mail"></span>
							</a>
								<div class="sub-drop dropdown-menu dropdown-menu-end p-0"
									aria-labelledby="mail-drop">
									<div class="card shadow-none m-0">
										<div
											class="card-header d-flex justify-content-between bg-primary py-3">
											<div class="header-title">
												<h5 class="mb-0 text-white">ìì§ ì ì½ì ë©ì¼</h5>
											</div>
										</div>
										<div class="card-body p-0 ">
											<a href="#" class="iq-sub-card">
												<div class="d-flex  align-items-center">
													<div class="">
														<img class="avatar-40 rounded-pill bg-soft-primary p-1"
															src="${pageContext.request.contextPath }/resources/images/shapes/01.png"
															alt="">
													</div>
													<div class="ms-3">
														<h6 class="mb-0 ">Bni Emma Watson</h6>
														<small class="float-start font-size-12">13 Jun</small>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="d-flex align-items-center">
													<div class="">
														<img class="avatar-40 rounded-pill bg-soft-primary p-1"
															src="${pageContext.request.contextPath }/resources/images/shapes/02.png"
															alt="">
													</div>
													<div class="ms-3">
														<h6 class="mb-0 ">Lorem Ipsum Watson</h6>
														<small class="float-start font-size-12">20 Apr</small>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="d-flex align-items-center">
													<div class="">
														<img class="avatar-40 rounded-pill bg-soft-primary p-1"
															src="${pageContext.request.contextPath }/resources/images/shapes/03.png"
															alt="">
													</div>
													<div class="ms-3">
														<h6 class="mb-0 ">Why do we use it?</h6>
														<small class="float-start font-size-12">30 Jun</small>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="d-flex align-items-center">
													<div class="">
														<img class="avatar-40 rounded-pill bg-soft-primary p-1"
															src="${pageContext.request.contextPath }/resources/images/shapes/04.png"
															alt="">
													</div>
													<div class="ms-3">
														<h6 class="mb-0 ">Variations Passages</h6>
														<small class="float-start font-size-12">12 Sep</small>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="d-flex align-items-center">
													<div class="">
														<img class="avatar-40 rounded-pill bg-soft-primary p-1"
															src="${pageContext.request.contextPath }/resources/images/shapes/05.png"
															alt="">
													</div>
													<div class="ms-3">
														<h6 class="mb-0 ">Lorem Ipsum generators</h6>
														<small class="float-start font-size-12">5 Dec</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div></li>

							<!-- ----------------------------------------------------- 로그인/회원정보/로그아웃 영역 ------------------------------------------------- -->

							<li class="nav-item dropdown"><a
								class="nav-link py-0 d-flex align-items-center" href="#"
								id="navbarDropdown" role="button" data-bs-toggle="dropdown"
								aria-expanded="false"> <img
									src="${pageContext.request.contextPath }/resources/upload/mem_Image/${resultVO.em_image}"
									alt="User-Profile"
									class="img-fluid avatar avatar-50 avatar-rounded"
									onerror="this.src='${pageContext.request.contextPath }/resources/images/silhouette.png'">
									<div class="caption ms-3 d-none d-md-block ">
										<h6 class="mb-0 caption-title">${resultVO.em_name}</h6>
										<p class="mb-0 caption-sub-title">${resultVO.em_email}</p>
										<input type="hidden" name="em_id" id="em_id" value="${em_id}" />
									</div>
							</a>
								<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdown">
									<%
									String menu_name = "";

									// 권한의 따른 메뉴변경
									if (em_id == 9999) {
										menu_name = "사원관리";
									} else {
										menu_name = "My프로필";
									}
									%>

									<li><a class="dropdown-item" href="/test/infoMember"><%=menu_name%></a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="/test/logout">로그아웃</a></li>
								</ul></li>

							<!-- ----------------------------------------------------- 로그인/회원정보/로그아웃 영역 ------------------------------------------------- -->

						</ul>
					</div>
				</div>
			</nav>

			<!-- Nav Header Component Start -->
			<div class="iq-navbar-header" style="height: 105px;">
				<div class="container-fluid iq-container">
					<div class="row">
						<div class="col-md-12" id="main-menu-label"></div>
					</div>
				</div>
				<div class="iq-header-img">
					<img
						src="${pageContext.request.contextPath }/resources/images/dashboard/top-header.png"
						alt="header" class="img-fluid w-100 h-100 animated-scaleX">
				</div>
			</div>
			<!-- Nav Header Component End -->
			<!--Nav End-->
		</div>