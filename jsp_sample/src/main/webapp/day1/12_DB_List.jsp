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
		ResultSet rs = null;
		String query = "SELECT * FROM STUDENT";
		rs = stmt.executeQuery(query);
		
		while(rs.next()) {
			// out.println("<div>" + rs.getString("STU_NAME") + "</div>");
	%>
		<div><%= rs.getString("STU_NAME") %></div>
	<%
		}
	%>
</body>
</html>