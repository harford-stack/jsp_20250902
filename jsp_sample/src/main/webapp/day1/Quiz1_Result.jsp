<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- userId가 'test', pwd가 '1234'로 넘어올 경우 -->
	<!-- 화면에 파란색 글씨로 '로그인 성공' 출력 -->
	<!-- 아닐 경우 빨간색 글씨로 '로그인 실패' 출력 -->
	
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		/* if(userId.equals("test") && pwd.equals("1234")) {
			out.println("<div style='color:blue;'> 로그인 성공 </div>");
		} else {
			out.println("<div style='color:red;'> 로그인 실패 </div>");
		} */
		
		if(userId.equals("test") && pwd.equals("1234")) {
			// out.println("<div style='color:blue;'> 로그인 성공 </div>");
			response.sendRedirect("Main.jsp");
		} else {
			out.println("<div style='color:red;'> 로그인 실패 </div>");
		}
		
	%>
	
	
</body>
</html>