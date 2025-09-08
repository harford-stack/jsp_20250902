<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, td, th {
		border : 1px solid black;
		text-align : center;
		border-collapse : collapse;
		padding : 5px 10px;
	}
</style>
</head>
<body>
	<%@ include file="../db/db.jsp" %>
	
	<%
		String empNo = request.getParameter("empNo");
		// 사번, 이름, 상사(MGR)의 이름, 급여, 소속부서의 평균급여, 부서이름
		// 네이버 카페 쿼리문 참고
		
		String query = "SELECT E.EMPNO, E.ENAME, E2.ENAME AS MGR_NAME, E.SAL, AVG_SAL, DNAME "
					 + "FROM EMP E "
					 + "LEFT JOIN EMP E2 ON E.MGR = E2.EMPNO "
					 + "INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO "
					 + "INNER JOIN (SELECT DEPTNO, ROUND(AVG(SAL)) AS AVG_SAL FROM EMP GROUP BY DEPTNO) T "
					 + "ON E.DEPTNO = T.DEPTNO "
					 + "WHERE E.EMPNO = '" + empNo + "'";
		// out.println(query);
	%>
		<table>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>상사 이름</th>
				<th>급여</th>
				<th>소속부서 평균급여</th>
				<th>부서명</th>
			</tr>
	<%
		try {			
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()) {
	%>
			<tr>
				<td><%= rs.getString("EMPNO") %></td>
				<td><%= rs.getString("ENAME") %></td>
				<td><%= rs.getString("MGR_NAME") %></td>
				<td><%= rs.getString("SAL") %></td>
				<td><%= rs.getString("AVG_SAL") %></td>
				<td><%= rs.getString("DNAME") %></td>
			</tr>		
	<%
			} else {
				out.println("데이터 조회에 실패했습니다");
				// 페이지 상황에 따른 오류 확인 시 // 리스트 띄워놓고 나갔다왔는데 누군가 삭제했을때
			}
		} catch(SQLException e) {
			out.println("오류가 발생했습니다");
			// 데이터베이스 관련 오류 확인 시
		}
	%>
		</table>
		
		<div>
			<input type="button" value="삭제" onclick="fnRemove()">
		</div>

		<input id="empNo" value="<%= empNo %>" hidden>

</body>
</html>

<script>
	function fnRemove() {
		if(!confirm("정말 삭제하시겠습니까")) {
			return;
		}
		let empNo = document.querySelector("#empNo").value;
		location.href = "EMP-Remove.jsp?empNo="+empNo;
	}
</script>