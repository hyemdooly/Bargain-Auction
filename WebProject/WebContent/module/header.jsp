<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta charset="utf-8" />
 	<head>
       <script type="text/javascript">
	 		const id = "${id}";
	 		console.log(id);
	 		window.onload = function() {
	 			if(id != "") {
	 				const left = document.getElementById('main_left');
	 				left.innerText = "로그아웃";
	 				left.href = "./logout.jsp";
	 					
	 				const right = document.getElementById("main_right");
	 				right.innerHTML = "<span style='color: #991b1b;'>"+id+"</span>&nbsp님 반가워요!";
	 				right.href = "";
	 			} else {
	 				const left = document.getElementById('main_left');
	 				left.innerText = "회원가입";
	 				left.href = "./registerpage.html";
	 					
	 				const right = document.getElementById("main_right");
	 				right.innerHTML = "로그인";
	 				right.href = "./loginpage.html";
	 			}
	 		}
		</script>
    </head>
    <body>

 		<nav class="navbar navbar-expand-lg navbar-light  flex-column">
			<div class="ms-auto container px-4 px-lg-5 justify-content-end text-secondary">

 				<a href="./registerpage.html" class="text-secondary" id="main_left" style="text-decoration: none">회원가입</a>
			    <span class="mr-2 ml-2">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			    <a href="./loginpage.html" class="text-secondary" id="main_right" style="text-decoration: none">로그인</a>
        	</div>
            <div class="container px-4 px-lg-5 flex-row justify-content-between">
                <a class="navbar-brand" href="mainpage.jsp"><img src="./images/mainlogo.png" alt="" width="140" height="50"></a>
                <form id="search" class="navbar-nav" action="./searchResultPage.jsp" method="get" >
                    <input type = "text" name = "keyword" placeholder="검색어를 입력하세요..." size=70  class="form-control">&nbsp&nbsp
                    <button type = "submit" class="btn btn-outline-dark"><i class="fas fa-search"></i></button>
                </form>

                <button class="btn btn-outline-dark" type="submit" onclick="location.href='mypage.jsp'">
                    <i class="bi-cart-fill me-1"></i>
                    <a style="color: black; hover:color:white">마이페이지</a>
                    <span class="badge bg-dark text-white ms-1 rounded-pill">my</span>
                </button>
            </div>
        </nav>
</html>