<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2024-09-12
  Time: 오후 7:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% String errorMsg = (String) request.getAttribute("error"); %>
에러: <%= errorMsg %>
</body>
</html>
