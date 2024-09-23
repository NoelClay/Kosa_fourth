<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2024-09-11
  Time: 오후 2:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Intro</title>
	<!-- Bootstrap CSS CDN 추가 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- 사용자 정의 CSS -->
	
	<!-- 사용자 정의 JavaScript -->
	<script src="/js/modal.js"></script>
	
	<!-- jQuery, Popper.js, Bootstrap JS CDN 추가 -->
	<script
			src="https://code.jquery.com/jquery-3.7.1.js"
			integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
			crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container text-center mt-5">
	<h1>Welcome to the Website</h1>
	<button id="startButton" class="btn btn-primary mt-3">시작하기</button>
</div>
<!-- 모달 창 -->
<div id="modal" class="modal" tabindex="-1" role="dialog" style="display: none;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">회원 관리</h5>
				<button type="button" class="close" aria-label="Close">
					<span aria-hidden="true" data-dismiss="modal">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#login" role="tab">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#signup" role="tab">회원가입</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#reset" role="tab">비밀번호 찾기</a>
					</li>
				</ul>
				
				<!-- 탭 콘텐츠 -->
				<div class="tab-content">
					<div id="login" class="tab-pane fade show active" role="tabpanel">
						<h3 class="mt-3">로그인</h3>
						<form id="login-form" action="/loginMain/login" method="post" class="mt-4">
							<div class="form-group">
								<label>이메일(아이디):
									<input type="email" class="form-control" id="loginemail" name="email" required>
								</label>
							</div>
							<div class="form-group">
								<label >비밀번호:
									<input type="password" class="form-control" id="loginpassword" name="password" required
									placeholder="영문 + 특수문자 + 숫자 포함 최소 8자리"
									pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$">
								</label>
							</div>
							<button type="submit" id="loginBtn" class="btn btn-primary btn-block">로그인</button>
						</form>
					</div>
					
					
					<div id="signup" class="tab-pane fade" role="tabpanel">
						<h3 class="mt-3">회원가입</h3>
						<form id="signup-form" action="/signup/signup" method="post" class="mt-4">
							<div class="form-group">
								<label for="email">이메일(아이디):</label>
								<input type="email" class="form-control" id="email" name="email" required placeholder="email@address.com">
							</div>
							<div class="form-group">
								<label for="password">비밀번호:</label>
								<input type="password" class="form-control" id="password" name="password" required placeholder="영문 + 특수문자 + 숫자 포함 최소 8자리"
								       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
								       title="영문 + 특수문자 + 숫자 포함 최소 8자리">
							</div>
							<div class="form-group">
								<label for="password2">비밀번호 확인:</label>
								<input type="password" class="form-control" id="password2" name="password2" required placeholder="비밀번호 확인"
								       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$">
							</div>
							<div class="form-group">
								<label for="nickName">닉네임:</label>
								<input type="text" class="form-control" id="nickName" name="nickName" required minlength="3" maxlength="100">
							</div>
							<div class="form-group">
								<label id ="profileImage">프로필 케릭터:
									<input type="radio" class="btn-check"  name="profileImage" value="cupid.png" checked><img src=/image/cupid.png  width = 50>
									<input type="radio" class="btn-check" name="profileImage" value="groceries.png"><img src=/image/groceries.png width = 50>
									<input type="radio" class="btn-check" name="profileImage" value="sculpture.png"><img src=/image/sculpture.png width = 50>
								</label>
							</div>
							<div class="form-group">
								<label for="userIntroduce">간단한 소개:</label>
								<input type="text" class="form-control" id="userIntroduce" name="userIntroduce" >
							</div>
							<div class="form-group">
								<label for="validationQuizQuestion">질문:</label>
								<select class="form-control" id="validationQuizQuestion" name="validationQuizQuestion">
									<option value='1'>졸업한 초등학교</option>
									<option value='2'>가장 좋아하는 영화</option>
									<option value='3'>가장 싫어하는 음식</option>
								</select>
							</div>
							<div class="form-group">
								<label for="validationQuizAnswer">답변:</label>
								<input type="text" class="form-control" id="validationQuizAnswer" name="validationQuizAnswer" required >
							</div>
							<button type="submit" class="btn btn-primary btn-block" id="signupButton">회원가입</button>
						</form>
					</div>
					
					
                        <div id="reset" class="tab-pane fade" role="tabpanel">
                            <h3 class="mt-3">비밀번호 찾기</h3>
                            <form id="reset-form" action="/find/passwordFind" method="post" class="mt-4">
                                <div class="form-group">
                                    <label>이메일:
                                    <input type="email" id="findEmail" class="form-control" name="email" required>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label>질문:
                                    <select class="form-control" id="findValidationQuizQuestion" name="validationQuizQuestion">
                                        <option value='1'>졸업한 초등학교</option>
                                        <option value='2'>가장 좋아하는 영화</option>
                                        <option value='3'>가장 싫어하는 음식</option>
                                    </select>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label>답변:
                                    <input type="text" class="form-control" id="findValidationQuizAnswer" name="validationQuizAnswer" required>
                                    </label>
                                </div>
                                <button type="submit" id="resetButton" class="btn btn-primary btn-block">비밀번호 찾기</button>
                            </form>

                            <!-- 새 비밀번호 설정 폼 (처음에는 숨겨져 있음) -->
                            <form id="password-reset-form" style="display: none;" class="mt-4">
                                <div class="form-group">
                                    <label>이메일:
                                    <input type="email" id="email-for-reset" class="form-control" readonly>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label>새 비밀번호:
                                    <input type="password" id="new-password" class="form-control" required
                               		    placeholder="영문 + 특수문자 + 숫자 포함 최소 8자리"
                               		    pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$">
                                    </label>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">새 비밀번호 설정</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>


</body>
<script src="/js/modal.js"></script>
<script>

</script>
</html>
