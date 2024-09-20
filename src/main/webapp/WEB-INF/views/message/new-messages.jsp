<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2024-09-13
  Time: 오후 2:36
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
        <th>이미지</th>
        <th>보낸 사람</th>
        <th>내용</th>
        <th>보낸 일시</th>
        <th>읽음 처리</th>
    </tr>
    <c:forEach var="messageUserDTO" items="${messageUserDTOList}">
        <tr>
            <td><img src="${messageUserDTO.profileImage}" alt=""></td>
            <td>${messageUserDTO.nickname}</td>
            <td>${messageUserDTO.content}</td>
            <td>${messageUserDTO.createdAt}</td>
            <td>
                <form action="${pageContext.request.contextPath}/message/read" method="post">
                    <input type="hidden" name="messageId" value="${messageUserDTO.id}">
                    <button type="submit">읽음</button>
                </form>
            </td>
            <td>
                <form action="${pageContext.request.contextPath}/message/delete" method="post">
                    <input type="hidden" name="messageId" value="${messageUserDTO.id}">
                    <button type="submit">삭제</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
