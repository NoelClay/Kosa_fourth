<%--
  User: 문현동
  Date: 2024-09-22
  Time: 오후 8:43
  유저 마이페이지.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%><!-- JSTL -->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이 페이지</title>
	<link rel="stylesheet" href="/css/template-style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- jQuery, Popper.js, Bootstrap JS CDN 추가 -->
    <script
      src="https://code.jquery.com/jquery-3.7.1.js"
      integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
      crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<!--
			Sidebar 메뉴를 담당하는 aside 요소
			상단에는 게시글 보기, 방명록 보기, 유저 검색 버튼
			중간에는 유저 프로필과 소개 (프로필 사진 클릭 시 페이지 이동)
			하단에는 게시글 쓰기, 방명록 쓰기, 페이지 설정 버튼
	-->
	<aside class="sidebar">
		<!-- 상단 메뉴 -->
		<div class="menu-top">
			<a href="#" class="menu-icon" title="게시글 보기"><img src="post-icon.png" alt="게시글 보기"></a>
			<a href="#" class="menu-icon" title="방명록 보기"><img src="guestbook-icon.png" alt="방명록 보기"></a>
			<a href="${pageContext.request.contextPath}/my-page/search" class="menu-icon" title="유저 검색"><img src="search-icon.png" alt="유저 검색"></a>
		</div>
		
		<!-- 유저 프로필 영역 -->
		<div class="user-profile">
			<a href="my-page.html">
				<img src="profile-picture.jpg" alt="Profile Picture" class="profile-picture">
			</a>
			<div class="user-info">
				<h2>Deeper Learning</h2>
				<p>Dlaiml</p>
			</div>
		</div>
		
		<!-- 하단 메뉴 -->
		<div class="menu-bottom">
			<a href="#" class="menu-icon" title="게시글 쓰기"><img src="write-icon.png" alt="게시글 쓰기"></a>
			<a href="#" class="menu-icon" title="방명록 쓰기"><img src="guestbook-write-icon.png" alt="방명록 쓰기"></a>
			<a href="#" class="menu-icon" title="페이지 설정"><img src="settings-icon.png" alt="페이지 설정"></a>
		</div>
	</aside>
	
	<!-- 메인 콘텐츠 -->
	<main class="content">
		<div class="post-summary">
			<div class="d-flex justify-content-center align-items-center">
				<h1>My page</h1>
				<div>
					<a href="${pageContext.request.contextPath}/alarm/get-list">
						<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
							<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2M8 1.918l-.797.161A4 4 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4 4 0 0 0-3.203-3.92zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5 5 0 0 1 13 6c0 .88.32 4.2 1.22 6"/>
						</svg>
					</a>
				</div>
			</div>
			<hr>
			<div id ='userInfo'>
				<table class="table table-hover table-bordered">
					<tbody>
						<tr>
							<td>이메일</td>
							<td>${userInfo.email}</td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td><img class="profile-img" src="/image/${userInfo.profileImage}" alt=""> ${userInfo.nickname}</td>
						</tr>
						<tr>
							<td>자기소개</td>
							<td>${userInfo.userIntroduce}</td>
						</tr>
						<tr>
							<td>가입 일자</td>
							<td>${userInfo.createdTime}</td>
						</tr>
						<tr>
							<td>마지막 로그인 시각</td>
							<td>${userInfo.lastLoginTime}</td>
						</tr>
					</tbody>
				</table>


				<div class="d-flex justify-content-between">
					<div class="mb-2">
						<a href="${pageContext.request.contextPath}/my-page/new-messages" class="btn btn-outline-primary" type="button">받은 메세지함</a>
					</div>
					<div class="mb-2">
						<a href="${pageContext.request.contextPath}/my-page/follower-list" class="btn btn-outline-primary" type="button">나를 팔로우 중인 사람들</a>
					</div>
				</div>
				<div class="d-flex justify-content-between">
					<div class="mb-2">
						<a href="${pageContext.request.contextPath}/my-page/all-messages" class="btn btn-outline-primary" type="button">전체 메세지함</a>
					</div>
					<div class="mb-2">
						<a href="${pageContext.request.contextPath}/my-page/following-list" class="btn btn-outline-primary" type="button">내가 팔로잉 중인 사람들</a>
					</div>
				</div>
			</div>
			<div id ="update-form" style="display: none;">
            	<form action="/update/update"  method="post">

                   <table >
                        <tr>
                           <td>email:</td>
                           <td><input type="email" name="email"  value = "${userInfo.email}" readonly ></td>
                        </tr>
                        <tr>
                           <td>패스워드:</td>
                           <td><input type="password" name="password" value = "${userInfo.password}" required
                                    placeholder="영문 + 특수문자 + 숫자 포함 최소 8자리"
                                    pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"></td>
                        </tr>
                        <tr>
                            <td>닉네임:</td>
                            <td><input type="text" name="nickName" value = "${userInfo.nickname}"></td>
                        </tr>
                        <tr>
                            <td>프로필 이미지:</td>
                            <td>
                                <input type="radio" name="profileImage" value="cupid.png" <c:out value="${userInfo.profileImage == 'cupid.png' ? 'checked' : ''}"/>><img src=/image/cupid.png  width = 50>
                                <input type="radio" name="profileImage" value="groceries.png" <c:out value="${userInfo.profileImage == 'groceries.png' ? 'checked' : ''}"/>><img src=/image/groceries.png  width = 50>
                                <input type="radio" name="profileImage" value="sculpture.png" <c:out value="${userInfo.profileImage == 'sculpture.png' ? 'checked' : ''}"/>><img src=/image/sculpture.png  width = 50>
                            </td>
                        </tr>
                        <tr>
                             <td>간단한 소개:</td>
                             <td><input type="text" name="userIntroduce" value = "${userInfo.userIntroduce}"></td>
                        </tr>

                   </table>
                   <input class="btn btn-primary" type="submit" value="등록"><input lass="btn btn-warning" type="reset" value="취소">
                </form>
            </div>
			<hr>
			<div class="d-flex">
				<div class="me-auto">
					<button type="button" class="btn btn-primary" id = "userUpdateButton">내 정보 수정</button>
				</div>
				<div>
					<a href="/loginMain/loginOut" class="btn btn-warning" type="button">로그 아웃</a>

					<button type="button" class="btn btn-danger" id="user-SignOut"> 회원 탈퇴</button>

				</div>
			</div>
		</div>
	</main>
</div>
</body>
<script>
  $(document).ready(function() {
    $('#userUpdateButton').click(function(event) {
      console.log("유저 정보 수정 버튼 클릭");
      $('#update-form').show();
      $('#userInfo').hide();
    });
  });

$(document).ready(function() {
    $('#user-SignOut').click(function() {
        if (confirm('정말 탈퇴하시겠습니까? (탈퇴 후 1년간 재가입 불가)')) {
            // Fetch API를 이용한 탈퇴 요청
            fetch('/signOut/signOut', {
                method: 'POST', // HTTP 메서드
                headers: {
                    'Content-Type': 'application/json' // 서버로 보내는 데이터 형식
                },
                body: JSON.stringify({
                    // 필요한 데이터 (예: 사용자 ID, 탈퇴 사유 등)
                    email: userInfo.email,
                })
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // 탈퇴 성공 시 처리
                alert('회원 탈퇴가 완료되었습니다.');
                window.location.href = '/intro';
            })
            .catch(error => {
                // 탈퇴 실패 시 처리
                console.error('Error:', error);
                alert('회원 탈퇴에 실패했습니다. 다시 시도해주세요.');
            });
        }
    });
});
</script>
</html>