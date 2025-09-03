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
				
				<div>
					<!-- <input type="submit" value="삭제"> -->
					<input type="button" value="삭제" onclick="fnRemove()">
				</div>
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

</script>