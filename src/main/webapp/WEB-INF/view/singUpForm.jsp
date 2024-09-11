<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
	<form action="/signup/signup" method="post">
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
				<!-- <td><input type="text" name="profileImage"></td> -->
				<td><select name="profileImage">
                	<option value='resources/static/image/demo.png'><img src=resources/static/image/demo.png></option>
                	<option value='resources/static/image/demo.png'><img src=static/image/demo.png></option>
                	<option value='resources/static/image/demo.png'><img src=resources/static/image/demo.png></option>
                </select></td>
			</tr>
			<tr>
				<td>간단한 소개:</td>
                <td><input type="text" name="userIntroduce"></td>
			</tr>

			<tr>
				<td>주소:</td>
				<td><select name="validationQuizQuestion">
					<option value='졸업한 초등학교'>졸업한 초등학교</option>
					<option value='가장 좋아하는 영화'>가장 좋아하는 영화</option>
					<option value='가장 싫어하는 음식'>가장 싫어하는 음식</option>
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