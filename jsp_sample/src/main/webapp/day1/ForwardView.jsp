<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이동한 페이지
	<div>아이디 : <%= request.getParameter("userId") %></div>
	<div>나이 : <%= request.getParameter("age") %></div>
</body>
</html>