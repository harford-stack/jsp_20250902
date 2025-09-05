<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="form" action="Login-Result.jsp">
	<!-- form태그의 객체를 생성(name)하면 form의 데이터를 쉽게 가져올 수 있다 -->
		<div>
			아이디 : <input type="text" name="id">
		</div>
		<div>
			비밀번호 : <input type="password" name="pwd">
		</div>
		<input type="submit" value="submit 로그인">
		<input type="button" value="button 로그인" onclick="fnLogin()">
		<!-- input type의 submit과 button 차이 -->
		<!-- 검증 필요없이 바로 페이지 이동하고자 하면 submit -->
		<!-- 함수 실행으로 검증을 통해서 페이지를 조건부 이동하고자 하면 button -->
	</form>

</body>
</html>

<script>

	function fnLogin() {
		// form태그의 객체를 생성(name)하면 form의 데이터를 쉽게 가져올 수 있다
		let form = document.form;
		let id = form.id.value;
		let pwd = form.pwd.value;
		// form.id 의 id는 input박스의 name이다
		
		if(id.length == 0) {
			alert("아이디를 입력해주세요");
			return;
			// 함수 빠져나가기
		}
		if(pwd.length == 0) {
			alert("비밀번호를 입력해주세요");
			return;
			// 함수 빠져나가기
		}
		
		form.submit();
	}

</script>