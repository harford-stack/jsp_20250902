<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../db/db.jsp" %>
	
	<%
		String empNo = request.getParameter("empNo");
		String query = "SELECT * FROM EMP "
					 + "WHERE EMPNO = '" + empNo + "'";
		ResultSet rs = stmt.executeQuery(query);
		
		if(rs.next()){ // 1개 데이터가 있는지 없는지의 확인은 (while문 대신) if문으로도 가능
	%>
			<div>이미 사용중인 사번입니다.</div>
			<input id="check" name="flg" value="Y" hidden>
	<%		
		} else {
	%>
			<div>사용 가능한 사번입니다.</div>
			<input id="check" name="flg" value="N" hidden>
	<%		
		}
		
	%>
	<div>
		<input type="button" value="되돌아가기" onclick="fnBack()">
	</div>

</body>
</html>

<script>
	function fnBack(){
		let flg = document.querySelector("#check").value;
		window.opener.fnReturn(flg);
		window.close();
	}

</script>
