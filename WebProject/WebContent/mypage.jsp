<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 	<head>
	 	<%
			String id = null;		//아이디 저장 변수
			id = (String)session.getAttribute("id");
		%>
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
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="mainpage.jsp"><img src="./images/mainlogo.jpg" alt="" width="140" height="50"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav nav-tabs">
  						<li class="nav-item">
   							 <a class="nav-link active" aria-current="page" href="mainpage.jsp">Home</a>
  						</li>
  						<li class="nav-item">
    						 <a class="nav-link" style="color: black" href="loginpage.html">로그인</a>
  						</li>
  						<li class="nav-item">
					    	<a class="nav-link" style="color: black" href="registerpage.html">회원가입</a>
					 	</li>
					</ul>
                    <form id="search" class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-6">
                    	<input type = "text" name = "search" value = "" size=70  style ="border: solid 1px ; border-radius: 8px;"/>&nbsp&nbsp
                    	<button type = "submit" class="btn btn-outline-dark"><i class="fas fa-search"></i></button>
                    </form>

                    <button class="btn btn-outline-dark" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                           <a style="color: gray" href="mypage.jsp">마이페이지</a>
                        <span class="badge bg-dark text-white ms-1 rounded-pill">my</span>
                    </button>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-danger py-4" style="--bs-bg-opacity: .6;">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">바 겐 옥 션</h1>
                    <p class="lead fw-normal text-white-50 mb-0">BARGAIN AUCTION</p>
                </div>
            </div>
        </header>
        <%
			//세션이 없는 경우
			if(id == null){
		%>
				<center><h1>로그인 후 이용 가능합니다.</h1><br>
				<button class="btn btn-primary btn-lg btn-block" onclick="location.href='loginpage.html'">로그인</button></center>
		<%
			}else{
		%>
			<h1><center>${id}님의 마이페이지입니다.</center></h1>
		<%
			}
		%>
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Dongguk University &copy; WebProgramming 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
	</body>
</html>