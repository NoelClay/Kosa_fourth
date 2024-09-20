

document.addEventListener('DOMContentLoaded', function () {
    // 모달 초기화
      $('#modal').modal({
        show: false // 모달 초기 상태를 숨김으로 설정
      });

    // 요소를 선택하는 함수
    function select(id) {
        return document.getElementById(id);
    }

    // 모달 표시 및 숨기기
    const startButton = select('startButton'); // 시작 버튼
    const modal = $('#modal'); // jQuery를 사용해 모달 요소 선택

    if (startButton) {
        startButton.addEventListener('click', function () {
            modal.modal('show'); // 모달 표시
        });
    }

    const closeButton = select('close'); // 모달 닫기 버튼
    if (closeButton) {
        closeButton.addEventListener('click', function () {
            modal.modal('hide'); // 모달 숨기기
        });
    }

    // 탭 기능 구현
    const tablinks = document.querySelectorAll('.tab a'); // 탭 링크 선택
    tablinks.forEach(function (link) {
        link.addEventListener('click', function (event) {
            event.preventDefault(); // 기본 링크 동작 방지
            const tabcontent = document.querySelectorAll('.tabcontent'); // 탭 콘텐츠 선택
            tabcontent.forEach(function (tab) {
                tab.style.display = 'none'; // 모든 탭 콘텐츠 숨기기
            });
            const href = link.getAttribute('href'); // 클릭한 탭의 href 값
            document.querySelector(href).style.display = 'block'; // 클릭한 탭의 콘텐츠만 표시
        });
    });
    if (tablinks.length > 0) {
        tablinks[0].click(); // 첫 번째 탭을 기본 활성화 상태로 설정
    }
});

// 로그인
//document.ready(function(){
//      $('#login-btn').click(function(event){
//        event.preventDefault();
//        console.log("로그인 버튼 클릭");
//        const email = $('#loginemail').val();
//        const password = $('#loginpassword').val();
//        const data = {
//          email,
//          password
//        };
//
//        console.log("로그인 fetch 바로 전");
//
//        fetch('/loginMain/login', {
//          method: 'POST',
//          headers: {
//            'Content-Type': 'application/json'
//          },
//          body: JSON.stringify(data)
//        })
//        .then(response => response.json())
//        .then(data => {
//          if (data.success){
//            alert('로그인 성공!');
//            // 로그인 성공 후 처리 (예: 메인 페이지 이동)
//            window.location.href = '/main';
//          } else {
//            alert('로그인 실패: ' + data.message);
//          }
//        })
//        .catch(error => {
//          alert('로그인 중 오류 발생');
//          console.error(error);
//        });
//      });
//    });

//// 회원 가입
//$(document).ready(function() {
//  console.log("회원 가입 시작");
//  // 회원가입 버튼 클릭 이벤트
//  $('#signupButton').click(function(event) {
//    event.preventDefault(); // 기본 submit 행동 방지
//
//    // 입력한? 회원가입 정보 가져오기
//    const email = $('#signup-form #email').val();
//    const password = $('#signup-form #password').val();
//    const password2 = $('#signup-form #password2').val();
//    const nickName = $('#signup-form #nickName').val();
//    const profileImage = $('input[name="profileImage"]:checked').val();
//    const userIntroduce = $('#signup-form #userIntroduce').val();
//    const validationQuizQuestion = $('#signup-form #validationQuizQuestion').val();
//    const validationQuizAnswer = $('#signup-form #validationQuizAnswer').val();
//
//    // 유효성 검사 (예시: 이메일 형식 검사)
//    if (!validateEmail(email)) {
//      alert('이메일 형식이 올바르지 않습니다.');
//      return;
//    }
//
//    // 비밀번호 일치 검사
//    if (password !== password2) {
//      alert('비밀번호가 일치하지 않습니다.');
//      return;
//    }
//    console.log("Ajax data바로 전");
//    // Ajax 요청 데이터 구성 data 에 입력한 정보 넣어서?
//    const data = {
//      email,
//      password,
//      nickName,
//      profileImage,
//      userIntroduce,
//      validationQuizQuestion,
//      validationQuizAnswer
//    };
//
//    console.log("Ajax 요청 바로 전");
//    // Ajax 요청
//    $.ajax({
//      url: '/signup/signup', // 서버 컨트롤러 URL
//      type: 'POST',
//      contentType: 'application/json; charset=utf-8',
//      dataType: 'json',
//      data: JSON.stringify(data),  // 위에 data stringify 에 담아서?
//      success: function(response) {
//      console.log("Ajax if 들어가기 바로 전");
//        // 회원가입 성공 시 처리
//        if (response.success) {
//          alert('회원가입 성공!');
//          // 회원가입 후 처리 (메인 페이지 이동 등)
//        } else {
//        console.log("Ajax else");
//          alert('회원가입 실패: ' + response.message);
//        }
//      },
//      error: function(xhr, status, error) {
//        console.error('Error:', error);
//        alert('회원가입 중 오류가 발생했습니다.');
//      }
//    });
//  });

//  // 이메일 유효성 검사 함수 (예시)
//  function validateEmail(email) {
//    const re = /^(([^<>()[\\]\\\\.,;:\s@"]+(\.[^<>()[\\]\\\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
//    return re.test(String(email).toLowerCase());
//  }

//});


//// 비밀번호 찾기
//$(document).ready(function() {
//    $('#reset-form').click(function() {
//     console.log("로그인 버튼 클릭");
//    const email = $('#reset-form #email').val();
//    const validationQuizQuestion = $('#reset-form #validationQuizQuestion').val();
//    const validationQuizAnswer = $('#reset-form #validationQuizAnswer').val();
//    const data = {
//      email,
//      validationQuizQuestion,
//      validationQuizAnswer
//    };
//    console.log("로그인 ajax 바로 전");
//        $.ajax({
//            url: '/find/passwordFind', // 서버의 로그인 처리 API 엔드포인트
//            type: 'POST',
//            data: JSON.stringify(data),
//            contentType: 'application/json charset=utf-8',
//            success: function(response) {
//                if (response.success) {
//                    alert('비밀번호 찾기 성공!');
//                    // 로그인 성공 후 처리 (예: 메인 페이지 이동)
//                    window.location.href = '/find/passwordFindResult';
//                } else {
//                    alert('로그인 실패: ' + response.message);
//                }
//            },
//            error: function(xhr, status, error) {
//                console.error('Error:', error);
//                alert('로그인 중 오류 발생');
//            }
//        });
//    });
//});