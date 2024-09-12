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
	<form action="/update/update" method="post">
		<table>
			<tr>
				<td>email:</td>
				<td	><input type="email" name="email"  value = "${user.email}" readonly > </td>
			</tr>
			<tr>
				<td>패스워드:</td>
				<td><input type="password" name="password" value = "${user.password}"></td>
			</tr>
			<tr>
				<td>닉네임:</td>
				<td><input type="text" name="nickName" value = "${user.nickName}"></td>
			</tr>
			<tr>
				<td>프로필 이미지:</td>
				<td>
				<input type="radio" name="profileImage" value="cupid.png" <c:out value="${user.profileImage == 'cupid.png' ? 'checked' : ''}"/>><img src=/image/cupid.png  width = 50>
                <input type="radio" name="profileImage" value="groceries.png" <c:out value="${user.profileImage == 'groceries.png' ? 'checked' : ''}"/>><img src=/image/groceries.png  width = 50>
                <input type="radio" name="profileImage" value="sculpture.png" <c:out value="${user.profileImage == 'sculpture.png' ? 'checked' : ''}"/>><img src=/image/sculpture.png  width = 50>
                </td>
			</tr>
			<tr>
				<td>간단한 소개:</td>
                <td><input type="text" name="userIntroduce" value = "${user.userIntroduce}"></td>
			</tr>
		<input type="submit" value="등록"><input type="reset" value="취소">
	</form>



</body>
</html>