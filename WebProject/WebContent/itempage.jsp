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
    <body>
        <!-- Navigation-->
        <%@ include file="./module/header.jsp" %>
       <section class="py-5">
       <%
   		String driver = "jdbc:mysql://localhost:3306/bargainAuction?serverTimezone=UTC";
		Connection con = null;
		Statement stmt = null;
		String sql = null;
		ResultSet rs = null;
		int currentPrice = 0;
		int id = Integer.parseInt(request.getParameter("id"));
		int upload_mem_id = 0;
		int current_point = 0;
		
		try {
			sql = "select * from item where id="+request.getParameter("id");
			con = DriverManager.getConnection(driver, "root", "0000");
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				upload_mem_id = Integer.parseInt(rs.getString("upload_mem_id"));
				%>
        <!-- Product section-->
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${pageContext.request.contextPath}/upload/<%=rs.getString("image")%>" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">ID : <%= rs.getString("id") %></div>
                        <h1 class="display-5 fw-bolder"><%= rs.getString("name") %></h1>
                        <div class="fs-5 mb-5">
                            <span class="text-muted text-decoration-line-through"><%= rs.getString("start_price") %>원</span>
                            <span><%= rs.getString("current_price") %>원</span>
                        </div>
                        <p class="lead"><%= rs.getString("description") %></p>
                        <div class="d-flex">
                          <%
                          		   currentPrice = rs.getInt("current_price");
				                   if(rs.getInt("status_end") == 0){ %>
				                        <div class="input-group me-3">
									  		<input type="text" class="form-control text-center" style="max-width: 1000px" id="price" placeholder="제안할 가격을 입력해주세요..." name="start_price"/>
			                   		  		<span class="input-group-text">원</span>
										</div>
			                            <button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="submit()">
			                                	 경매 신청하기
			                            </button>
				                        <% 
				                   } else {%>
				                        <div class="input-group me-3">
									  		<input type="text" class="form-control text-center" style="max-width: 1000px" id="price" placeholder="경매가 종료된 물품입니다." name="start_price" disabled/>
			                   		  		<span class="input-group-text">원</span>
										</div>
			                            <button class="btn btn-outline-dark flex-shrink-0" type="button" disabled=”disabled”>
			                                	경매 신청하기
			                            </button>
				                   <%
				                   }
		                        %>
                        </div>
                    </div>
                </div>
            </div>
            <% }
			
			sql = "select * from member where mid="+session.getAttribute("mid");
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				current_point = rs.getInt("expected_point");
			}
			
		} catch(Exception e) {%>
			<script>
				alert("에러가 발생했습니다. 잠시 후 시도해주세요.");
				history.back();
			</script>
		<%
		}
            
            %>
        </section>
        <!-- Footer-->
       <%@ include file="./module/footer.html" %>
        <script type="text/javascript">
			function submit() {
				var price = document.getElementById("price").value;
				var session_id = "${mid}";
				var upload_mem_id = <%= upload_mem_id %>;
				console.log(session_id);
				console.log(upload_mem_id);
				var current_price = <%= currentPrice %>;
				if(session_id == null || session_id == "") {
					alert("로그인 후 이용해주세요.")
					location.href = "loginpage.html";
				} else if(session_id == upload_mem_id) {
					alert("경매를 올린 사람은 경매에 참여할 수 없습니다.");
				} else {
					if(current_price >= price) {
						alert("현재가보다 높은 가격을 입력해주세요.");
					} else if(price > <%= current_point %>){
						alert("입력한 금액이 현재 지니고 있는 금액보다 큽니다.")
					} else {
						alert("경매 신청을 완료했습니다!");
						location.href = "itempage-result.jsp?item_id="+<%=id%>+"&price="+price;
					}
				}
			}
			
		
		</script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>