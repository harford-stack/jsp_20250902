<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container {
        width: 600px;
        margin: 10px auto;
    }
    table, tr, td, th {
        border : 2px solid black; /* 2px 크기 검은색 선(solid)으로 */
        border-collapse: collapse; /* 겹치는 선 하나로 */
        text-align: center; /* 가운데 정렬 */
        padding: 5px 20px; /* 안쪽 여백(상하 5px, 좌우 20px) */
    }
    th {
        background-color: beige;
    }
    td {
        width: 400px;
    }

    
</style>
</head>
<body>
	<%@ include file="../../db/db.jsp" %>
	
	<div id="container">
	
		<%
			ResultSet rs = null;
	    	String stuNo = request.getParameter("stuNo");
			String query = "SELECT S.STU_NO, STU_NAME, STU_DEPT, AVG(ENR_GRADE) "
						 + "FROM STUDENT S "
						 + "INNER JOIN ENROL E ON S.STU_NO = E.STU_NO "
						 + "GROUP BY S.STU_NO, STU_NAME, STU_DEPT "
						 + "HAVING S.STU_NO =" + stuNo;
			rs = stmt.executeQuery(query);
			if(rs.next()) {
		%>
			<form name="stu" action="Stu-Remove.jsp">
				<input name="stuNo" value="<%= rs.getString("STU_NO") %>" hidden>
		
				<table>
			        <tr>
			            <th>학번</th>
			            <td><%= rs.getString("STU_NO") %></td>
			        </tr>
			        <tr>
			            <th>이름</th>
			            <td><%= rs.getString("STU_NAME") %></td>
			        </tr>
			        <tr>
			            <th>학과</th>
			            <td><%= rs.getString("STU_DEPT") %></td>
			        </tr>
			        <tr>
			            <th>시험 평균점수</th>
			            <td><%= rs.getString("AVG(ENR_GRADE)") %></td>
			        </tr>
				</table>
				<div>
					<!-- <input type="submit" value="삭제"> -->
					<input type="button" value="삭제" onclick="fnRemove()">
				</div>
			</form>
		<%
			} else {
				out.println("시험을 응시하지 않은 학생입니다, 시험 점수가 없으므로 조회되지 않습니다");
			}
		%>
	</div>
	

</body>
</html>

<script>
	function fnRemove() {
		let stu = document.stu;
		if(!confirm("정말 삭제하시겠습니까?")) {
			return;
		}
		stu.submit();
	}

</script>