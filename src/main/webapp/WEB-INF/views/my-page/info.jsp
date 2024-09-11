<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2024-09-11
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
여기는 마이페이지 입니다.
<hr>
DB 아이디: ${userInfo.id}
<br>
이메일: ${userInfo.email}
<br>
비밀번호: ${userInfo.password}
<br>
닉네임: ${userInfo.nickname}
<br>
프로필 이미지: <img src="${userInfo.profile_image}">
<br>
자기소개: ${userInfo.user_introduce}
<br>
가입 일자:${userInfo.created_time}
<br>
마지막 로그인 시각: ${userInfo.last_login_time}
<br>
비밀번호 찾기 질문: ${userInfo.validation_quiz_question}
<br>
비밀번호 찾기 답변: ${userInfo.validation_quiz_answer}
</body>
</html>
