<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 디렉티브 -->
	<!-- 파일을 한곳에 다 모은 후에 컴파일(실행) -->
	<%@ include file="Var.jsp" %>
	
	<!-- 액션 태그 -->
	<!-- 각 파일에서 먼저 컴파일(실행)하고 그 결과를 모아서 출력 -->
	<%-- <jsp:include page="Var.jsp"></jsp:include> --%>
	
	<%= num1 + num2 %>
	
	위 둘의 차이
	
</body>
</html>