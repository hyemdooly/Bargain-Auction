<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <%
   		String driver = "jdbc:mysql://localhost:3306/bargainAuction?serverTimezone=UTC";
		Connection con = null;
		Statement stmt = null;
		String sql = null;
		ResultSet rs = null;
		
		int point = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(driver, "root", "0000");
			sql = "update item set bid_mem_id="+session.getAttribute("mid")+",current_price="+request.getParameter("price")+" where id="+request.getParameter("item_id");
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stmt.executeUpdate(sql);
			
			sql = "select * from member where mid=" + session.getAttribute("mid");
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				point = rs.getInt("point");
			}
			point = point - Integer.parseInt(request.getParameter("price")); // expected_point 계산
			sql = "update member set expected_point="+point+" where mid="+session.getAttribute("mid");
			stmt.executeUpdate(sql);
			
		} catch(Exception e) {
			e.printStackTrace();
		%>
			<script>
				alert("에러가 발생했습니다. 잠시 후 시도해주세요.");
				history.back();
			</script>
		<%
		} 
		
		response.sendRedirect("itempage.jsp?id="+request.getParameter("item_id"));
		%>

</html>