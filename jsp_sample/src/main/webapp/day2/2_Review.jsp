<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- form 태그 -->
	<!-- form 태그는 submit이 실행되었을 때 action에 있는 페이지로 이동 -->
	<!-- action 페이지로 이동 시, input 태그(+ select, textarea)에 있는 값들을 전달한다 -->
	<!-- 태그들의 name이 key 역할을 한다 -->
	<form name="form" action="3_Review.jsp">
		<div>이름 : <input name="userName"></div>
		<div>나이 : <input name="age"></div>
		<div>
			<input type="submit" value="전달">
			<input type="button" value="검증 후 전달" onclick="fnCheck()">
		</div>
	</form>

</body>
</html>

<script>

	function fnCheck() {
		let form = document.form;
		if(form.userName.value.length == 0) {
			alert("이름을 입력해주세요");
			form.userName.focus();
			return;
		}
		form.submit();
	}

</script>