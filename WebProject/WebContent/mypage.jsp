<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 	<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>바겐옥션</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>   
    </head>
    <%
	String driver = "jdbc:mysql://localhost:3306/bargainAuction?serverTimezone=UTC";
	Connection con = null;
	Statement stmt = null;
	String sql = null;
	ResultSet rs = null;
	int currentPoint = 0;
	String address = null;
	String addressDetail = null;
	String password = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(driver, "root", "0000");
		stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		sql = "select * from member where mid="+session.getAttribute("mid");
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			currentPoint = rs.getInt("point");
			address = rs.getString("address");
			addressDetail = rs.getString("address_detail");
			password = rs.getString("password");
		}
		
	} catch(ClassNotFoundException e) {
		System.out.println("드라이버 로드 실패");
	} catch(SQLException e) {
        System.out.println("DB 접속 실패");
        e.printStackTrace();
	}
    
    %>
    <body>
        <%@ include file="./module/header.jsp"%>
        <!-- Header-->
        <header class="bg-primary py-4" style="--bs-bg-opacity: .9;">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">바 겐 옥 션</h1>
                    <p class="lead fw-normal text-white-50 mb-0">BARGAIN AUCTION</p>
                </div>
            </div>
        </header>
        <%
			//세션이 없는 경우
			if((String)session.getAttribute("id") == null){
		%>
				<script>
				alert("로그인 후 이용해주세요.");
				location.href = "loginpage.html";
				</script>
		<%
			//response.sendRedirect("loginpage.jsp");
			}else{
		%>
			<div class="container mt-5 mb-5">
			  <div class="row row-cols-2">
			    <div class="col">
				    <h3>내 경매</h3>
				    <center> 
				    <table class="table table-bordered ">
					  <thead>
					    <tr class="table-primary">
					      <th scope="col">물품명</th>
					      <th scope="col">현재가</th>
					      <th scope="col">진행 상태</th>
					      <th scope="col">송장번호</th>
					    </tr>
					  </thead>
					  <tbody>
					  <!-- 여기는 정보를 가져와야함 -->
					  <%
					  	try {
							sql = "select * from item where upload_mem_id="+session.getAttribute("mid");
							rs = stmt.executeQuery(sql);
							while(rs.next()) {
								%>
								<tr>
							      <th scope="row"><%= rs.getString("name") %></th>
							      <td><%= rs.getInt("current_price") %></td>
							      <% if(rs.getInt("status_end") == 0) { %>
							      		<td>진행 중</td>
									    <td>
									    <div class="card-footer border-top-0 bg-transparent p-auto">
							              <div class="text-center">
							                <input type="text" class="form-control mb-1" placeholder="택배사를 입력해주세요." disabled>
							                <input type="text" class="form-control mb-1" placeholder="송장번호를 입력해주세요." disabled>
							                <button class="btn btn-outline-dark mt-auto" disabled="disabled">송장번호 저장</button>
							              </div>
							            </div>
							          </td>
							      <% } else  { %>
							      		<td>진행 완료</td>
									    <td>
									    	<div class="card-footer border-top-0 bg-transparent p-auto">
								              <div class="text-center">
								              <form action="mypage-updatetracking.jsp" mtehod="get">
								            	<input type="hidden" name="item_id" value="<%= rs.getString("id") %>" >
								              	<input type="text" class="form-control mb-1" placeholder="택배사를 입력해주세요." name="tracking_company" value="<%= rs.getString("tracking_company") %>">
								                <input type="text" class="form-control mb-1" placeholder="송장번호를 입력해주세요." name="tracking_number" value="<%= rs.getString("tracking_number") %>">
								                <button class="btn btn-outline-dark mt-auto">송장번호 저장</button>
								              </form>
								              </div>
							            	</div>
							          	</td>
							      <%}%>
							    </tr>
								
								<%
							}
							
						} catch(SQLException e) {
					        System.out.println("DB 접속 실패");
					        e.printStackTrace();
						} %>
					    </tbody>
					</table>
					</center>
			    </div>
			    <div class="col">
			    	<h3>낙찰된 경매</h3>
				    <center> 
				    <table  class="table table-bordered ">
					  <thead>
					    <tr class="table-primary">
					      <th scope="col">물품명</th>
					      <th scope="col">현재가</th>
					      <th scope="col">진행 상태</th>
					      <th scope="col">송장번호</th>
					    </tr>
					  </thead>
					  <tbody>
					  <%
					    try {
							sql = "select * from item where bid_mem_id="+session.getAttribute("mid");
							rs = stmt.executeQuery(sql);
							while(rs.next()) {
								%>
								<tr>
							      <th scope="row"><%= rs.getString("name") %></th>
							      <td><%= rs.getInt("current_price") %></td>
							      <% if(rs.getInt("status_end") == 0) { %>
							      		<td>진행 중
							      		</td>
									    <td></td>
							      <% } else  { %>
							      		<td>진행 완료
							      		</td>
									    <td><%=rs.getString("tracking_company") %> / <%= rs.getString("tracking_number") %></td>
							      <%}%>
							    </tr>
								
								<%
							}
							
						} catch(SQLException e) {
					        System.out.println("DB 접속 실패");
					        e.printStackTrace();
						} %>
					  </tbody>
					</table>
					</center>
			    </div>
			    <div class="col">
			    	<h3>포인트 충전</h3>
				    <center>
					    <div class="row row-cols-2 py-3 border border-2 rounded w-100">
						    <div class="text-center m-auto">
						    	<h4>현재 포인트</h4>
						    	<h3><%= currentPoint %></h3>
						    </div>
						    <div class="text-center">
	
							    <form action="mypage-updatepoint.jsp" mtehod="get">
							    	<input type="hidden" name="current_point" value="<%= currentPoint %>" >
							    	<input type="text" class="form-control" placeholder="충전할 포인트" name="charge_point">
							    	<button class="btn btn-primary mt-2">포인트 충전</button>
							    </form>
							    	
						    </div>
					    </div>
				    </center>
			    </div>
			    
			    <div class="col">
			    	<h3>정보 수정</h3>
				    <center>
					    <div class="row row-cols-2 py-3 border border-2 rounded w-100">
						    <div class="text-center m-auto">
						    	<input type="text" class="form-control" placeholder="주소" value="<%= address %>" name="address" id="address"/>
						    	<input type="text" class="form-control mt-2" placeholder="상세 주소" value="<%= addressDetail %>" name="address_detail" id="address_detail"/>
						    	<button class="btn btn-primary mt-2">주소 변경</button>
						    </div>
						    <div class="text-center">
						    	<input type="password" class="form-control" placeholder="새 비밀번호" name="new_password" id="new_password"/>
						    	<input type="password" class="form-control mt-2" placeholder="비밀번호 확인" name="new_password_confirm" id="new_password_confirm"/>
						    	<button class="btn btn-primary mt-2" onclick="editPassword();">비밀번호 변경</button>
						    </div>
					    </div>
				    </center>
			    </div>
			  </div>
			</div>  
		<%
			}
		%>
        <%@ include file="./module/footer.html" %>
	<script type="text/javascript">
		function editPassword() {
			var new_password = document.getElementById("new_password").value;
			var new_password_confirm = document.getElementById("new_password_confirm").value;
			if(new_password == "" || new_password_confirm == "") {
				alert("비밀번호 입력 칸을 모두 채워주세요!");
				
			} else if(new_password === new_password_confirm) {
				location.href = "mypage-updatepassword.jsp?new_password="+new_password;
			} else {
			
				alert("새 비밀번호와 확인이 일치하는지 확인해주세요!");
			}
			
			
		}
	</script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
	</body>
</html>