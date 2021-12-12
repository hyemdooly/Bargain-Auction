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
		int bid_mem_id = 0;
		int current_price = 0;
		int point = 0;
		
		// 기존 최고가 낸 회원에게 포인트 돌려주는 부분
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(driver, "root", "0000");
			sql = "select bid_mem_id, current_price from item where id="+request.getParameter("item_id");
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				bid_mem_id = rs.getInt("bid_mem_id");
				current_price = rs.getInt("current_price");
			}
			if(bid_mem_id > 0) {
				sql = "select * from member where mid=" + bid_mem_id;
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					point = rs.getInt("expected_point");
				}
				point = point + current_price; // expected_point 계산, 쓴 포인트 다시 돌려줌
				sql = "update member set expected_point=" + point + " where mid=" + bid_mem_id;
				stmt.executeUpdate(sql);
			}
		} catch(Exception e) {
			e.printStackTrace();
		%>
			<script>
				alert("에러가 발생했습니다. 잠시 후 시도해주세요.");
				history.back();
			</script>
		<%
		} 
		
		
		// 새로운 회원의 것으로 update
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(driver, "root", "0000");
			sql = "update item set bid_mem_id="+session.getAttribute("mid")+",current_price="+request.getParameter("price")+" where id="+request.getParameter("item_id");
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stmt.executeUpdate(sql);
			
			sql = "select * from member where mid=" + session.getAttribute("mid");
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				point = rs.getInt("expected_point");
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