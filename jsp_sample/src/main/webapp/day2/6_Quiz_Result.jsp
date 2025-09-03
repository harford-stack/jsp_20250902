<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- userId, pwd를 전달 받아서 -->
	<!-- TBL_USER 테이블의 아이디와 비밀번호를 비교해서 -->
	<!-- 값이 있으면 '로그인 성공' 없으면 '로그인 실패' 출력 -->
	
	<%@ include file="../db/db.jsp" %>
	
	<%-- <%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String query = "SELECT * FROM TBL_USER";
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()) {
			if(userId.equals(rs.getString("USERID")) && pwd.equals(rs.getString("PASSWORD"))) {
				out.println("로그인 성공");
				break;
			} else {
				out.println("로그인 실패");
				break;
			}
		}
	%> --%>
	
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String query = "SELECT * FROM TBL_USER "
					   + "WHERE USERID = '" + userId + "' "
					   + "AND PASSWORD = '" + pwd + "'";
		ResultSet rs = stmt.executeQuery(query);
		
		if(rs.next()) {
			out.println("로그인 성공");
		} else {
			out.println("로그인 실패");
		}
	%>

</body>
</html>