<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/signup.css"> </head>
</head>
<body>

	<form action="/demo" method="Get">
		{데모)} : <input type="submit" value="전송">
	</form>
    <br>

	<form action="/signup/signup" method="post" class="signup-form">
		<table>
			<tr>
				<td>아이디(email형식):</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td>패스워드:</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>닉네임:</td>
				<td><input type="text" name="nickName"></td>
			</tr>
			<tr>
				<td>프로필 이미지:</td>
				<td>
				<input type="radio" name="profileImage" value="cupid.png" checked><img src=/image/cupid.png  width = 50>
                <input type="radio" name="profileImage" value="groceries.png"><img src=/image/groceries.png width = 50>
                <input type="radio" name="profileImage" value="sculpture.png"><img src=/image/sculpture.png width = 50>
                </td>
			</tr>
			<tr>
				<td>간단한 소개:</td>
                <td><input type="text" name="userIntroduce"></td>
			</tr>

			<tr>
				<td>질문:</td>
				<td><select name="validationQuizQuestion">
					<option value='1'>졸업한 초등학교</option>
					<option value='2'>가장 좋아하는 영화</option>
					<option value='3'>가장 싫어하는 음식</option>
				</select></td>
			</tr>
			<tr>
				<td>답변:</td>
				<td><input type="text" name="validationQuizAnswer"></td>
			</tr>
		</table>

		<input type="submit" value="등록"><input type="reset" value="취소">
	</form>

</body>
</html>