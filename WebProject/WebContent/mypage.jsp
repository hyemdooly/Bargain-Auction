<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 	<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>바겐옥션</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
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
    						 <a class="nav-link" style="color: black" href="loginpage.jsp">로그인</a>
  						</li>
  						<li class="nav-item">
					    	<a class="nav-link" style="color: black" href="registerpage.jsp">회원가입</a>
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
	</body>
</html>