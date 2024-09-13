<%--
  User: 문현동
  Date: 2024-09-12
  Time: 오후 3:56
  유저 검색을 위한 페이지.
  유저 이메일아이디나 닉네임에 어떤 글자가 포함되있는지를 기준으로 하여 찾습니다.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/my-page/search-result" method="post">
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
    <th>메세지 전송</th>
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
              <td>
                <form action="${pageContext.request.contextPath}/my-page/following" method="post">
                  <input type="hidden" name="targetId" value="${userFollowStatus.userDTO.id}">
                  <button type="submit">팔로잉</button>
                </form>
              </td>
            </c:when>
            <c:otherwise>
              <td>
                <form action="${pageContext.request.contextPath}/my-page/unfollow" method="post">
                  <input type="hidden" name="targetId" value="${userFollowStatus.userDTO.id}">
                  <button type="submit">언팔로우</button>
                </form>
              </td>
            </c:otherwise>
          </c:choose>
          <td>
            <form action="${pageContext.request.contextPath}/message/send-message" method="post">
              <input type="hidden" name="receiverId" value="${userFollowStatus.userDTO.id}">
              내용: <input type="text" name="content">
              <button type="submit">보내기</button>
            </form>
          </td>
        </c:when>
        <c:otherwise>
          <td>자신</td>
          <td>자신</td>
        </c:otherwise>
      </c:choose>
    </tr>
  </c:forEach>
</table>
</body>
</html>
