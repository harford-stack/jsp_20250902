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
	#search {
    	margin : 20px 0;
    }
</style>
</head>
<body>

<%@ include file="../db/db.jsp" %>

	<div id="container">
	
		<div id="search">
				검색어 : <input type="text" id="keyword">
					   <button onclick="fnSearch()">검색</button>
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>

	
		<%
			ResultSet rs = null;
			String keyword = request.getParameter("keyword");
			out.println(keyword);
			
			String keywordQuery = "";
			if(keyword != null) {
				keywordQuery = "WHERE TITLE LIKE '%" + keyword + "%'";
			}
			
			String query = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') "
						 + "CTIME FROM TBL_BOARD B " + keywordQuery;
			out.println(query);
			rs = stmt.executeQuery(query);
			
			// out.println("<table>");
			// out.println("<tr>");
			// out.println("</tr>");
			// out.println("</table>");
			// 테이블 만들 때 위처럼 하면 번거로움 그래서 container 밑에 html에서 하듯이 함
			
			while(rs.next()) {
		%>
				<tr>
					<td> <%= rs.getString("BOARDNO") %> </td>
					<td> 
						<%-- <a href="Board-View.jsp?boardNo=<%= rs.getString("BOARDNO") %>">
							<%= rs.getString("TITLE") %>
						</a> --%>
						<a href="javascript:" 
						onclick="fnBoard(<%= rs.getString("BOARDNO") %>)">
						<%= rs.getString("TITLE") %>
						</a>
					</td>
					<td> <%= rs.getString("USERID") %> </td>
					<td> <%= rs.getString("CNT") %> </td>
					<td> <%= rs.getString("CTIME") %> </td>
				</tr>
		<%		
			}
			
		%>
		
		</table>
	</div>

</body>
</html>

<script>
	function fnBoard(boardNo) {
		location.href = "Board-View.jsp?boardNo=" + boardNo;
	}
	
	function fnSearch() {
		let keyword = document.querySelector("#keyword").value;
		location.href = "Board-List.jsp?keyword="+keyword;
	}

	
</script>


