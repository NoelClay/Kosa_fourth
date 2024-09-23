<%--<table>--%>
<%--	<tr>--%>
<%--		<th>보낸사람</th>--%>
<%--		<th>내용</th>--%>
<%--		<th>읽음 처리</th>--%>
<%--	</tr>--%>
<%--	<c:forEach var="alarmUserDTO" items="${alarmUserDTOList}">--%>
<%--		<tr>--%>
<%--			<td>${alarmUserDTO.userNickname}</td>--%>
<%--			<td>${alarmUserDTO.alarmContent}</td>--%>
<%--			<td>--%>
<%--				<form action="${pageContext.request.contextPath}/alarm/read" method="post">--%>
<%--					<input type="hidden" name="alarmId" value="${alarmUserDTO.alarmId}">--%>
<%--					<button type="submit">읽음</button>--%>
<%--				</form>--%>
<%--			</td>--%>
<%--		</tr>--%>
<%--	</c:forEach>--%>
<%--</table>--%>

<%--
  User: 문현동
  Date: 2024-09-12
  Time: 오전 9:31
  유저가 받은 모든 알림들을 보여주는 페이지.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>알림</title>
	<link rel="stylesheet" href="/css/template-style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
			<div>
				<c:choose>
					<%--팔로워들이 없을 때...--%>
					<c:when test="${empty userDTOList}">
						<div class="d-flex justify-content-center align-items-center mb-3">
							팔로워가 없습니다.
						</div>
					</c:when>
					<%--있을 때.--%>
					<c:otherwise>
						<table class="table table-hover table-bordered">
							<thead>
							<th>이미지</th>
							<th>이메일</th>
							<th>닉네임</th>
							<th>자기소개</th>
							</thead>
							<tbody>
							<c:forEach var="user" items="${userDTOList}">
								<tr>
									<td><img class="profile-img" src="/image/${user.profileImage}" alt=""></td>
									<td>${user.email}</td>
									<td>${user.nickname}</td>
									<td>${user.userIntroduce}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="mt-3 d-flex justify-content-center align-items-center">
			<a href="/my-page/info" class="btn btn-primary" type="button">돌아가기</a>
		</div>
	</main>
</div>
</body>
</html>