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
    #contents {
        height: 200px;
    }
    
</style>
</head>
<body>
	<%@ include file="../db/db.jsp" %>
	
	<div id="container">

	        
	    <%
			ResultSet rs = null;
	    	String boardNo = request.getParameter("boardNo");
			String query = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') "
						 + "CTIME FROM TBL_BOARD B WHERE BOARDNO = " + boardNo;
			rs = stmt.executeQuery(query);
			if(rs.next()) {
		%>
			<form name="board" action="Board-Remove.jsp">
				<input name="boardNo" value="<%= rs.getString("BOARDNO") %>" hidden>
				<table>
			        <tr>
			            <th>제목</th>
			            <td><%= rs.getString("TITLE") %></td>
			        </tr>
			        <tr>
			            <th>작성자</th>
			            <td><%= rs.getString("USERID") %></td>
			        </tr>
			        <tr>
			            <th>작성일</th>
			            <td><%= rs.getString("CTIME") %></td>
			        </tr>
			        <tr id="contents">
			            <th>내용</th>
			            <td><%= rs.getString("CONTENTS") %></td>
			        </tr>
				</table>
				<%
					String userId = rs.getString("USERID");
					String sessionId = (String) session.getAttribute("sessionId");
					String status = (String) session.getAttribute("sessionStatus");
					if(userId.equals(sessionId) || status.equals("A")) {
						
				%>
					<div>
					<!-- <input type="submit" value="삭제"> -->
					<input type="button" value="삭제" onclick="fnRemove()">
					<input type="button" value="수정" onclick="fnEdit()">
					</div>
				<%
					}
				%>
				
			</form>
		<%
			} else {
				out.println("게시글 조회에 실패했습니다");
			}
		%>
	        
	    
	</div>
</body>
</html>

<script>
	function fnRemove() {
		let board = document.board;
		if(!confirm("정말 삭제하시겠습니까?")) {
			return;
		}
		board.submit();
	}
	
	function fnEdit() {
		let board = document.board;
		board.action = "Board-Edit.jsp"; // form 태그의 액션 값 변경 가능
		console.log(board.action);
		board.submit();
	}

</script>