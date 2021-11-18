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
        <header class="bg-danger py-4" style="--bs-bg-opacity: .6;">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">바 겐 옥 션</h1>
                    <p class="lead fw-normal text-white-50 mb-0">BARGAIN AUCTION</p>
                </div>
            </div>
        </header>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">SKU: BST-498</div>
                        <h1 class="display-5 fw-bolder">루이비통 가방</h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through">$45.00</span>
                            <span>$40.00</span>
                        </div>
                        <p class="lead">제품에 대한 설명 제품에 대한 설명제품에 대한 설명제품에 대한 설명제품에 대한 설명제품에 대한 설명제품에 대한 설명제품에 대한 설명제품에 대한 설명제품에 대한 설명제품에 대한 설명제품에 대한 설명제품에 대한 설명제품에 대한 설명제품에 대한 설명</p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="price" type="num" placeholder="가격을 입력해주세요." style="max-width: 1000px" />
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                	 경매 신청하기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
       <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Dongguk University &copy; WebProgramming 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>