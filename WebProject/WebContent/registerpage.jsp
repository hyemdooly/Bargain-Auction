<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String addressDetail = request.getParameter("address_detail");
	
	try{
		//데이터베이스 접속
		Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(driver, "root", "0000");
        sql = "select * from member where id=?"; // id 중복 검사
        pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		pstmt.setString(1, id);

		rs = pstmt.executeQuery();
		rs.last();
		count = rs.getRow();
		
	} catch (ClassNotFoundException e) { 
		System.out.println("드라이버 로드 실패");
	} catch (SQLException e) {
        System.out.println("DB 접속 실패");
        e.printStackTrace();
    }
	
	// id 중복의 경우
	if(count > 0){ 
		rs.close();
		pstmt.close();
		con.close();
	%> 
		<script type="text/javascript">
			alert("이미 회원입니다.");
			history.back();
		</script>
	<%
	} else {
		try{
			// insert
	        sql = "insert into member(id, nickname, password, email, address, address_detail, point, expected_point) value(?, ?, ?, ?, ?, ?, 0, 0)";
	        con = DriverManager.getConnection(driver, "root", "0000");
			pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, password);
			pstmt.setString(4, email);
			pstmt.setString(5, address);
			pstmt.setString(6, addressDetail);
			pstmt.executeUpdate();
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
	        System.out.println("DB 접속 실패");
	        e.printStackTrace();
	    }
		%> 
		<script type="text/javascript">
			alert("가입이 완료되었습니다!");
			location.href = "mainpage.jsp";
		</script>
	<%
		
	}
	
%>
</body>
</html>