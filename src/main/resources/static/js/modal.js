

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




