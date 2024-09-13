    // Function to open a modal
    // Get the modal
    let modal = document.getElementById("modal");
    let themeModal = document.getElementById("theme-modal");
    let noteCommentModal = document.getElementById("comment-modal");

    // Get the <span> element that closes the modal
    let span = document.getElementById("close");

    // Buttons that trigger the modal
    let writeButton = document.getElementById("writeButton");
    let themeButton = document.getElementById("themeButton");
    let musicButton = document.getElementById("musicButton");

    //theme 변경 관련 버튼
    let applyThemeButton = document.getElementById("applyThemeButton");


    // When the user clicks a button, open the modal and set content
    if (writeButton) {
        writeButton.onclick = function() {
            showModalElements('comment');
        }

    }

    //theme관련 변수 받아오기
    let itemColor1 = document.getElementById("itemColor1");
    let itemColor2 = document.getElementById("itemColor2");
    let itemColor3 = document.getElementById("itemColor3");
    let fontColor1 = document.getElementById("fontColor1");
    let fontColor2 = document.getElementById("fontColor2");
    if (themeButton) {
        themeButton.onclick = function(){
            showModalElements('theme');
        }
        // Get color input elements

        //칼라 실시간 적용
        itemColor1.oninput = updateTheme;
        itemColor2.oninput = updateTheme;
        itemColor3.oninput = updateTheme;
        fontColor1.oninput = updateTheme;
        fontColor2.oninput = updateTheme;

        applyThemeButton.onclick = function() {
            updateTheme();
            hideModalElements();
        }
    }
    function updateTheme() {
        document.documentElement.style.setProperty('--item-color-1', itemColor1.value);
        document.documentElement.style.setProperty('--item-color-2', itemColor2.value);
        document.documentElement.style.setProperty('--item-color-3', itemColor3.value);
        document.documentElement.style.setProperty('--font-color-1', fontColor1.value);
        document.documentElement.style.setProperty('--font-color-2', fontColor2.value);
    }


    // if (musicButton) {
    //     musicButton.onclick = function() {
    //         modal.style.display = "block";
    //         document.getElementById("modalText").innerText = "배경음악 설정 기능이 여기에 표시됩니다.";
    //     }
    // }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
    // modal.get.style.display = "none";
    hideModalElements()
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            //modal.style.display = "none";
            hideModalElements()
        }
    }
// Hide all child elements of modal-content
function hideModalElements() {
    console.log("모달창 끄기");
    let modalContent = document.getElementById("modal-content");
    let children = modalContent.children;
    for (let i = 0; i < children.length; i++) {
        children[i].style.display = "none";  // Hide all child elements
    }
    modal.style.display = "none";  // Hide the modal itself
}

// Show specific child elements based on contentType
function showModalElements(contentType) {
    console.log("모달창 열기");
    
    // First, hide all elements
    hideModalElements();

    // Ensure modal content and close button are always visible
    document.getElementById("modal-content").style.display = "block";
    span.style.display = "block"; // Assuming 'span' is your close button

    // Show specific content based on contentType
    switch (contentType) {
        case 'theme':
            console.log("테마 변경 모달 열기");
            document.getElementById("theme-modal").style.display = "block";
            document.getElementById("modalText").innerText = "테마 변경!";
            break;
        case 'music':
            console.log("배경음악 설정 모달 열기");
            document.getElementById("music-modal").style.display = "block";
            document.getElementById("modalText").innerText = "배경음악 설정!";
            break;
        case 'comment':
            console.log("방명록 등록 모달 열기");
            document.getElementById("comment-modal").style.display = "block";
            document.getElementById("modalText").innerText = "방명록 등록!";
            break;
        default:
            console.warn("알 수 없는 콘텐츠 유형: " + contentType);
            break;
    }

    // Finally, show the modal
    modal.style.display = "block";
}