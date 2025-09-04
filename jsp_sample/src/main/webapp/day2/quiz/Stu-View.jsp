<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stu-View.jsp</title>
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
		
		<!-- 우선 여기로 페이지가 이동될 때
		Stu-List.jsp에서 stuNo에 rs.getString("STU_NO") 값을 넣어왔다
		이름 클릭해서 넘어왔으니 해당 이름의 학번이 저장되어 여기로 왔다 -->
		
		<%
			ResultSet rs = null;
	    	String stuNo = request.getParameter("stuNo");
			String query = "SELECT S.STU_NO, STU_NAME, STU_DEPT, AVG(ENR_GRADE) "
						 + "FROM STUDENT S "
						 + "INNER JOIN ENROL E ON S.STU_NO = E.STU_NO "
						 + "GROUP BY S.STU_NO, STU_NAME, STU_DEPT "
						 + "HAVING S.STU_NO =" + stuNo;
			// 위 쿼리 실행으로 한 행만 조회된다
			rs = stmt.executeQuery(query);
			if(rs.next()) {
		%>
			<form name="stu" action="Stu-Remove.jsp">
			<!-- form태그의 action속성은 폼 데이터를 서버로 보낼 때
			해당 데이터를 저장해서 끌고 갈 url을 명시한다 -->
				<input name="stuNo" value="<%= rs.getString("STU_NO") %>" hidden>
				<!-- input태그의 hidden은 사용자가
				시각적으로 보거나 직접 수정할 수 없는 값을 나타내는 숨겨진 필드
				form에 추가적인 데이터를 포함시키기 위해 사용됨
				즉 action 실행될 때 input태그의 값을 저장해서 끌고가기 위해 
				개발자가 미리 정해둔 값을 숨겨서 서버로 같이 보내고 싶을 때 사용 -->
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
		// form name="stu" 라는 폼 객체를 가져온다
	    // 즉 <form name="stu"> ... </form> 이 부분 전체를 의미함
	    // 이 안에는 hidden input(stuNo 값)과 table, 삭제 버튼이 들어있다
		if(!confirm("정말 삭제하시겠습니까?")) {
		// confirm() : 확인/취소 창을 띄움
        // 확인 → true, 취소 → false 반환
        // !false = true → return 실행됨 (함수 종료, 삭제 안 됨)
        // !true = false → if문 실행 안 하고 다음 줄로 넘어감
			return;
		}
		stu.submit();
		// submit 이벤트는 폼을 제출할 때 트리거가 된다
		// 폼 전송하기 전에 자바스크립트를 호출할 때 사용
		// stu(=form 객체)의 submit() 메서드를 호출 → form이 서버로 전송됨
    	// action="Stu-Remove.jsp" 이므로, 해당 페이지로 POST(GET) 요청이 보내짐
    	// hidden input에 들어있던 stuNo 값도 함께 넘어가서 서버에서 어떤 학생을 삭제할지 알 수 있음
	}
	// 즉, fnRemove()는 단순히 form을 바로 submit하지 않고,
	// 사용자에게 "정말 지울래?"라는 확인 절차(confirm)를 거친 뒤에만
	// submit하도록 만든 보호 장치
</script>