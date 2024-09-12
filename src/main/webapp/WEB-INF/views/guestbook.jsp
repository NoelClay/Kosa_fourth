<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Guestbook</title>
    <link rel="stylesheet" type="text/css" href="../../../resources/static/css/guestbook.css">
</head>
<body>
    <div class="header">
        <h1>Guestbook</h1>
    </div>
    <div class="container">
        <div class="nav">
            <ul>
                <li><a href="myPage.jsp">Home</a></li>
                <li><a href="guestbook.jsp">Guestbook</a></li>
            </ul>
        </div>
        <div class="content">
            <h2>Messages</h2>
            <ul>
                <c:forEach var="entry" items="${guestBooks}">
                    <li>${entry.comment} - ${entry.writerId} on ${entry.createdAt}</li>
                </c:forEach>
            </ul>
        </div>
    </div>
</body>
</html>
