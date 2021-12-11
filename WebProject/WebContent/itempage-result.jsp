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
		
		try {
			sql = "update item set bid_mem_id="+session.getAttribute("mid")+",current_price="+request.getParameter("price")+" where id="+request.getParameter("item_id");
			con = DriverManager.getConnection(driver, "root", "0000");
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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