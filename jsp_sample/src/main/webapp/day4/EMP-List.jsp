<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container {
		width : 700px;
		margin : 20px auto; 
	}
	table, tr, td, th {
		border : 1px solid black;
		text-align : center;
		border-collapse : collapse;
		padding : 5px 10px;
	}
	.grade {
		color: blue;
		font-weight: bold;
	}
	a {
		color: black;
		text-decoration: none;
	}
</style>
</head>
<body>
	<%@ include file="../db/db.jsp" %>
	
	<%
		String query = "SELECT EMPNO, ENAME, JOB, SAL, DNAME, GRADE "
					 + "FROM EMP E "
					 + "INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL "
					 + "INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO "
					 + "ORDER BY GRADE DESC";
		// out.println(query);
		ResultSet rs = stmt.executeQuery(query);
	%>
		<table>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>직책</th>
				<th>급여</th>
				<th>부서이름</th>
				<th>급여등급</th>
			</tr>
		
	<%
		while(rs.next()) {
			int grade = rs.getInt("GRADE");
	%>
			<tr <%= grade >= 4 ? "class='grade'" : "" %>>
			<!-- 표현식을 이용한 .... -->
				<td><%= rs.getString("EMPNO") %></td>
				<td><a href="EMP-View.jsp?empNo=<%= rs.getString("EMPNO") %>"><%= rs.getString("ENAME") %></a></td>
				<td><%= rs.getString("JOB") %></td>
				<td><%= rs.getString("SAL") %></td>
				<td><%= rs.getString("DNAME") %></td>
				<td><%= rs.getString("GRADE") %></td>
				<!-- html 영역에서 자바 코드를 그대로 쓸 수 없기 때문에 jsp 표현식 사용 -->
			</tr>
	<%
		}
	%>
		</table>
		<a href="EMP-Add.jsp">
			<input type="button" value="사원추가">
		</a>
</body>
</html>