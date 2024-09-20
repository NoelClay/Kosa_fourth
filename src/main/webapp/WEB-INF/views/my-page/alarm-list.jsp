<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2024-09-13
  Time: 오전 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
  <tr>
    <th>보낸사람</th>
    <th>내용</th>
    <th>읽음 처리</th>
  </tr>
  <c:forEach var="alarmUserDTO" items="${alarmUserDTOList}">
    <tr>
      <td>${alarmUserDTO.userNickname}</td>
      <td>${alarmUserDTO.alarmContent}</td>
      <td>
        <form action="${pageContext.request.contextPath}/alarm/read" method="post">
          <input type="hidden" name="alarmId" value="${alarmUserDTO.alarmId}">
          <button type="submit">읽음</button>
        </form>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
