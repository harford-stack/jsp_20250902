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
		String empNo = request.getParameter("empNo");
		String empName = request.getParameter("empName");
		String sal = request.getParameter("sal");
		String deptNo = request.getParameter("deptNo");
		
		String query = "INSERT INTO EMP(EMPNO, ENAME, SAL, DEPTNO) VALUES("
					 + "'" + empNo + "', '" + empName + "', '" + sal + "', '" + deptNo + "')";
		// out.println(query);
		

		// DB PK가 이미 존재하는데 추가하려고 하는 등의 오류 발생을 대비해 try catch 사용
		try {
			stmt.executeUpdate(query);
			// out.println("추가되었습니다");
			// out.println("<script>alert('추가되었습니다'); location.href='EMP-List.jsp';</script>");
			out.println("<input id='result' value='T' hidden>");
		} catch (SQLException e) {
			out.println("<input id='result' value='F' hidden>");
		}
		
		
	%>
	
	
</body>
</html>

<script>
	let result = document.querySelector("#result").value;
	if(result == 'T') {
		alert("추가되었습니다.");
		location.href="EMP-List.jsp";
	} else {
		alert("오류가 발생했습니다.");
	}
</script>