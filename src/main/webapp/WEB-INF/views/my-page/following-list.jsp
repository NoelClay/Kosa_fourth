<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2024-09-12
  Time: 오후 4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>내가 팔로잉중인 사람들</p>
<hr>
<table>
    <tr>
        <th>이미지</th>
        <th>이메일</th>
        <th>닉네임</th>
        <th>자기소개</th>
    </tr>
    <c:forEach var="user" items="${userDTOList}">
        <tr>
            <td><img src="${user.profileImage}" alt=""></td>
            <td>${user.email}</td>
            <td>${user.nickname}</td>
            <td>${user.userIntroduce}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
