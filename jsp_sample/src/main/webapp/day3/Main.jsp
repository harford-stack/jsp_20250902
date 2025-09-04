<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>메인 페이지 입니다</h1>
	<%
		String sessionId = (String) session.getAttribute("sessionId");
	%>
	<div><%= sessionId %>님 환영합니다</div>
	<div>
		<button>학생 관리</button>
		<button onclick="fnBoard()">게시판 관리</button>
	</div>

</body>
</html>

<script>

	function fnBoard() {
		location.href = "Board-List.jsp";
	}

</script>