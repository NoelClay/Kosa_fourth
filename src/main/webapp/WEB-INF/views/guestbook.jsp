<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Guestbook</title>
    <link rel="stylesheet" type="text/css" href= "/css/guestbook.css">
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
                    <li>${entry.getComment()} - ${entry.getWriterId()} on ${entry.getCreatedAt()}</li>
                </c:forEach>
            </ul>


            <div class="actions">
                <c:choose>
                    <c:when test="${loginUserId eq ownerId}">
                        <div class="myhome">
                            <button type="button" id="themeButton">테마 변경</button>
                            <button type="button" id="musicButton">배경음악 설정</button>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="otherhome">
                            <button type="button" id="writeButton">글쓰기</button>
                            <button type="button">취소</button>

                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
    </div>

        <!-- Modal Structure -->
        <div id="modal" class="modal">
            <div id="modal-content">

                <p id="modalText">Some text in the Modal..</p>

                <div id="theme-modal">
                    <label for="itemColor1">아이템 색상 1:</label>
                    <input type="color" id="itemColor1" value="#ff0000">
            
                    <label for="itemColor2">아이템 색상 2:</label>
                    <input type="color" id="itemColor2" value="#00ff00">
            
                    <label for="itemColor3">아이템 색상 3:</label>
                    <input type="color" id="itemColor3" value="#0000ff">
            
                    <!-- Font Color Selection -->
                    <label for="fontColor1">폰트 색상 1:</label>
                    <input type="color" id="fontColor1" value="#000000">
            
                    <label for="fontColor2">폰트 색상 2:</label>
                    <input type="color" id="fontColor2" value="#ffffff">
            
                    <button id="applyThemeButton">적용</button>
                </div>

                <div id="comment-modal">
                    <form action="/guestbook/add" method="post">
                        <lable for="comment-modal-textarea"> 방명록 한마디 </lable>
                        <textarea rows="3" cols="100" name="noteComment"></textarea>
                        <input type="submit" value="등록">
                        <input type="hidden" name="writerId" value="${loginUserId}">
                        <input type="hidden" name="ownerId" value="${ownerId}">
                    </form>
                </div>
                <span id="close">&times;</span>
            </div>
        </div>
    
        <script src="/js/guestbook.js"></script>
</body>
</html>
