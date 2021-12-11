<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"  %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
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
        <%@ include file="./module/header.jsp" %>
       
        <!-- Product section-->
        <section class="py-3">
            <div class="container px-4 px-lg-5 my-5">
				<%
					String driver = "jdbc:mysql://localhost:3306/bargainAuction?serverTimezone=UTC";
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					ResultSet rs = null;
				
				    String mid = null;
				    String id = null;
				    if(session.getAttribute("mid") == null || session.getAttribute("id") == null) { %>
						<script>
							alert("로그인 후 이용해주세요.");
							location.href = "loginpage.html";
						</script>
				<%
				    } else {
				    	mid = session.getAttribute("mid").toString();
				    	id = session.getAttribute("id").toString();
				    }
				    	
					String uploadPath = request.getServletContext().getRealPath("upload");
					
					int size = 10*1024*1024; // 10MB
					int upload_mem_id = Integer.parseInt(mid);
					String name = null;
					int start_price = 0;
					int current_price = 0;
					String description = null;
					String image = null;
					java.util.Date date = new java.util.Date();
					Timestamp upload_date = new Timestamp(date.getTime());
					Timestamp end_date = new Timestamp(date.getTime());
					
					Calendar cal = Calendar.getInstance();
					cal.setTime(end_date);
					cal.add(Calendar.DATE, 7);
					end_date.setTime(cal.getTime().getTime());
					
					try {
						MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
						image = multi.getFilesystemName("input_image");			
						name = multi.getParameter("item_name");
						start_price = Integer.parseInt(multi.getParameter("start_price"));
						current_price = start_price;
						description = multi.getParameter("item_description");
						
						// 파일 이름 변경
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
						String newImageName = (dateFormat.format(upload_date))+"-by-"+mid+image.substring(image.lastIndexOf("."));
						
						File upfile1 = new File(uploadPath+"/"+image);
						File upfile2 = new File(uploadPath+"/"+newImageName);
						if(!upfile1.renameTo(upfile2)) {
							throw new Exception("파일 이름 변경에 문제가 발생했습니다.");
						}
						
						//데이터베이스 접속
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection(driver, "root", "0000");
						sql = "insert into item(upload_mem_id, bid_mem_id, name, start_price, current_price, tracking_number, image, tracking_company, end_date, upload_date, description, status_end)"
								+ "values (?, null, ?, ?, ?, null, ?, null, ?, ?, ?, 0)";
						pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
						pstmt.setInt(1, Integer.parseInt(mid));
						pstmt.setString(2, name);
						pstmt.setInt(3, start_price);
						pstmt.setInt(4, current_price);
						pstmt.setString(5, newImageName);
						pstmt.setTimestamp(6, end_date);
						pstmt.setTimestamp(7, upload_date);
						pstmt.setString(8, description);
						pstmt.executeUpdate();
						pstmt.close();
						con.close();
						
					} catch (ClassNotFoundException e) { 
						System.out.println("드라이버 로드 실패");
					} catch (SQLException e) {
				        System.out.println("DB 접속 실패");
				        e.printStackTrace();
				    } catch(Exception e) {
				%>
						<script>
							alert("에러가 발생했습니다. 잠시 후 시도해주세요.");
							history.back();
						</script>
				<%
					}
					
					
				%>
                <div class="container text-center pt-5">
		            <h4 class="pb-3">경매 올리기에 성공했습니다!</h4>
		       		<input type="button" class="btn btn-outline-primary" value="메인으로 돌아가기" onclick="location='mainpage.jsp'"/>
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