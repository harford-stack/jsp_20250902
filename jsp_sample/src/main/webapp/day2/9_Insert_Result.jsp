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
	
	<!-- insert하기 전에 stuNo가 db에 있는 지 확인하고 -->
	<!-- 없으면 insert, 있으면 '해당 학번은 이미 사용 중입니다' 출력 -->
	
	<%
		String stuNo = request.getParameter("stuNo");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		
		String selectQuery = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		ResultSet rs = stmt.executeQuery(selectQuery);
		if (rs.next()) {
			out.println("해당 학번은 이미 사용중입니다.");
		} else {
			String query = "INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT) VALUES ( "
						 + "'" + stuNo + "',"
						 + "'" + stuName + "',"
						 + "'" + stuDept + "'"
						 + ")";
			
			int result = stmt.executeUpdate(query);
			if(result > 0) {
				out.println("추가되었습니다");
			} else {
				out.println("오류가 발생했습니다");
			}
		}
	%>

</body>
</html>