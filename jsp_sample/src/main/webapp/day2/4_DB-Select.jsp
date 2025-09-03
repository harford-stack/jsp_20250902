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
		
		// rs.next(); // 커서 이동 후 데이터가 있으면 true를 리턴
		// String stuName = rs.getString("STU_NAME");
		// out.println(stuName + " ");
		// 커서 이동을 위해 rs.next();를 여러번 타자 입력하기보다는 반복문으로 작성
		
		while(rs.next()) {
			String stuName = rs.getString("STU_NAME");
			out.println(stuName + " ");
		}
		
	%>

</body>
</html>