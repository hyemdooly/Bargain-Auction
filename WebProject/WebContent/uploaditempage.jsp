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
        <script>
        function previewImage(event) {
        	var input = event.target;
            // 인풋 태그에 파일이 있는 경우
            if(input.files && input.files[0]) {
                // 이미지 파일인지 검사 (생략)
                // FileReader 인스턴스 생성
                const reader = new FileReader()
                // 이미지가 로드가 된 경우
                reader.onload = e => {
                    const previewImage = document.getElementById("preview_image")
                    previewImage.src = e.target.result
                }
                // reader가 이미지 읽도록 하기
                reader.readAsDataURL(input.files[0])
            }
        }
        </script>
        
    </head>
    <body>
        <!-- Navigation-->
        <%@ include file="./module/header.jsp" %>
       
        <!-- Product section-->
        <section class="py-3">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img id="preview_image" class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." /></div>
                    
                    <div class="col-md-6">
                    <form action="./uploaditempage-db.jsp" method="post" enctype="multipart/form-data">
                   		<input type="file" class="form-control mb-2" id="input_image" onchange="previewImage(event);" />
                   		<input type="text" class="form-control mb-2" placeholder="상품 이름" name="item_name" required/>
                   		
                   		<div class="input-group mb-2">
						  <input type="text" class="form-control" placeholder="시작가" name="start_price" required/>
                   		  <span class="input-group-text">원</span>
						</div>
                        <textarea class="form-control mb-2" rows="10" placeholder="상품 설명을 입력해주세요..." name="item_description" required></textarea>
                       	<div class="d-flex justify-content-end">
                       	<button class="btn btn-outline-primary" type="submit">올리기</button>
                       	</div>
                       	</form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
       <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Dongguk University &copy; WebProgramming 2021</p></div>
        </footer>
        <!-- <script>
        function readImage(input) {
            // 인풋 태그에 파일이 있는 경우
            if(input.files && input.files[0]) {
                // 이미지 파일인지 검사 (생략)
                // FileReader 인스턴스 생성
                const reader = new FileReader()
                // 이미지가 로드가 된 경우
                reader.onload = e => {
                    const previewImage = document.getElementById("preview_image")
                    previewImage.src = e.target.result
                }
                // reader가 이미지 읽도록 하기
                reader.readAsDataURL(input.files[0])
            }
        }
        
        const inputImage = document.getElementById("input_image")
        inputImage.addEventListener("change", e => {
            readImage(e.target)
        })
        </script> -->
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
    </body>
</html>