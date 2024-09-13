<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%><!-- JSTL -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITEST DEMO</title>

<%
Integer id = (Integer)session.getAttribute("loginUserId");
String email = (String)session.getAttribute("loginEmail");
%>
</head>
<body>
<h1>회원 탈퇴 확인 </h1>


	<form action="/delete/delete" method="Post">
		<table>
            <tr>
				<td>id:</td>
				<td	><%=id %> </td>
			</tr>
            <tr>
				<td>email:</td>
				<td	><%=email %> </td>
			</tr>

    	</table>
		{정말 삭제 하시겠습니캬?)} : <input type="submit" value="전송">
	</form>


</body>
</html>