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
		String stuNo = request.getParameter("stuNo");
		String query = "SELECT * FROM STUDENT "
					 + "WHERE STU_NO = '" + stuNo + "'";
		ResultSet rs = stmt.executeQuery(query);
		
		if(rs.next()){
	%>
			<div>이미 사용중인 학번입니다.</div>
			<input id="check" name="flg" value="Y" hidden>
	<%		
		} else {
	%>
			<div>사용 가능한 학번입니다.</div>
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