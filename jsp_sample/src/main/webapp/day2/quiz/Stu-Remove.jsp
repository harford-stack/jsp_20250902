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
	
	<%
		String stuNo = request.getParameter("stuNo");
		String query = "DELETE FROM STUDENT WHERE STU_NO =" + stuNo;
		out.println(query);
		int result = stmt.executeUpdate(query);
		if(result > 0) {
			out.println("삭제되었습니다");
		} else {
			out.println("삭제에 실패했습니다");
		}
	%>
	<div>
		<a href="Stu-List.jsp"><button>목록으로</button></a>
	</div>

</body>
</html>