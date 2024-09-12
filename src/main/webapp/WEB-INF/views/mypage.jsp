<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Homepage</title>
    <link rel="stylesheet" type="text/css" href="../../../resources/static/css/home.css">
</head>
<body>
    <div class="header">
        <h1>My Homepage</h1>
    </div>
    <div class="container">
        <div class="nav">
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="guestbook.jsp?ownerId=${user.id}">Guestbook</a></li>
                <li><a href="customize.jsp">Customize</a></li>
            </ul>
        </div>
        <div class="content">
            <div class="profile">
                <h2>Welcome, ${user.nickname}</h2>
                <img src="${user.profileImage}" alt="Profile Image">
                <p>${user.userIntroduce}</p>
            </div>
            <div class="audio-player">
                <h3>Music Player</h3>
                <audio controls autoplay>
                    <source src="../../../resources/static/music/noel.mp3" type="audio/mp3">
                    
                </audio>
            </div>
            <div class="guestbook-preview">
                <h3>Guestbook Preview</h3>
                <ul>
                    <c:forEach var="entry" items="${guestBooks}">
                        <li>${entry.comment} - ${entry.writerId}</li>
                    </c:forEach>
                </ul>
                <a href="guestbook.jsp?ownerId=${user.id}">View Full Guestbook</a>
            </div>
        </div>
    </div>
</body>
</html>
