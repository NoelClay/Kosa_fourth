<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>${userNickname}'s HomePage</title>
            <!-- 스타일시트 경로 설정 -->
            <style>
                /* 기본적인 레이아웃 스타일 */
                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                    background-color: #f4f4f4;
                    line-height: 1.6;
                }

                header {
                    background-color: black;
                    color: white;
                    text-align: center;
                    padding: 15px;
                    font-size: 22px;
                }

                nav {
                    float: left;
                    width: 18%;
                    background-color: #2c3e50;
                    padding: 20px;
                    height: 100vh;
                }

                nav button {
                    display: block;
                    width: 90%;
                    margin: 15px 0;
                    padding: 12px;
                    background-color: #34495e;
                    border: none;
                    cursor: pointer;
                    font-size: 16px;
                    color: white;
                    border-radius: 5px;
                }

                nav button:hover {
                    background-color: #1abc9c;
                }

                .main-content {
                    margin-left: 20%;
                    padding: 30px;
                    background-color: white;
                    min-height: 100vh;
                }

                .audio-player {
                    text-align: center;
                    margin-bottom: 25px;
                }

                .guestbook {
                    width: 100%;
                    border-collapse: collapse;
                }

                .guestbook th,
                .guestbook td {
                    border: 1px solid #ddd;
                    padding: 10px;
                    text-align: center;
                }

                .guestbook th {
                    background-color: #34495e;
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
                    background-color: rgba(0, 0, 0, 0.5);
                    padding-top: 60px;
                }

                .modal-content {
                    background-color: #fefefe;
                    margin: 5% auto;
                    padding: 20px;
                    border: 1px solid #888;
                    width: 60%;
                    border-radius: 10px;
                }

                .close {
                    color: #aaa;
                    float: right;
                    font-size: 28px;
                    font-weight: bold;
                }

                .close:hover,
                .close:focus {
                    color: black;
                    text-decoration: none;
                    cursor: pointer;
                }

                button {
                    border-radius: 4px;
                    transition: all 0.3s ease;
                }

                button:hover {
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                }

                .audio-player {
                    text-align: center;
                    margin-bottom: 20px;
                }
            </style>

            <!-- 유저의 활성화된 테마가 있을 경우 그 테마를 적용 -->
            <c:if test="${activeTheme != null}">
                <link rel="stylesheet" href="${activeTheme}">
            </c:if>
        </head>

        <body>

            <header>
                <div id="headerTitle">
                    <!-- 유저 닉네임을 보여주는 부분 -->
                    ${userNickname}'s HomePage
                </div>
            </header>

            <nav>
                <!-- 네비게이션 버튼들 -->
                <button>게시글 보기</button>
                <button>유저 검색</button>
                <button>팔로우 목록보기</button>
                <button>내 홈피 바로가기</button>

                <!-- 현재 로그인한 유저가 페이지 소유자인 경우 홈피 설정 버튼이 보이도록 설정 -->
                <c:if test="${loginUserId == pageUserId}">
                    <button id="openSettings">내 홈피 설정 변경</button>
                </c:if>
                <!-- 로그인 유저가 페이지 소유자가 아닌 경우 '나의 한마디' 버튼이 보이도록 설정 -->
                <c:if test="${loginUserId != pageUserId}">
                    <button id="openGuestBookForm">나의 한마디</button>
                </c:if>
            </nav>

            <div class="main-content">
                <div class="audio-player">
                    <!-- 자동 재생 + 음소거된 오디오 플레이어 -->
                    <audio id="backgroundMusic" controls autoplay muted loop>
                        <source src="${musicPath}" type="audio/mpeg">
                        Your browser does not support the audio element.
                    </audio>
                    <button id="unmutePlayerButton" onclick="unmute()">unmute</button>
                </div>

                <h2>${userNickname}'s Guestbook</h2>
                <table class="guestbook">
                    <tr>
                        <th>Username</th>
                        <th>Message</th>
                    </tr>
                    <!-- 방명록 데이터를 반복하여 테이블에 출력 -->
                    <c:forEach var="un" items="${usernames}" varStatus="status">
                        <tr>
                            <td>${un}</td>
                            <td>${comments[status.index]}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <!-- 모달 1: 홈피 설정 -->
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
                        <!-- 사용자의 음악 리스트를 반복하여 출력 -->
                        <c:forEach var="music" items="${musicList}">
                            <label>
                                <!-- 활성화된 음악 선택 -->
                                <input type="radio" name="selectedMusic" value="${music.name}" ${music.active
                                    ? 'checked' : '' }>
                                ${music.name}
                            </label>
                            <br>
                        </c:forEach>
                        <button type="submit">확인</button>
                    </form>
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

            <!-- 모달 4: 게스트북 등록 -->
            <div id="guestBookFormModal" class="modal">
                <div class="modal-content">
                    <span class="close" id="closeGuestBookRegister">&times;</span>
                    <h2>내가 쓴 한마디</h2>
                    <!-- 방명록 등록 폼 -->
                    <form action="/guestbook/register" method="post">
                        <input type="hidden" name="loginUserId" value="${loginUserId}">
                        <input type="hidden" name="pageUserId" value="${pageUserId}">
                        <textarea name="myComment" id="myComment" cols="30"
                            rows="10">${myCommentWrote != null ? myCommentWrote.comment : ''}</textarea>
                        <button type="submit"> 등록하기 </button>
                    </form>
                </div>
            </div>

            <script>
                // 내 홈피 꾸미기 버튼 추가
                var openSettingBtn = document.getElementById('openSettings');
                if (openSettingBtn) { // 버튼이 존재하는지 확인
                    openSettingBtn.addEventListener('click', function () {
                        document.getElementById('settingsModal').style.display = 'block';
                    });
                }


                // 음악 등록 모달 열기
                var musicRegisterBtn = document.getElementById('musicRegisterBtn');
                if (musicRegisterBtn) { // 버튼이 존재하는지 확인
                    musicRegisterBtn.addEventListener('click', function () {
                        document.getElementById('musicRegisterModal').style.display = 'block';
                    });
                }

                // 음악 활성화 모달 열기
                var musicActivateBtn = document.getElementById('musicActivateBtn');
                if (musicActivateBtn) { // 버튼이 존재하는지 확인
                    musicActivateBtn.addEventListener('click', function () {
                        document.getElementById('musicActivateModal').style.display = 'block';
                    });
                }

                // 테마 변경 모달 열기
                var themeChangeBtn = document.getElementById('themeChangeBtn');
                if (themeChangeBtn) { // 버튼이 존재하는지 확인
                    themeChangeBtn.addEventListener('click', function () {
                        document.getElementById('themeChangeModal').style.display = 'block';
                    });
                }

                // 방명록 폼 열기
                var guestBookFormBtn = document.getElementById('openGuestBookForm');
                if (guestBookFormBtn) { // 버튼이 존재하는지 확인
                    guestBookFormBtn.addEventListener('click', function () {
                        document.getElementById('guestBookFormModal').style.display = 'block';
                    });
                }

                // 모달 닫기 버튼
                var closeButtons = document.querySelectorAll('.modal .close');
                closeButtons.forEach(function (button) {
                    button.addEventListener('click', function () {
                        button.closest('.modal').style.display = 'none';
                    });
                });

                // 각 폼이 독립적으로 작동하게 설정
                var guestBookForm = document.querySelector('#guestBookFormModal form');
                if (guestBookForm) {
                    guestBookForm.addEventListener('submit', function (event) {
                        event.preventDefault(); // 기본 제출 방지
                        console.log("방명록 제출");
                        this.submit(); // 원하는 폼만 제출
                    });
                }

                var musicRegisterForm = document.querySelector('#musicRegisterModal form');
                if (musicRegisterForm) {
                    musicRegisterForm.addEventListener('submit', function (event) {
                        event.preventDefault(); // 기본 제출 방지
                        console.log("음악 등록 제출");
                        this.submit(); // 원하는 폼만 제출
                    });
                }

                var musicActivateForm = document.querySelector('#musicActivateModal form');
                if (musicActivateForm) {
                    musicActivateForm.addEventListener('submit', function (event) {
                        event.preventDefault(); // 기본 제출 방지
                        console.log("음악 활성화 제출");
                        this.submit(); // 원하는 폼만 제출
                    });
                }

                function unmute() {
                    const player = document.getElementById("backgroundMusic");

                    player.muted = !player.muted;

                    player.play();
                }
            </script>

        </body>

        </html>