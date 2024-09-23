<%--
  User: 문현동
  Date: 2024-09-13
  Time: 오후 2:36
  새로운 메세지를 확인하는 페이지.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>새로운 메세지</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
			<a href="#" class="menu-icon" title="유저 검색"><img src="search-icon.png" alt="유저 검색"></a>
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
			<c:choose>
				<%--새 메세지가 없을 때...--%>
				<c:when test="${empty messageUserDTOList}">
					<div class="d-flex justify-content-center align-items-center">
						아직 새로운 메세지가 없습니다.
					</div>
				</c:when>
				<%--있을 때.--%>
				<c:otherwise>
					<table class="mb-0 table table-hover table-bordered">
						<thead>
							<th>보낸 사람</th>
							<th>내용</th>
							<th>보낸 일시</th>
							<th>확인</th>
						</thead>
						<tbody>
						<c:forEach var="messageUserDTO" items="${messageUserDTOList}">
							<tr>
								<td><img class="profile-img" src="/image/${messageUserDTO.profileImage}" alt=""> ${messageUserDTO.nickname}</td>
								<td>${messageUserDTO.content}</td>
								<td>${messageUserDTO.createdAt}</td>
								<td>
									<form action="${pageContext.request.contextPath}/message/read" method="post">
										<input type="hidden" name="messageId" value="${messageUserDTO.id}">
										<button class="btn btn-primary" type="submit">확인</button>
									</form>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="mt-3 d-flex justify-content-center align-items-center">
			<a href="/my-page/info" class="btn btn-primary" type="button">돌아가기</a>
		</div>
	</main>
</div>
</body>
</html>