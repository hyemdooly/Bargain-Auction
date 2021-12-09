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
    <% String keyword = request.getParameter("keyword"); %>
<body>
		<!-- Header -->
        <%@ include file="./module/header.jsp"%>

        <section class="py-5 bg-light">
                <h3 class="text-center">검색어 '<%= keyword %>'에 대한 결과</h3>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        	<% for(int i = 0 ; i < 10 ; i++) { %>
        			<div class="col mb-5">
                        <div class="card h-100">
                        	<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">종료</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">루이비통 가방</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">시작가 : $25.00</span><br>
                                 	  현재가 : $45.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 보러가기</a></div>
                            </div>
                        </div>
                    </div>

                  <% } %>
                  </div>
             </div>
        </section>

</body>
</html>