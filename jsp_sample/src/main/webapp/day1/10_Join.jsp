<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Join_Result.jsp">
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input type="password" name="pwd"></label>
		</div>
		<div>
			취미 : 
			<label><input type="checkbox" name="hobby" value="운동">운동</label>
			<label><input type="checkbox" name="hobby" value="코딩">코딩</label>
			<label><input type="checkbox" name="hobby" value="독서">독서</label>
			<label><input type="checkbox" name="hobby" value="영화감상">영화감상</label>
			<label><input type="checkbox" name="hobby" value="게임">게임</label>
		</div>
		<div>
			<input type="submit" value="가입">
		</div>
	</form>
</body>
</html>