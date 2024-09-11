<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
	<div class="logo">
			<h1>Kosaforce</h1>
	</div>
		<p></p>
		<hr>
		<form>
			<fieldset>
				<legend>개인 정보</legend>
				<label for="user-name">이름</label><input type="text" name="user-name"
					id="user-name" size="10"><br> <label for="user-tel">연락처</label><input
					type="tel" name="user-tel" id="user-tel" size="10"><br>
			</fieldset>

			<fieldset>
				<legend>지원 분야</legend>
				<input type="radio" name="field" id="f-publishing"> <label
					for="f-publishing">웹 퍼블리싱</label><br> <input type="radio"
					name="field" id="f-webdev"> <label for="f-webdev">웹
					개발</label><br> <input type="radio" name="field" id="f-qa"> <label
					for="f-qa">개발 지원</label><br>
			</fieldset>

			<fieldset>
				<legend>지원 동기</legend>
				<textarea name="motive" id="motive" cols="60" rows="5"
					placeholder="본사 지원 동기를 간략히 써주세요."></textarea>
				<label for="motive" hidden>지원동기</label>
			</fieldset>

			<button type="submit">접수하기</button>
			<button type="reset">다시쓰기</button>
		</form>
	</div>
</body>
</html>