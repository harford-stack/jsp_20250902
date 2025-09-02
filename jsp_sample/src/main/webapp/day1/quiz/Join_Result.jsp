R<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("userName");
		String phone = request.getParameter("phone1");
		String gender = request.getParameter("gender");
		String hobby[] = request.getParameterValues("hobby");
	%>
	
	<div>아이디 : <%= id %></div>
	<div>비밀번호 : <%= pwd %></div>
	<div>이름 : <%= name %></div>
	<div>번호 : <%= phone %></div>
	<div>성별 : <%= gender.equals("M") ? "남자" : "여자" %></div>
	<!-- hobby는 반복문 통해 작성 바람 -->
	
</body>
</html>