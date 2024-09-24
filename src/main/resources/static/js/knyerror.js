// 대체 이미지의 경로 설정
var defaultImageSrc = "../image/avatar.png"; // 실제 대체 이미지 경로로 변경하세요

// // 모든 이미지에 이벤트 핸들러 추가
// window.addEventListener('load', function() {
//     var images = document.getElementsByTagName('img');
//     for (var i = 0; i < images.length; i++) {
//         // 이미지 요소를 콘솔에 출력 (디버깅용)
//         console.log(images[i]);

//         images[i].onerror = function(event) {
//             console.log(123123);
//             event.currentTarget.onerror = null; // 무한 루프 방지
//             event.currentTarget.src = defaultImageSrc;
//             // 대체된 이미지의 경로를 콘솔에 출력
//             console.log(event.currentTarget.src);
//         };
//     }
// });

// function handleImageError(event) {
//     var img = event.currentTarget;
//     img.onerror = null; // 무한 루프 방지
//     img.src = defaultImageSrc;
// }

window.addEventListener('load', function() {
    var images = document.getElementsByTagName('img');
    for (var i = 0; i < images.length; i++) {
        images[i].onerror = handleImageError;
        // images[i].src = images[i].getAttribute('data-src');
    }
});

function handleImageError(event) {
    var img = event.currentTarget;
    img.onerror = null; // 무한 루프 방지
    img.src = defaultImageSrc;
}