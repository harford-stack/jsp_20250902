<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="join" action="Join_Result.jsp" method="get">
		<div>
			아이디 : <input name="id">
		</div>
		<div>
			비밀번호 : <input type="password" name="pwd">
		</div>
		<div>
			비밀번호 확인 : <input type="password" name="pwd2">
		</div>
		<div>
			이름 : <input name="userName">
		</div>
		<div>
			핸드폰 :
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>
		</div>
		<div>
			성별 :
			<input type="radio" name="gender" value="M" checked>남
			<input type="radio" name="gender" value="F">여
		</div>
		<div>
			취미 : 
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="독서">독서
			<input type="checkbox" name="hobby" value="영화감상">영화감상
			<input type="checkbox" name="hobby" value="코딩">코딩
			<input type="checkbox" name="hobby" value="게임">게임
		</div>
		<div>
			<input type="button" value="가입" onclick="fnJoin()">
		</div>
	</form>
</body>
</html>

<script>

	function fnJoin() {
		let join = document.join;

		if(join.id.value.length < 6) {
			alert("아이디는 6글자 이상으로 입력해야 합니다");
			join.id.focus();
			return;
		}
		
		if(join.pwd.value.length < 8) {
			alert("비밀번호는 8글자 이상으로 입력해야 합니다");
			join.pwd.focus();
			return;
		}
		
		let pwdRule = /^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/;
		// 최소 8자리 이상 영문 대소문자, 숫자, 특수문자가 각각 1개 이상 (패스워드 체크시 활용)
		if(!pwdRule.test(join.pwd.value)) {
			alert("비밀번호는 숫자와 특수문자 포함 8글자 이상으로 입력해야 합니다");
			join.pwd.focus();
			return;
		}
		
		if(join.pwd.value != join.pwd2.value) {
			alert("비밀번호가 다릅니다");
			join.pwd.focus();
			return;
		}
		
		if(join.userName.value.length == 0) {
			alert("이름을 입력해주세요");
			join.userName.focus();
			return;
		}
		
		
		
		// 위의 조건을 모두 통과했을 때 최종 submit(action 실행)
		join.submit();
		
		
	}
</script>