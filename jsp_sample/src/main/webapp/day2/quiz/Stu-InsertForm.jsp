<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../db/db.jsp" %>
	
	<h2>학생 등록</h2>
    <form name="stu" action="Stu-Insert.jsp">
        <div>학번: <input type="text" name="stuNo"></div>
        <div>이름: <input type="text" name="stuName"></div>
        <div>학과: <input type="text" name="stuDept"></div>
        <div>키: <input type="text" name="stuHeight"></div>
        <div>
        	<input type="submit" value="등록">
        	<a href="Stu-List.jsp"><button type="button">취소</button></a>
    	</div>
    </form>

</body>
</html>