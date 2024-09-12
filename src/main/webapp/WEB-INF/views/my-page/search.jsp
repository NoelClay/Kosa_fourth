<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2024-09-12
  Time: 오후 3:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="" method="post">
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
    <th>팔로우</th>
  </tr>
  <jsp:useBean id="userId" scope="session" type="java.lang.String"/>
  <c:forEach var="userFollowStatus" items="${userFollowStatusList}">
    <tr>
      <td><img src="${userFollowStatus.userDTO.profileImage}" alt=""></td>
      <td>${userFollowStatus.userDTO.email}</td>
      <td>${userFollowStatus.userDTO.nickname}</td>
      <td>${userFollowStatus.userDTO.userIntroduce}</td>
      <c:choose>
        <c:when test="${!userFollowStatus.userDTO.id.equals(userId)}">
          <c:choose>
            <c:when test="${!userFollowStatus.follow}">
              <td><a href="${pageContext.request.contextPath}/my-page/following?targetId=${userFollowStatus.userDTO.id}">팔로잉</a></td>
            </c:when>
            <c:otherwise>
              <td><a href="${pageContext.request.contextPath}/my-page/unfollow?targetId=${userFollowStatus.userDTO.id}">언팔로우</a></td>
            </c:otherwise>
          </c:choose>
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
