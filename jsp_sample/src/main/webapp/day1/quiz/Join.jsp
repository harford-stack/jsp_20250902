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
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input type="password" name="pwd1"></label>
		</div>
		<div>
			<label>비밀번호 확인 : <input type="password" name="pwd2"></label>
		</div>
		<div>
			<label>이름 : <input name="userName"></label>
		</div>
		<div>
			핸드폰 :
			<select name="phone">
				<option>010</option>
			</select>
		</div>
		<div>
			성별 : <input type="radio" name="gender" value="M" checked>남 <input type="radio" name="gender" value="F">여
		</div>
		<div>
			취미 : 
			<label><input type="checkbox" name="hobby" value="운동">운동</label>
			<label><input type="checkbox" name="hobby" value="독서">독서</label>
			<label><input type="checkbox" name="hobby" value="영화감상">영화감상</label>
			<label><input type="checkbox" name="hobby" value="코딩">코딩</label>
			<label><input type="checkbox" name="hobby" value="게임">게임</label>
		</div>
		<div>
			<input type="submit" value="가입" onclick="fnCheck()">
		</div>
	</form>
</body>
</html>

<script>
	// 아이디, 비밀번호가 빈 값이 아닐 때만 action 실행
	function fnCheck() {
		// form 태그의 name을 이용해서 객체 가져오기
		let join = document.join;
		if(join.userId.value.length == 0) {
			alert("아이디를 입력해주세요");
			join.userId.focus();
			return;
		} else if(join.userId.value.length < 6) {
			alert("아이디는 6글자 이상으로 입력해야 합니다");
			join.userId.focus();
			return;
		}
		
		if(join.pwd1.value.length == 0) {
			alert("비밀번호를 확인해주세요");
			join.pwd1.focus();
			return;
		} else if() {
			
		}
		
		// 위의 조건을 모두 통과했을 때 최종 submit(action 실행)
		login.submit();
		
		
	}
</script>