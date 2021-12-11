<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
    <% String keyword = request.getParameter("keyword");
    	String driver = "jdbc:mysql://localhost:3306/bargainAuction?serverTimezone=UTC";
		Connection con = null;
		Statement stmt = null;
		String sql = null;
		ResultSet rs = null;
		int count = 0;
	%>
		
<body>
		<!-- Header -->
        <%@ include file="./module/header.jsp"%>

        <section class="py-5">
                <h3 class="text-center">검색어 '<%= keyword %>'에 대한 결과</h3>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        	<%
    
		    	try {
		    		Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection(driver, "root", "0000");
					stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
					sql = "select * from item where name like '%"+keyword+"%'";
					rs = stmt.executeQuery(sql);
					rs.last();
					count = rs.getRow();
					rs.beforeFirst();
					if(count > 0) {
						ServletContext context = getServletContext();
					    String path = context.getRealPath("upload");
						while(rs.next()) {
						%> 
							<div class="col mb-5">
		                        <div class="card h-100">
		                        	 <%
				                        java.time.LocalDateTime end_date = java.time.LocalDateTime.parse(rs.getString("end_date"), java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
				                        java.time.LocalDateTime now_date = java.time.LocalDateTime.now();
				                        if(end_date.isBefore(now_date)){ %>
				                        	<div class="badge bg-primary text-white position-absolute" style="top: 0.5rem; right: 0.5rem">진행중</div>
				                        	<% 
				                        } else {%>
				                        	<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">종료</div>
				                        <%
				                        }
		                        	%>
		                        	<!-- Product image-->
		                            <img class="card-img-top" src="${pageContext.request.contextPath}/upload/<%=rs.getString("image")%>" alt="..." />
		                            <!-- Product details-->
		                            <div class="card-body p-4">
		                                <div class="text-center">
		                                    <!-- Product name-->
		                                    <h5 class="fw-bolder"><%=rs.getString("name") %></h5>
		                                    <!-- Product price-->
		                                    <span class="text-muted text-decoration-line-through">시작가 : <%=rs.getString("start_price") %>원</span><br>
		                                 	  현재가 : <%=rs.getString("current_price") %>원
		                                </div>
		                            </div>
		                            <!-- Product actions-->
		                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%= "itempage.jsp?id="+rs.getString("id")%>">상품 보러가기</a></div>
		                            </div>
		                        </div>
		                    </div>
						<%				
						}
					} else { %>
						<div class="container text-center pt-5">
				            <h4 class="pb-3">검색결과가 없습니다.</h4>
				       	</div>
					
					<%
						
					}
		    	} catch (ClassNotFoundException e) { 
					System.out.println("드라이버 로드 실패");
				} catch (SQLException e) {
			        System.out.println("DB 접속 실패");
			        e.printStackTrace();
			    }
		    %>
        			
                  </div>
             </div>
        </section>
        <%@ include file="./module/footer.html" %>

</body>
</html>