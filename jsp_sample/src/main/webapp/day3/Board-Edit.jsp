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
        /* text-align: center; */
        padding: 5px 10px; /* 안쪽 여백(상하 5px, 좌우 20px) */
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
    .input-txt {
    	width: 95%;
    	height: 25px;
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
		rs.next();
	%>
		<form name="board" action="Board-Add-Result.jsp">
			<table>
				<tr>
					<th>게시글 종류</th>
					<td>
						<!-- 1=>공지사항 2=>자유 3=>문의 -->
						<select name="kind">
							<option value="1">공지사항</option>
							<option value="2">자유게시판</option>
							<option value="3">문의게시판</option>
						</select>
					</td>
				</tr>
		        <tr>
		            <th>제목</th>
		            <td><input type="text" name="title" class="input-txt"></td>
		        </tr>
		        <tr>
		            <th>작성자</th>
		            <td><input type="text" name="userId" class="input-txt"></td>
		        </tr>

		        <tr>
		            <th>내용</th>
		            <td id="contents">
		            	<textarea name="contents" rows="20" cols="68"></textarea>
		            </td>
		        </tr>
			</table>
			
			<div>
				<!-- <input type="submit" value="삭제"> -->
				<input type="button" value="작성" onclick="fnAdd()">
			</div>
		</form>
	</div>


</body>
</html>

<script>

	function fnAdd() {
		let form = document.board;
		form.submit();
	}

</script>