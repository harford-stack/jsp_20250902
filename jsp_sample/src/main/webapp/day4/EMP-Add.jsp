<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	input[readonly] {
		background-color: #eee;
		border: 2px solid #eee;
	}
</style>
<body>
	<form name="form" action="EMP-Add-Result.jsp">
		<div>
			사번 : <input name="empNo">
			<input type="button" value="중복체크" onclick="fnCheck()">
		</div>
		<div>
			이름 : <input name="empName">
		</div>
		<div>
			급여 : <input name="sal">
		</div>
		<div>
			<input name="deptNo" type="radio" value="10" checked> ACCOUNTING
			<input name="deptNo" type="radio" value="20"> RESEARCH
			<input name="deptNo" type="radio" value="30"> SALES
			<input name="deptNo" type="radio" value="40"> OPERATIONS
		</div>
		<div>
			<input type="button" value="추가" onclick="fnAdd()">
		</div>
	</form>

</body>
</html>

<script>
	let addFlg = false;

	function fnAdd(){
		let form = document.form;
		if(addFlg) {
		form.submit();			
		} else {
			alert("중복체크 확인 후 추가해주세요");
		}
	}
	
	function fnCheck(){
		let form = document.form;
		let empNo = form.empNo.value;
		window.open(`Emp-Check.jsp?empNo=\${empNo}`, "check", "width=500, height=500");
	}
	
	function fnReturn(flg){
		let form = document.form;
		if(flg == "N"){
			let obj = form.empNo;
			obj.readOnly = true;
			// readOnly를 사용하면 실제로 입력이나 수정이 안되긴하지만 css이용해서 수정불가인 것처럼 보이게하기
			addFlg = true;
		}
	}
	
</script>