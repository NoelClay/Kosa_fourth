<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITEST DEMO</title>
</head>
<body>
<h1>로그인 성공입니다.. </h1>


	<form action="/demo" method="Get">
		{데모)} : <input type="submit" value="전송">
	</form>
		<table>
    		<tr>
    			<th>번호</th>
    			<th>메시지</th>
    		</tr>
    		<tr>
    			<td>${user}</td>
    			<td>${message.message}</td>
    		</tr>
    	</table>


</body>
</html>