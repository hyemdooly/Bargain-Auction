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
    	<%
	    	String driver = "jdbc:mysql://localhost:3306/bargainAuction?serverTimezone=UTC";
			Connection con = null;
			Statement stmt = null;
			String sql = null;
			ResultSet rs = null;
			int count = 0;
		%>
    </head>
    <body>
        <!-- Header -->
        <%@ include file="./module/header.jsp"%>

        <header class="bg-primary py-4" style="--bs-bg-opacity: .9;">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">바 겐 옥 션</h1>
                    <p class="lead fw-normal text-white-50 mb-0">BARGAIN AUCTION</p>
                </div>
            </div>
        </header>
        
        <div class="container text-center pt-5">
            <h4 class="pb-3">값어치 있는 물건을 경매에 올려보세요!</h4>
       		<input type="button" class="btn btn-outline-primary" value="경매 올리기" onclick="location='uploaditempage.jsp'"/> <!-- 경매 올리는 페이지 생성 후 고칠  -->
        </div>

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-3">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <%
    
		    	try {
		    		Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection(driver, "root", "0000");
					stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
					sql = "select * from item";
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
		                        <div class="card h-100"> <%
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
				            <h4 class="pb-3">올라온 경매 물품이 없습니다. 경매를 시작해보세요!</h4>
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
                
                
                
                
<!--                 
                
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">종료</div>
                            Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            Product details
                            <div class="card-body p-4">
                                <div class="text-center">
                                    Product name
                                    <h5 class="fw-bolder">루이비통 가방</h5>
                                    Product price
                                   	 시작가 : $40.00 <br> 판매가 : $80.00
                                </div>
                            </div>
                            Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 보러가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            Sale badge
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">진행중</div>
                            Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            Product details
                            <div class="card-body p-4">
                                <div class="text-center">
                                    Product name
                                    <h5 class="fw-bolder">루이비통 가방</h5>
                                    Product reviews
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    Product price
                                    <span class="text-muted text-decoration-line-through">시작가 : $20.00</span><br>
                                    	현재가 : $28.00
                                </div>
                            </div>
                            Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 보러가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            Sale badge
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">진행중</div>
                            Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            Product details
                            <div class="card-body p-4">
                                <div class="text-center">
                                    Product name
                                    <h5 class="fw-bolder">루이비통 가방</h5>
                                    Product price
                                    <span class="text-muted text-decoration-line-through">시작가 : $25.00</span><br>
                                   	현재가 : $25.00
                                </div>
                            </div>
                            Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 보러가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">종료</div>
                            Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            Product details
                            <div class="card-body p-4">
                                <div class="text-center">
                                    Product name
                                    <h5 class="fw-bolder">루이비통 가방</h5>
                                    Product reviews
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    Product price
                                    	시작가 : $20.00  <br> 판매가 : $40.00
                                </div>
                            </div>
                            Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 보러가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            Sale badge
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">진행중</div>
                            Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            Product details
                            <div class="card-body p-4">
                                <div class="text-center">
                                    Product name
                                    <h5 class="fw-bolder">루이비통 가방</h5>
                                    Product price
                                    <span class="text-muted text-decoration-line-through">시작가 : $25.00</span><br>
                                 	  현재가 : $45.00
                                </div>
                            </div>
                            Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 보러가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                       		<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">종료</div>
                            Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            Product details
                            <div class="card-body p-4">
                                <div class="text-center">
                                    Product name
                                    <h5 class="fw-bolder">루이비통 가방</h5>
                                    Product price
                                   	 시작가 : $120.00 <br> 판매가 : $280.00
                                </div>
                            </div>
                            Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 보러가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            Sale badge
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">진행중</div>
                            Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            Product details
                            <div class="card-body p-4">
                                <div class="text-center">
                                    Product name
                                    <h5 class="fw-bolder">루이비통 가방</h5>
                                    Product reviews
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    Product price
                                    <span class="text-muted text-decoration-line-through">시작가 : $10.00</span><br>
                                   	현재가 : $18.00
                                </div>
                            </div>
                            Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 보러가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">종료</div>
                            Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            Product details
                            <div class="card-body p-4">
                                <div class="text-center">
                                    Product name
                                    <h5 class="fw-bolder">루이비통 가방</h5>
                                    Product reviews
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    Product price
                                    	판매가 : $40.00
                                </div>
                            </div>
                            Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 보러가기</a></div>
                            </div>
                        </div>
                    </div> -->
                </div>
            </div>
        </section>
        <!-- Footer-->
        <%@ include file="./module/footer.html" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
