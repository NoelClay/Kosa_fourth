<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITEST DEMO</title>
</head>
<body>
<h1>데모입니다. </h1>


	<form action="/login/loginForm" method="post">
		{로그인(Post)} : <input type="submit" value="전송">
	</form>

	<form action="/signup/signUpForm" method="post">
    	{회원 가입(Post)} : <input type="submit" value="전송">
    </form>

    <form action="/login/loginOut" method="post">
        {로그 아웃(Post)} : <input type="submit" value="전송">
    </form>


</body>
</html>