<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<%
	//디비 환경 변수
	String driver = "jdbc:mysql://localhost:3306/bargainAuction?serverTimezone=UTC";
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	ResultSet rs = null;
	int count = 0;
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String mid = "";
       
	
	try{
		//데이터베이스 접속
		Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(driver, "root", "0000");
        sql = "select * from member where id=? and password=?";
        pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		pstmt.setString(1, id);
		pstmt.setString(2, password);

		//id와 pwd를 db에서 찾기
		rs = pstmt.executeQuery();
		rs.last();
		count = rs.getRow();
		rs.beforeFirst();
		rs.next();
		mid = rs.getString("mid");
		
		rs.close();
		pstmt.close();
		con.close();
	} catch (ClassNotFoundException e) { 
		System.out.println("드라이버 로드 실패");
	} catch (SQLException e) {
        System.out.println("DB 접속 실패");
        e.printStackTrace();
    }
	
	
	//로그인 성공시(count 변수는 찾은 아이디의 개수를 저장)
	if(count > 0){
		session.setAttribute("id", id);
		session.setAttribute("mid", mid);
		System.out.println("id : " + id + "\nmid : "+mid);
		response.sendRedirect("mainpage.jsp"); 
	}
	else{	//로그인 실패시
		System.out.println("로그인 안됨 " + count);
		%>
		<script type="text/javascript">
			alert("회원이 아니거나 비밀번호가 다릅니다.");
			document.location.href = "loginpage.html";
		</script>
		<%
	}
%>
</body>
</html>