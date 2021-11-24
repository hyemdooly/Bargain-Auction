<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="mainpage.jsp"><img src="./images/mainlogo.png" alt="" width="140" height="50"></a>
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
        </nav> -->

 		<nav class="navbar navbar-expand-lg navbar-light bg-light flex-column">
			<div class="ms-auto container px-4 px-lg-5 justify-content-end text-secondary">
	       		<a href="./registerpage.jsp" class="text-secondary" style="text-decoration: none">회원가입</a>
	        	<span className="mr-2 ml-2">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	        	<a href="./loginpage.jsp" class="text-secondary" style="text-decoration: none">로그인</a>
        	</div>
            <div class="container px-4 px-lg-5 flex-row justify-content-between">
            
                <a class="navbar-brand" href="mainpage.jsp"><img src="./images/mainlogo.png" alt="" width="140" height="50"></a>
                <form id="search" class="navbar-nav">
                    <input type = "text" name = "search" value = "" placeholder="검색어를 입력하세요..." size=70  class="form-control"/>&nbsp&nbsp
                    <button type = "submit" class="btn btn-outline-dark"><i class="fas fa-search"></i></button>
                </form>

                <button class="btn btn-outline-dark" type="submit" onclick="location.href='mypage.jsp'">
                    <i class="bi-cart-fill me-1"></i>
                    <a style="color: black; hover:color:white">마이페이지</a>
                    <span class="badge bg-dark text-white ms-1 rounded-pill">my</span>
                </button>
            </div>
        </nav>    
        
        

</body>
</html>