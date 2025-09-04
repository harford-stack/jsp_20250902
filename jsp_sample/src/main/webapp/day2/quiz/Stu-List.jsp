<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stu-List.jsp</title>
<style>
	#container {
		width : 700px;
		margin : 20px auto; 
	}
	table, tr, td, th {
		border : 1px solid black;
		text-align : center;
		border-collapse : collapse;
		padding : 5px 10px;
	}
	#search {
    	margin : 20px 0;
    }
    #keyword {
    	margin-right: 5px;
    }

</style>
</head>
<body>
	<%@ include file="../../db/db.jsp" %>
	
	<div id="container">
	
		<div id="search"> <!-- CSS 주기 위한 id -->
			이름 검색 : <input type="text" id="keyword"><button onclick="fnSearch()">검색</button>
		</div>
	
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>키</th>
			</tr>
		<%	// java 로직 코드를 작성하기 위해 스크립틀릿 사용
		
			ResultSet rs = null;
			// ResultSet : SELECT문의 결과를 저장하는 하나의 객체
			// 객체로서 저장된 데이터를 한 행 단위로 불러올 수 있다
		
			String keyword = request.getParameter("keyword");
			// request.getParameter() 메소드는
			// 클라이언트가 전송한 HTTP요청의 매개변수를 가져오는데 사용되는 메소드
			// 사용자가 입력한 데이터를 서버로 전송할 때 매개변수를 함께 전송하는데,
			// 이 때 위 메소드를 사용하여 전달된 매개변수 값을 가져올 수 있다
			// 위 30라인 input 박스에서 데이터를 서버로 전송할 때
			// key : value 형태로 전송한다 여기서 key=id, value=입력값 이 된다
			// 입력값이 무엇이 될 지 예측을 해서 여기 java에 입력할 수가 없으니
			// 이를 대신할 수 있는게 key값 즉, input 박스의 id가 된다
			// 즉 request.getParameter() 메소드를 사용하여
			// 입력값을 가져와서 keyword라는 변수에 담는 것
			
			/* out.println(keyword); */
			// input박스 입력해보고 입력값을 제대로 가져왔는지 확인
			// html <body>에 입력했기 때문에 텍스트 그대로 출력된다
			
			String keywordQuery = "";
			if(keyword != null) {
				keywordQuery = "WHERE STU_NAME LIKE '%" + keyword + "%'";			
			}
		
			String query = "SELECT * FROM STUDENT " + keywordQuery;
			/* out.println(query); */
			rs = stmt.executeQuery(query);
			// ResultSet은 Statement(stmt)를 통해 값을 저장할 수 있다
			// 메소드 executeQuery와 짝꿍으로 SELECT문을 실행할 때 사용
			// executeQuery의 변수는 String sql 즉 sql문 형태여야 한다
			
			// next() 메소드를 통해 선택되는 행을 바꿀 수 있다
			// 테이블 형식을 봤을 때 행이 있을 경우 true 없으면 false
			// while문에서 next() 메소드 쓰면 행 없을 때까지 반복하겠다는 것
			while(rs.next()) {
		%>
				<tr>
					<td><%= rs.getString("STU_NO") %></td>
					<td>
						<a href="javascript:" onclick="fnStu(<%= rs.getString("STU_NO") %>)">
							<%= rs.getString("STU_NAME") %>
						</a>
					</td>
		<!-- a href="javascript:"는 1.빈 문장을 반환한다
		2. 현재 페이지에서 자바스크립트 코드를 실행한다
		3. 클릭 시에 아무 동작도 하지 않고, 다른 어떤 이벤트도 발생하지 않는다
		즉, 자바스크립트 코드만 실행된다 그래서 onclick에 함수를 넣어 자바스크립트 영역에서 정의해준다
		데이터 값이 텍스트로 출력되는데 버튼을 따로 만들 수 없으니 텍스트를 클릭할 수 있게 a태그를 넣어준 것 -->
		<!-- 추가로 a href="#"은 현재 페이지의 맨 위로 이동하는 빈 링크이다
		클릭하면 아무 일도 일어나지 않고 현재 페이지의 맨 위로 스크롤된다
		일반적으로 이벤트를 방지하고자 할 때 사용된다
		클릭 이벤트를 가진 버튼을 만들 때 사용하면 링크 클릭 시에
		페이지가 새로고침되는 것을 방지할 수 있다 -->
					<td><%= rs.getString("STU_DEPT") %></td>
					<td><%= rs.getString("STU_HEIGHT") %></td>
				</tr>
				<!-- rs.getString() : next() 메소드로 선택된 행의
				column을 지정하여 데이터 값을 가져온다 -->
		<% // 다시 말하지만 여기는 <body>이다 테이블 문법을 스클립틀릿 안에서 못씀
			}
		%> 
			
		</table>
		<div>
			<a href="Stu-InsertForm.jsp"><button>학생 추가</button></a>
		</div>
	</div>

</body>
</html>

<script>
	
	// 위에서 호출한 함수들을 여기서 정의한다
	
	function fnStu(stuNo) {
		location.href="Stu-View.jsp?stuNo="+stuNo;
		// location.href는 객체의 속성이며 페이지 자체를 이동시키는 것
		// location 객체란 현재 활성화된 웹 페이지의 URL 정보를 포함하는 window 객체의 프로퍼티
		// location 객체는 전역 객체이면서 window 객체의 프로퍼티이므로
		// window.location 또는 location으로 호출할 수 있습니다.
		// 물음표 뒤의 파라미터 값 : 사용자 정의에 의한 페이지 정보를 얻고자 할 때
		<%-- 위에서 <%= rs.getString("STU_NO") %>를 변수로 지정했다
		?stuNo= 는 데이터 값을 기억하여 끌어오는 역할 --%>
	}
	
	function fnSearch() {
		let keyword = document.querySelector("#keyword").value;
		// 제공한 CSS선택자(클래스 또는 아이디)를 만족하는 첫번째 객체 : 여기서는 input
		// 선택자를 만족하는 모든 요소의 목록이 필요하다면 querySelectorAll()
		location.href = "Stu-List.jsp?keyword="+keyword;
	}
	
	
	
</script>

