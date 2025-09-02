<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Quiz1_Result.jsp" method="get">
		<div>
			<label>아이디 : <input type="text" name="userId"></label>
		</div>
		<div>
			<label>패스워드 : <input type="password" name="pwd"></label>
		</div>
		
		<div>
			<input type="submit" value="로그인"> <!-- form 태그의 action에 있는 페이지로 이동 -->
		</div>
	</form>
</body>
</html>