<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
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
	    <style>
	    		.input-form { 
	    		max-width: 680px; 
	    		margin-top: 30px; 
	    		padding: 32px; 
	    		background: #fff; 
	    		-webkit-border-radius: 10px;
	    	 	-moz-border-radius: 10px; 
	    	 	border-radius: 10px; 
	    	 	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
	    	 	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
	    	 	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15) } 
	    </style>
    </head>
    <body>
        <!-- Header -->
        <%@ include file="./module/header.jsp" %>
        <header class="bg-primary py-4" style="--bs-bg-opacity: .9;">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">바 겐 옥 션</h1>
                    <p class="lead fw-normal text-white-50 mb-0">BARGAIN AUCTION</p>
                </div>
            </div>
        </header>
        <section class="py-5">
        	<div class="container"> 
	        	<div class="input-form-backgroud row"> 
	        		<div class="input-form col-md-12 mx-auto"> 
	        			<h4 class="text-center mb-3">Bargain Auction 로그인</h4> 
	        			<form name="needs-validation" novalidate> 
	        				<div class="mb-3"> 
	        					<label class="form-label" for="id">아이디</label> 
	        					<input type="text" class="form-control" id="id" placeholder="ID" required> 
	        					<div class="invalid-feedback"> 아이디를 입력해주세요. </div>
	        				</div> 
	        				<div class="mb-4"> 
	        					<label class="form-label" for="password">비밀번호</label> 
	        					<input type="password" class="form-control" id="password" placeholder="PASSWORD" required> 
	        					<div class="invalid-feedback"> 패스워드를 입력해주세요. </div>
	        				</div> 
	        				<div class="d-flex gap-2 justify-content-end">
	        					<button class="btn btn-secondary btn-md btn-block" onclick="location.href='registerpage.jsp'">회원가입</button>
	        					<button class="btn btn-primary btn-md btn-block" type="submit">로그인</button> 
	        				</div>

						</form> 
					</div> 
				</div> 
			</div> 	
        </section>
        <script type="text/javascript"> 
        	window.addEventListener('load', () => {
        		const forms = document.getElementsByClassName('validation-form'); 
        		Array.prototype.filter.call(forms, (form) => { 
        			form.addEventListener('submit', function (event) { 
        				if (form.checkValidity() === false) {
        					event.preventDefault(); event.stopPropagation(); 
        				} 
        				form.classList.add('was-validated'); 
        			}, false); 
        		}); 
        	}, false); 
        </script>
        <%@ include file="./module/footer.html" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
	</body>
</html>