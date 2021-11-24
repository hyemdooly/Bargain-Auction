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
        <%@ include file="./module/header.jsp" %>
		<header class="bg-danger py-4" style="--bs-bg-opacity: .6;">
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
	        			<h4 class="mb-3">Bargain Auction 회원가입</h4> 
	        			<form class="validation-form" novalidate> 
	        				<div class="row"> 
	        					<div class="col-md-6 mb-3"> 
	        						<label for="id">아이디</label> 
	        						<input type="text" class="form-control" id="id" placeholder="" value="" required> 
	        						<div class="invalid-feedback"> 아이디를 입력해주세요. </div> 
	        					</div> 
	        					<div class="col-md-6 mb-3"> 
	        						<label for="name">닉네임</label> 
	        						<input type="text" class="form-control" id="name" placeholder="" value="" required> 
	        						<div class="invalid-feedback"> 이름을 입력해주세요. </div> 
	        					</div> 
	        				</div>
	        				<div class="mb-3"> 
	        					<label for="password">비밀번호</label> 
	        					<input type="password" class="form-control" id="password" placeholder="password" required> 
	        					<div class="invalid-feedback"> 비밀번호를 입력해주세요. </div> 
	        				</div> 
	        				<div class="mb-3"> 
	        					<label for="email">이메일</label> 
	        					<input type="email" class="form-control" id="email" placeholder="you@example.com" required> 
	        					<div class="invalid-feedback"> 이메일을 입력해주세요. </div> 
	        				</div> 
	        				<div class="mb-3"> 
	        					<label for="address">주소</label> 
	        					<input type="text" class="form-control" id="address" placeholder="서울특별시 중구" required> 
	        					<div class="invalid-feedback"> 주소를 입력해주세요. </div> 
	        				</div> 
	        				<div class="mb-3"> 
	        					<label for="address2">상세주소</label> 
	        					<input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요." required> 
	        				</div>
							<hr class="mb-4"> 
							<div class="custom-control custom-checkbox"> 
								<input type="checkbox" class="custom-control-input" id="aggrement" required> 
								<label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label> 
							</div> 
							<div class="mb-4"></div> 
							<button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
							<button class="btn btn-primary btn-lg btn-block" onclick="location.href='loginpage.html'">로그인</button>  
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