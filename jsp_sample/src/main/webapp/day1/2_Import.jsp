<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 자바에서처럼 외부 클래스는 import를 해서 사용해야한다 -->
	<!-- 자바랑 import 방법이 차이가 있다. html에서 작성해야하기 때문에 -->
	
	<%@ page import="java.util.Date" %>
	
	<%= (new Date()).toLocaleString() %>
	
</body>
</html>