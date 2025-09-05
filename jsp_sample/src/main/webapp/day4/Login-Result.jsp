<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db/db.jsp" %>
	
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String query = "SELECT * FROM TBL_USER "
					 + "WHERE USERID = '" + id + "' "
					 + "AND PASSWORD = '" + pwd + "'";
		// out.print(query);
		ResultSet rs = stmt.executeQuery(query);
		// rs.next();
		// rs.getString("NAME");
		if(rs.next()) {
			out.println("로그인 성공");
			String loginId = rs.getString("USERID");
			String status = rs.getString("STATUS");
			
			session.setAttribute("sId", loginId);
			session.setAttribute("status", status);
			
			response.sendRedirect("EMP-List.jsp");
		} else {
			out.println("로그인 실패");
		}
	%>
	
</body>
</html>