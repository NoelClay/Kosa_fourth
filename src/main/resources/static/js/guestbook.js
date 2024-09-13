    // Function to open a modal
    // Get the modal
    let modal = document.getElementById("modal");
    let themeModal = document.getElementById("theme-modal");

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
            modal.style.display = "block";
            document.getElementById("modalText").innerText = "글쓰기 기능이 여기에 표시됩니다.";
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

    function hideModalElements() {
        console.log("모달창 꺼");
        let children = modal.children;
        for (let i = 0; i < children.length; i++) {
            children[i].style.display = "none";  // 자식 요소 숨기기
        }
        modal.style.display = "none";  // 모달 숨기기
    }

    function showModalElements(contentType) {
        console.log("쇼모달 출력")
        let children = modal.children;

        //함 더 호출
        hideModalElements()

        //필수적으로 켜줘야 하는 애들 켜줘
        document.getElementById("modal-content").style.display = "block";
        span.style.display = "block";

        // contentType에 따라 특정 자식 요소를 보여줍니다.
        switch (contentType) {
            case 'theme':
                console.log("테마이벤트온")
                document.getElementById("theme-modal").style.display = "block";
                document.getElementById("modalText").innerText = "테마 변경!";
                break;
            case 'music':
                document.getElementById("music-modal").style.display = "block";
                document.getElementById("modalText").innerText = "배경음악 설정!";
                break;
            // 필요한 경우 추가 케이스를 추가할 수 있습니다.
            default:
                console.warn("Unknown content type: " + contentType);
                break;
        }

        // 모달 자체를 보여줍니다.
        modal.style.display = "block";
    }