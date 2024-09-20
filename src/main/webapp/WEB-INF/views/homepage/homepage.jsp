<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>${userNickname}'s HomePage</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/hompage/mainpagestyle.css">

            <c:if test="${activeTheme != null}">
                <link rel="stylesheet" href="${activeTheme}">
            </c:if>
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
                    <button id="openGuestBookForm">나의 한마디</button>
                </c:if>
            </nav>

            <div class="main-content">
                <div class="audio-player">
                    <audio controls src="${musicPath}">
                    </audio>
                </div>

                <h2>${userNickname}'s Guestbook</h2>
                <table class="guestbook">
                    <tr>
                        <th>Username</th>
                        <th>Message</th>
                    </tr>
                    <c:forEach var="un" items="${usernames}" varStatus="status">
                        <tr>
                            <td>${un}</td>
                            <td>${comments[status.index]}</td>
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
                                <input type="radio" name="selectedMusic" value="${music.name}" ${music.active
                                    ? 'checked' : '' }>
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

            <!-- 모달 4: 게스트북 등록하기-->
            <div id="guestBookFormModal" class="modal">
                <div class="modal-content">
                    <span class="close" id="closeGuestBookRegister">&times;</span>
                    <h2>내가 쓴 한마디</h2>
                    <form action="/guestbook/register" method="post">
                        <input type="hidden" name="loginUserId" value="${loginUserId}">
                        <input type="hidden" name="pageUserId" value="${pageUserId}">
                        <textarea name="myComment" id="myComment" cols="30" rows="10">${myCommentWrote != null ? myCommentWrote.comment : ''}</textarea>
                        <button type="submit"> 등록하기 </button>

                    </form>
                </div>
            </div>


            <script>
                document.getElementById('musicRegisterBtn').addEventListener('click', function () {
                    document.getElementById('musicRegisterModal').style.display = 'block';
                });
                document.getElementById('musicActivateBtn').addEventListener('click', function () {
                    document.getElementById('musicActivateModal').style.display = 'block';
                });
                document.getElementById('themeChangeBtn').addEventListener('click', function () {
                    document.getElementById('themeChangeModal').style.display = 'block';
                });

                // 방명록 폼 열기
                document.getElementById('openGuestBookForm').addEventListener('click', function () {
                    document.getElementById('guestBookFormModal').style.display = 'block';
                });

                document.querySelectorAll('.modal .close').forEach(function (button) {
                    button.addEventListener('click', function () {
                        button.closest('.modal').style.display = 'none';
                    });
                });

                // Submit 로직: 각 폼만 제출되도록 제어
                document.querySelector('#guestBookFormModal form').addEventListener('submit', function (event) {
                    event.preventDefault(); // 기본 제출 방지
                    // 방명록 제출 로직 추가 (AJAX 등 필요시)
                    this.submit(); // 원하는 폼만 제출
                });

                document.querySelector('#musicRegisterModal form').addEventListener('submit', function (event) {
                    event.preventDefault(); // 기본 제출 방지
                    // 음악 등록 제출 로직 추가
                    this.submit(); // 원하는 폼만 제출
                });

                document.querySelector('#musicActivateModal form').addEventListener('submit', function (event) {
                    event.preventDefault(); // 기본 제출 방지
                    // 음악 활성화 제출 로직 추가
                    this.submit(); // 원하는 폼만 제출
                });
            </script>

        </body>

        </html>