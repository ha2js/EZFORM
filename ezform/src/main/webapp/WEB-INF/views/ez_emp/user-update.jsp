<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="${pageContext.request.contextPath }/resources/js/ezform_js/emp_event.js"></script>

<div class="conatiner-fluid content-inner mt-n5 py-0">
  <div>
   <div class="row">
      <div class="col-sm-12">
         <div class="card">
            <div class="card-header d-flex justify-content-between">
               <div class="header-title">
                  <h4 class="card-title">사원수정</h4>
               </div>
            </div>
            <div class="card-body">
               <div class="table-responsive">
                  <table id="user-list-table" class="table table-striped" >
					 <tbody>                     
						<tr class="ligth" style="padding-left : 10px;">
						<form action="./update" method="post" onsubmit="return emp_join_avail();">          
						   <div class="col-sm-6">
                              <div id="imageEmp" style="width:120px; height:160px; border:1px solid #eee;">
                              	<img src="${pageContext.request.contextPath }/resources/upload/mem_Image/${empvo.em_image}" width='120' height='160' alt="profile-pic" onerror="this.src='${pageContext.request.contextPath }/resources/images/silhouette.png'">
                              </div>
                           </div>
						   <br>    
                           <div class="col-sm-6">
                              <div class="form-group">
                                 <label for="full-name" class="form-label">사원ID</label>
                                 <input type="text" name="em_id" class="form-control" id="emp_id" value="${empvo.getEm_id()}" readonly>
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <div class="form-group">
                                 <label for="full-name" class="form-label">패스워드</label>
                                 <input type="text" name="em_pw" class="form-control" id="emp_pw"  value="${empvo.getEm_pw()}" readonly>
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <div class="form-group">
                                 <label for="last-name" class="form-label">이름</label>
                                 <input type="text" name="em_name" class="form-control" id="emp_name"  value="${empvo.em_name }">
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <div class="form-group">
                                 <label for="email" class="form-label">Email</label>
                                 <input type="email" name="em_email" class="form-control" id="emp_email" value="${empvo.em_email }">
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <div class="form-group">
                                 <label for="phone" class="form-label">내선번호</label>
                                 <input type="text" name="em_extension" class="form-control" id="emp_exten" value="${empvo.em_extension }" maxlength="10" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <label class="form-label" for="cname">부서</label>
                              <select class="form-control" id="emp_dept" name="em_dept" >
                              	<option>-부서-</option>
                                 <option>개발팀</option>
                                 <option>기술지원팀</option>
                                 <option>경영지원팀</option>	
                              </select>
                           </div>
                           <div class="col-sm-6">
                              <label class="form-label">직급</label>
                              <select class="form-control" id="emp_posi" name="em_posi" >
                              	<option>-직급-</option>
                                 <option>인턴</option>
                                 <option>사원</option>
                                 <option>대리</option>
                                 <option>과장</option>
                                 <option>차장</option>
                                 <option>부장</option>
                                 <option>대표</option> 	
                              </select>
                           </div>
                           <hr>
                           <div class="col-sm-6">
                              <input type="submit" class="btn btn-primary" value="정보수정"/>
                              <input type="button" class="btn btn-primary" value="취소" onclick="location.href='list';">
                           </div>
						</form>                            
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
</div>

<%@ include file="../include/footer.jsp"%>