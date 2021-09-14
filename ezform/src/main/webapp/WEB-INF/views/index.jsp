<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		
    
		<%@ include file="include/header.jsp" %>
		
		<div class="conatiner-fluid content-inner mt-n5 py-0">
			<div class="row">
   				<div class="col-md-12 col-lg-8">
      				<div class="row">
      	 			<!--------------------------------- 캘린더 영역 ------------------------------>
				         <div class="col-md-12">
				            <div class="row">
				                <div class="col-lg-12">
				                    <div class="row">
				                        <div class="col-lg-12">
				                            <div class="card  ">
				                                <div class="card-body">
				                                    <div id="calendar1" class="calendar-s" style="height:200px;"></div>
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
			         
			                     <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
			                        <li><a class="dropdown-item" href="#">This Week</a></li>
			                        <li><a class="dropdown-item" href="#">This Month</a></li>
			                        <li><a class="dropdown-item" href="#">This Year</a></li>
			                     </ul>
			                  </div>
			               </div>
			               <div class="card-body">
			               		<div class="table-responsive">
			                 		<table id="datatable" class="table table-striped" data-toggle="data-table">
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
			                 		<table id="datatable" class="table table-striped" data-toggle="data-table">
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
   			  <div class="col-md-12 col-lg-4">
      <div class="row">
         <div class="col-md-12 col-lg-12">
            <div class="card credit-card-widget">
               <div class="card-header pb-4 border-0">
                  <div class="p-4 primary-gradient-card rounded border border-white">
                     <div class="d-flex justify-content-between align-items-center">
                        <div>
                           <h5 class="font-weight-bold">VISA </h5>
                           <P class="mb-0">PREMIUM ACCOUNT</P>  
                        </div>
                        <div class="master-card-content">
                           <svg class="master-card-1" width="60" height="60" viewBox="0 0 24 24">
                              <path fill="#ffffff" d="M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                           </svg>
                           <svg class="master-card-2" width="60" height="60" viewBox="0 0 24 24">
                              <path fill="#ffffff" d="M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                           </svg>
                        </div>
                     </div>
                     <div class="my-4">
                        <div class="card-number">
                           <span class="fs-5 me-2">5789</span>
                           <span class="fs-5 me-2">****</span>
                           <span class="fs-5 me-2">****</span>
                           <span class="fs-5">2847</span>
                        </div>
                     </div>
                     <div class="d-flex align-items-center mb-2 justify-content-between">
                        <p class="mb-0">Card holder</p>
                        <p class="mb-0">Expire Date</p>
                     </div>
                     <div class="d-flex align-items-center justify-content-between">
                        <h6>Mike Smith</h6>
                        <h6 class="ms-5">06/11</h6>
                     </div>
                  </div>
               </div>
               <div class="card-body">
                  <div class="d-flex align-itmes-center flex-wrap  mb-4">
                     <div class="d-flex align-itmes-center me-0 me-md-4">
                        <div>
                           <div class="p-3 mb-2 rounded bg-soft-primary">
                              <svg width="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                              <path fill-rule="evenodd" clip-rule="evenodd" d="M16.9303 7C16.9621 6.92913 16.977 6.85189 16.9739 6.77432H17C16.8882 4.10591 14.6849 2 12.0049 2C9.325 2 7.12172 4.10591 7.00989 6.77432C6.9967 6.84898 6.9967 6.92535 7.00989 7H6.93171C5.65022 7 4.28034 7.84597 3.88264 10.1201L3.1049 16.3147C2.46858 20.8629 4.81062 22 7.86853 22H16.1585C19.2075 22 21.4789 20.3535 20.9133 16.3147L20.1444 10.1201C19.676 7.90964 18.3503 7 17.0865 7H16.9303ZM15.4932 7C15.4654 6.92794 15.4506 6.85153 15.4497 6.77432C15.4497 4.85682 13.8899 3.30238 11.9657 3.30238C10.0416 3.30238 8.48184 4.85682 8.48184 6.77432C8.49502 6.84898 8.49502 6.92535 8.48184 7H15.4932ZM9.097 12.1486C8.60889 12.1486 8.21321 11.7413 8.21321 11.2389C8.21321 10.7366 8.60889 10.3293 9.097 10.3293C9.5851 10.3293 9.98079 10.7366 9.98079 11.2389C9.98079 11.7413 9.5851 12.1486 9.097 12.1486ZM14.002 11.2389C14.002 11.7413 14.3977 12.1486 14.8858 12.1486C15.3739 12.1486 15.7696 11.7413 15.7696 11.2389C15.7696 10.7366 15.3739 10.3293 14.8858 10.3293C14.3977 10.3293 14.002 10.7366 14.002 11.2389Z" fill="currentColor"></path>                                            
                              </svg>
                           </div>
                        </div>
                        <div class="ms-3">
                           <h5>1153</h5>
                           <small class="mb-0">Products</small>
                        </div>
                     </div>
                     <div class="d-flex align-itmes-center">
                        <div>
                           <div class="p-3 mb-2 rounded bg-soft-info">
                              <svg width="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                 <path fill-rule="evenodd" clip-rule="evenodd" d="M14.1213 11.2331H16.8891C17.3088 11.2331 17.6386 10.8861 17.6386 10.4677C17.6386 10.0391 17.3088 9.70236 16.8891 9.70236H14.1213C13.7016 9.70236 13.3719 10.0391 13.3719 10.4677C13.3719 10.8861 13.7016 11.2331 14.1213 11.2331ZM20.1766 5.92749C20.7861 5.92749 21.1858 6.1418 21.5855 6.61123C21.9852 7.08067 22.0551 7.7542 21.9652 8.36549L21.0159 15.06C20.8361 16.3469 19.7569 17.2949 18.4879 17.2949H7.58639C6.25742 17.2949 5.15828 16.255 5.04837 14.908L4.12908 3.7834L2.62026 3.51807C2.22057 3.44664 1.94079 3.04864 2.01073 2.64043C2.08068 2.22305 2.47038 1.94649 2.88006 2.00874L5.2632 2.3751C5.60293 2.43735 5.85274 2.72207 5.88272 3.06905L6.07257 5.35499C6.10254 5.68257 6.36234 5.92749 6.68209 5.92749H20.1766ZM7.42631 18.9079C6.58697 18.9079 5.9075 19.6018 5.9075 20.459C5.9075 21.3061 6.58697 22 7.42631 22C8.25567 22 8.93514 21.3061 8.93514 20.459C8.93514 19.6018 8.25567 18.9079 7.42631 18.9079ZM18.6676 18.9079C17.8282 18.9079 17.1487 19.6018 17.1487 20.459C17.1487 21.3061 17.8282 22 18.6676 22C19.4969 22 20.1764 21.3061 20.1764 20.459C20.1764 19.6018 19.4969 18.9079 18.6676 18.9079Z" fill="currentColor"></path>                                            
                              </svg>                                        
                           </div>
                        </div>
                        <div class="ms-3">
                           <h5>81K</h5>
                           <small class="mb-0">Order Served</small>
                        </div>
                     </div>
                  </div>
                  <div class="mb-4">
                     <div class="d-flex justify-content-between flex-wrap">
                        <h2 class="mb-2">$405,012,300</h2>
                        <div>
                           <span class="badge bg-success rounded-pill">YoY 24%</span>
                        </div>
                     </div>
                     <p class="text-info">Life time sales</p>
                  </div>
                  <div class="d-grid grid-cols-2 gap">
                     <button class="btn btn-primary text-uppercase">SUMMARY</button>
                     <button class="btn btn-info text-uppercase">ANALYTICS</button>
                  </div>
               </div>
            </div>
            <div class="card">
               <div class="card-body d-flex justify-content-around text-center">
                  <div>
                     <h2 class="mb-2">750<small>K</small></h2>
                     <p class="mb-0 text-secondary">Website Visitors</p>
                  </div>
                  <hr class="hr-vertial">
                  <div>
                     <h2 class="mb-2">7,500</h2>
                     <p class="mb-0 text-secondary">New Customers</p>
                  </div>
               </div>
            </div> 
         </div>
         <div class="col-md-12 col-lg-12">
            <div class="card">
               <div class="card-header d-flex justify-content-between flex-wrap">
                  <div class="header-title">
                     <h4 class="card-title mb-2">Activity overview</h4>
                     <p class="mb-0">
                        <svg class ="me-2" width="24" height="24" viewBox="0 0 24 24">
                           <path fill="#17904b" d="M13,20H11V8L5.5,13.5L4.08,12.08L12,4.16L19.92,12.08L18.5,13.5L13,8V20Z" />
                        </svg>
                        16% this month
                     </p>
                  </div>
               </div>
               <div class="card-body">
                  <div class=" d-flex profile-media align-items-top mb-2">
                     <div class="profile-dots-pills border-primary mt-1"></div>
                     <div class="ms-4">
                        <h6 class=" mb-1">$2400, Purchase</h6>
                        <span class="mb-0">11 JUL 8:10 PM</span>
                     </div>
                  </div>
                  <div class=" d-flex profile-media align-items-top mb-2">
                     <div class="profile-dots-pills border-primary mt-1"></div>
                     <div class="ms-4">
                        <h6 class=" mb-1">New order #8744152</h6>
                        <span class="mb-0">11 JUL 11 PM</span>
                     </div>
                  </div>
                  <div class=" d-flex profile-media align-items-top mb-2">
                     <div class="profile-dots-pills border-primary mt-1"></div>
                     <div class="ms-4">
                        <h6 class=" mb-1">Affiliate Payout</h6>
                        <span class="mb-0">11 JUL 7:64 PM</span>
                     </div>
                  </div>
                  <div class=" d-flex profile-media align-items-top mb-2">
                     <div class="profile-dots-pills border-primary mt-1"></div>
                     <div class="ms-4">
                        <h6 class=" mb-1">New user added</h6>
                        <span class="mb-0">11 JUL 1:21 AM</span>
                     </div>
                  </div>
                  <div class=" d-flex profile-media align-items-top mb-1">
                     <div class="profile-dots-pills border-primary mt-1"></div>
                     <div class="ms-4">
                        <h6 class=" mb-1">Product added</h6>
                        <span class="mb-0">11 JUL 4:50 AM</span>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   	</div> 
   </div> 
   </div>

	<%@ include file="include/footer.jsp" %>