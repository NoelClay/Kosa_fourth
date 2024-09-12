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
	<form action="/find/passwordFind" method="post">
		<table>
			<tr>
				<td>email:</td>
				<td	><input type="email" name="email"  > </td>
			</tr>

			<tr>
				<td>질문:</td>
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

		<input type="submit" value="등록"><input type="reset" value="취소">
	</form>





</body>
</html>