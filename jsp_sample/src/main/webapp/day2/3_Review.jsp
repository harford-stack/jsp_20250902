<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String name = request.getParameter("userName");
		String age = request.getParameter("age");
		/* 기본적으로 getParameter를 사용할 때에는 String을 쓴다 */
		/* js에서는 parseInt() */
		/* java에서는 메소드가 단독으로 사용되지는 않고 객체의 호출로 사용되기에 */
		/* Integer.parseInt() 로 사용한다 */
		
		out.println("<div>" + name + "님의 나이는 " + age + "입니다.</div>");
	%>
	
	
	<div>
		<%= name + "님의 나이는 " + age + "입니다." %>
	</div>

</body>
</html>