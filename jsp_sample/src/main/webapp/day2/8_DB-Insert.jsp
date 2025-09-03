<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>8_DB-Insert.jsp</title>
</head>
<body>
	<form name="stu" action="9_Insert_Result.jsp">
		<div>
			학번 : <input name="stuNo">
			<button onclick="fnCheck(); return false;">중복체크</button>
		</div>
		<div>
			이름 : <input name="stuName">
		</div>
		<div>
			학과 : <input name="stuDept">
		</div>
		<div>
			<input type="button" value="추가" onclick="fnAdd()">
		</div>
	</form>
</body>
</html>
<script>
	let joinFlg = false;

	function fnAdd(){
		let stu = document.stu;
		if(joinFlg){
			stu.submit();
		} else {
			alert("중복체크 확인 후 제출해주세요.");
		}
	}
	
	function fnCheck(){
		let stu = document.stu;
		let stuNo = stu.stuNo.value;
		window.open(`Id-Check.jsp?stuNo=\${stuNo}`, "check", "width=300, height=300");
	}
	
	function fnReturn(flg){
		if(flg == "N"){
			let form = document.stu;
			form.stuNo.disabled = true;
			joinFlg = true;
		}
	}
</script>