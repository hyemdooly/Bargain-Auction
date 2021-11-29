<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	 	<%
	 		// session.setAttribute("id", "asdf");
	 		// session.removeAttribute("id");
			String id = null;		//아이디 저장 변수
			id = (String)session.getAttribute("id");
			
		%>
</head>
<body>

 		<nav class="navbar navbar-expand-lg navbar-light bg-light flex-column">
			<div class="ms-auto container px-4 px-lg-5 justify-content-end text-secondary">
			
			<% if(id == null) { %>
	       		<a href="./registerpage.html" class="text-secondary" style="text-decoration: none">회원가입</a>
	        	<span class="mr-2 ml-2">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	        	<a href="./loginpage.html" class="text-secondary" style="text-decoration: none">로그인</a>
	        	<% } else { // 세션이 있는 경우, 로그인이 되어있는 경우 %>
	        	<a href="./logout.jsp" class="text-secondary" style="text-decoration: none">로그아웃</a>
	        	<span class="mr-2 ml-2">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	        	<a class="text-secondary" style="text-decoration: none"><span style="color: #991b1b;"><%= id %></span>&nbsp님 반가워요!</a>
	        	<% } %>
        	</div>
            <div class="container px-4 px-lg-5 flex-row justify-content-between">
                <a class="navbar-brand" href="mainpage.jsp"><img src="./images/mainlogo.png" alt="" width="140" height="50"></a>
                <form id="search" class="navbar-nav" action="./searchResultPage.jsp" method="get" >
                    <input type = "text" name = "keyword" value = "" placeholder="검색어를 입력하세요..." size=70  class="form-control"/>&nbsp&nbsp
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