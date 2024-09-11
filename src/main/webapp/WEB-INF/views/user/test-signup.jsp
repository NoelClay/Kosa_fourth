<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2024-09-11
  Time: 오후 4:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="" method="post">
        <label for="email">이메일 아이디: </label>
        <input id="email" type="email" name="email">
        <br>
        <label for="password">비밀번호: </label>
        <input id="password" type="password" name="password">
        <br>
        <label for="nickname">닉네임: </label>
        <input id="nickname" type="text" name="nickname">
        <br>
        프로필 이미지:
        <img class="signup-img" src="${pageContext.request.contextPath}/image/avatar.png"><input type="checkbox" name="profileImage" value="/image/avatar.png">
        <br>
        <label for="introduce">자기소개: </label>
        <textarea id="introduce" name="introduce"></textarea>
        <br>
        <label for="question">비밀번호 찾기 질문: </label>
        <select id="question" name="question">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select>
        <br>
        <label for="answer">비밀번호 찾기 정답: </label>
        <input id="answer" type="text" name="answer">
        <button type="submit">가입</button>
    </form>
</body>
</html>
