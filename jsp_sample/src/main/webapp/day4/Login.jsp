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
		
		
		<!-- input type=button 과 그냥 button 차이 -->
		
		<!-- input button : 내용이 없음, 버튼 안의 텍스트는 value 속성으로만 지정 가능
		무조건 버튼 역할만 함, 클릭이벤트는 반드시 onclick 속성이나 js코드로 연결해야 함 -->
		
		<!-- 그냥 button : 시작/종료 태그가 있음,
		그래서 안에 텍스트 뿐만 아니라 html태그/아이콘/이미지 등 다양한 요소 넣기 가능
		type 속성에 따라 다르게 동작 type="button" → 일반 버튼
		type="submit" (기본값) → 폼 데이터를 제출
		type="reset" → 폼 내용을 초기화 -->
		
		<!-- 
		단순히 버튼만 필요 → <input type="button">
		안에 아이콘, 스타일링, 텍스트 자유롭게 넣고 싶다 → <button>
		폼 제출 버튼을 만들 때는 <button type="submit"> 이 주로 쓰임 
		-->
		
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