<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>바겐 옥션</title>
</head>
<body>
<%
	String driver = "jdbc:mysql://localhost:3306/bargainAuction?serverTimezone=UTC";
	Connection con = null;
	Statement stmt = null;
	String sql = null;
	ResultSet rs = null;
	int mid = Integer.parseInt(session.getAttribute("mid").toString());
	String newPassword = request.getParameter("new_password").toString();
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(driver, "root", "0000");
		stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		sql = "update member set password='"+newPassword+"' where mid="+mid;
		stmt.executeUpdate(sql);
	} catch(ClassNotFoundException e) {
		System.out.println("드라이버 로드 실패");
	} catch(SQLException e) {
	    System.out.println("DB 접속 실패");
	    e.printStackTrace();
	}
	
	response.sendRedirect("mypage.jsp");
%>

</body>
</html>