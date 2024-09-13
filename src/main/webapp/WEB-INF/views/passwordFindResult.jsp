<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%><!-- JSTL -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITEST DEMO</title>
</head>
<body>
<h1>정보 수정. </h1>
	<form action="/demo" method="Get">
		{데모)} : <input type="submit" value="전송">
	</form>
<br>
<br>
	<form action="/find/passwordFindResult" method="post">
		<table>
			<tr>
				<td>email:</td>
				<td	><input type="email" name="email"  value = "${userFind.email}" readonly > </td>
			</tr>
			<tr>
				<td>패스워드:</td>
				<td><input type="password" name="password"></td>
			</tr>

		    <input type="submit" value="등록"><input type="reset" value="취소">
		</table>
	</form>



</body>
</html>