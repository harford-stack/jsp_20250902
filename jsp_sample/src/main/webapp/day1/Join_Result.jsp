<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <div>취미 : <%= request.getParameter("hobby") %></div> --%>
	
	<%
		String id = request.getParameter("userId");
		String hobby[] = request.getParameterValues("hobby");
		
		// out.println(Arrays.toString(hobby));
		for(int i=0; i<hobby.length; i++) {
			out.println(hobby[i]);
		}
	%>
	
	
</body>
</html>