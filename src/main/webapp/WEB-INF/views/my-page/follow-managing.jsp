<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2024-09-12
  Time: 오전 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<hr>
<form action="${pageContext.request.contextPath}/my-page/follow-managing/searching" method="post">
    유저 검색: <input type="text" name="keyword">
    <button type="submit">검색하기</button>
</form>
<hr>
<table>
    <tr>
        <th>이미지</th>
        <th>이메일</th>
        <th>닉네임</th>
        <th>자기소개</th>
        <th>자세히보기</th>
    </tr>
    <jsp:useBean id="userId" scope="session" type="java.lang.String"/>

    <c:forEach var="user" items="${userDTOList}">
        <tr>
            <td>${user.profileImage}</td>
            <td>${user.email}</td>
            <td>${user.nickname}</td>
            <td>${user.userIntroduce}</td>
            <c:choose>
                <c:when test="${!user.id.equals(userId)}">
                    <td><a href="${pageContext.request.contextPath}/my-page/follow?targetId=${user.id}">팔로우</a></td>
                </c:when>
                <c:otherwise>
                    <td>자신</td>
                </c:otherwise>
            </c:choose>
        </tr>
    </c:forEach>
</table>
</body>
</html>
