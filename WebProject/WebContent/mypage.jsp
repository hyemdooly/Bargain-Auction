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
    <body>
        <%@ include file="./module/header.jsp" %>
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
			<div class="container">
			  <div class="row row-cols-2">
			    <div class="col">
				    <h3>내 경매</h3>
				    <center> 
				    <table  class="table table-bordered ">
					  <thead>
					    <tr class="table-secondary">
					      <th scope="col">물품명</th>
					      <th scope="col">현재가</th>
					      <th scope="col">진행 상태</th>
					      <th scope="col">비고</th>
					    </tr>
					  </thead>
					  <tbody>
					  <!-- 여기는 정보를 가져와야함 -->
					    <tr>
					      <th scope="row">루이비통 가방</th>
					      <td>4,500,000</td>
					      <td>진행 완료</td>
					      <td><div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
			                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">송장번호 입력</a></div>
			               	</div></td>
					    </tr>
					    <tr>
					      <th scope="row">구찌 지갑</th>
					      <td>1,200,000</td>
					      <td>진행 완료</td>
					      <td>
					      	<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
			                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">송장번호 입력</a></div>
			               	</div></td>
					    </tr>
					  </tbody>
					</table>
					</center>
			    </div>
			    <div class="col">
			    	<h3>참여한 경매</h3>
				    <center> 
				    <table  class="table table-bordered ">
					  <thead>
					    <tr class="table-secondary">
					      <th scope="col">물품명</th>
					      <th scope="col">현재가</th>
					      <th scope="col">진행 상태</th>
					      <th scope="col">비고</th>
					    </tr>
					  </thead>
					  <tbody>
					  <!-- 여기는 정보를 가져와야함 -->
					    <tr>
					      <th scope="row">루이비통 가방</th>
					      <td>4,500,000</td>
					      <td>진행 완료</td>
					      <td>2020111980</td>
					    </tr>
					    <tr>
					      <th scope="row">구찌 지갑</th>
					      <td>1,200,000</td>
					      <td>진행 완료</td>
					      <td>2020111980</td>
					    </tr>
					  </tbody>
					</table>
					</center>
			    </div>
			    <div class="col"></div>
			    <div class="col"></div>
			  </div>
			</div>  
		<%
			}
		%>
        <%@ include file="./module/footer.html" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
	</body>
</html>