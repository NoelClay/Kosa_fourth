<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${userNickname}'s HomePage</title>
    <style>
        /* 레이아웃 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: black;
            color: white;
            text-align: center;
            padding: 20px;
            font-size: 24px;
        }

        nav {
            float: left;
            width: 15%;
            background-color: #c4c4c4;
            padding: 20px;
            height: 100vh;
        }

        nav button {
            display: block;
            width: 100%;
            margin: 10px 0;
            padding: 10px;
            background-color: #a9a9a9;
            border: none;
            cursor: pointer;
            font-size: 16px;
            color: white;
        }

        nav button:hover {
            background-color: #888;
        }

        .main-content {
            margin-left: 15%;
            padding: 20px;
            background-color: white;
        }

        .audio-player {
            text-align: center;
            margin-bottom: 20px;
        }

        .guestbook {
            width: 100%;
            border-collapse: collapse;
        }

        .guestbook th, .guestbook td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .guestbook th {
            background-color: black;
            color: white;
        }

        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover, .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<header>
    <div id="headerTitle"> 
        ${userNickname}'s HomePage
    </div>
</header>

<nav>
    <button>게시글 보기</button>
    <button>유저 검색</button>
    <button>팔로우 목록보기</button>
    <button>내 홈피 바로가기</button>

    <c:if test="${loginUserId == pageUserId}">
        <button id="openSettings">내 홈피 설정 변경</button>
    </c:if>
    <c:if test="${loginUserId != pageUserId}">
        <button>나의 한마디</button>
    </c:if>
</nav>

<div class="main-content">
    <div class="audio-player" >
        <audio controls src="${musicPath}">
        </audio>
    </div>

    <h2>${userNickname}'s Guestbook</h2>
    <table class="guestbook">
        <tr>
            <th>Username</th>
            <th>Message</th>
        </tr>
        <c:forEach var="entry" items="${guestbookEntries}">
            <tr>
                <td>${entry.username}</td>
                <td>${entry.message}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<!-- 모달 1 -->
<div id="settingsModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeSettings">&times;</span>
        <h2>홈피 설정 변경</h2>
        <button id="musicRegisterBtn">음악 등록</button>
        <button id="musicActivateBtn">음악 활성화</button>
        <button id="themeChangeBtn">테마 색상 변경</button>
    </div>
</div>

<!-- 모달 2: 음악 등록 -->
<div id="musicRegisterModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeMusicRegister">&times;</span>
        <h2>음악 등록</h2>
        <p>음악을 서버에 직접 등록하세요</p>
        <form action="/music/register" method="post" enctype="multipart/form-data">
            <label for="musicName">음악 이름:</label>
            <input type="text" id="musicName" name="musicName" required>
            <br>
            <label for="musicFile">음악 파일:</label>
            <input type="file" id="musicFile" name="musicFile" accept=".mp3" required>
            <br><br>
            <button type="submit">등록</button>
        </form>
    </div>
</div>

<!-- 모달 3: 음악 활성화 -->
<div id="musicActivateModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeMusicActivate">&times;</span>
        <h2>음악 활성화</h2>
        <form action="/music/activate" method="post">
            <c:forEach var="music" items="${musicList}">
                <label>
                    <input type="radio" name="selectedMusic" value="${music.name}" ${music.active ? 'checked' : ''}>
                    ${music.name}
                </label>
                <br>
            </c:forEach>
            <button type="submit">확인</button>
    </div>
</div>

<!-- 모달 4: 테마 색상 변경 -->
<div id="themeChangeModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeThemeChange">&times;</span>
        <h2>테마 색상 변경</h2>
        <p>여기에 테마 색상 변경 내용을 추가하세요.</p>
    </div>
</div>

<script>
    // 내 홈피 설정 모달 열기
    document.getElementById('openSettings').onclick = function() {
        document.getElementById('settingsModal').style.display = 'block';
    };

    // 모달 닫기
    document.getElementById('closeSettings').onclick = function() {
        document.getElementById('settingsModal').style.display = 'none';
    };

    // 음악 등록 모달 열기
    document.getElementById('musicRegisterBtn').onclick = function() {
        document.getElementById('settingsModal').style.display = 'none';
        document.getElementById('musicRegisterModal').style.display = 'block';
    };

    document.getElementById('closeMusicRegister').onclick = function() {
        document.getElementById('musicRegisterModal').style.display = 'none';
    };

    // 음악 활성화 모달 열기
    document.getElementById('musicActivateBtn').onclick = function() {
        document.getElementById('settingsModal').style.display = 'none';
        document.getElementById('musicActivateModal').style.display = 'block';
    };

    document.getElementById('closeMusicActivate').onclick = function() {
        document.getElementById('musicActivateModal').style.display = 'none';
    };

    // 테마 색상 변경 모달 열기
    document.getElementById('themeChangeBtn').onclick = function() {
        document.getElementById('settingsModal').style.display = 'none';
        document.getElementById('themeChangeModal').style.display = 'block';
    };

    document.getElementById('closeThemeChange').onclick = function() {
        document.getElementById('themeChangeModal').style.display = 'none';
    };

    // 모달 외부 클릭 시 닫기
    window.onclick = function(event) {
        if (event.target.classList.contains('modal')) {
            event.target.style.display = 'none';
        }
    };
</script>

</body>
</html>
