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
	    String stuName = request.getParameter("stuName");
	    String stuDept = request.getParameter("stuDept");
	    String stuHeight = request.getParameter("stuHeight");
	
	    String query = "INSERT INTO STUDENT (STU_NO, STU_NAME, STU_DEPT, STU_HEIGHT) " +
	                   "VALUES (" + stuNo + ", '" + stuName + "', '" + stuDept + "', " + stuHeight + ")";
	
	    int result = stmt.executeUpdate(query);
	
	    if(result > 0) {
	        out.println("<script>alert('학생이 등록되었습니다'); location.href='Stu-List.jsp';</script>");
	    } else {
	        out.println("<script>alert('등록에 실패했습니다'); history.back();</script>");
	    }
	%>
</body>
</html>