function getAlarmsList() {
    fetch("/alarm/get-list", {
        method: "GET",
        headers: {
            "Content-Type": "application/json",
        },
    }).then((response) => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error("읽음 처리 실패...");
        }
    }).then(result => {
        const empty = document.querySelector("#empty");
        const notEmpty = document.querySelector("#not-empty");
        const notEmptyTbody = document.querySelector("#not-empty-tbody");
        const alarmList = result.data;

        // 데이터를 가져온 결과,
        if (alarmList.length === 0) { // 리스트가 비어있다면 ...
            notEmpty.classList.add("d-none");
            empty.classList.remove("d-none");
        } else { // 결과가 있다면?
            notEmpty.classList.remove("d-none");
            empty.classList.add("d-none");

            // 리스트를 갱신하기 위하여 기존에 있던 리스트를 삭제하고 다시 만들어줌.
            if (notEmptyTbody.hasChildNodes()) {
                notEmptyTbody.replaceChildren();
            }

            for (const [index, alarm] of alarmList.entries()) {
                // tr, td 생성.
                const alarmTableRow = document.createElement("tr");
                const alarmTableDataImg = document.createElement("td");
                const alarmTableDataContent = document.createElement("td");
                const alarmTableDataForm = document.createElement("td");

                // td 첫 번째 칸 정의.
                const profileImg = document.createElement("img");
                profileImg.classList.add("profile-img");
                profileImg.src = `/image/${alarm.userProfileImage}`;
                alarmTableDataImg.appendChild(profileImg);
                alarmTableDataImg.textContent = ` ${alarm.userNickname}`;

                // td 두 번째 칸 정의.
                alarmTableDataContent.textContent = ` ${alarm.alarmContent}`;

                // td 세 번째 칸 정의.
                const alarmReadForm = document.createElement("form");
                const alarmReadFormInput = document.createElement("input");
                const alarmReadFormButton = document.createElement("button");

                alarmReadFormInput.type = "hidden";
                alarmReadFormInput.name = "alarmId";
                alarmReadFormInput.value = `${alarm.alarmId}`;

                alarmReadFormButton.type = "submit";
                alarmReadFormButton.textContent = "확인";
                alarmReadFormButton.classList.add("btn");
                alarmReadFormButton.classList.add("btn-primary");

                alarmReadForm.id = `alarm-read-form-${index}`;
                alarmReadForm.addEventListener("submit", (event) => {
                    event.preventDefault();
                    alarmRead(alarmReadFormInput);
                });
                alarmReadForm.appendChild(alarmReadFormInput);
                alarmReadForm.appendChild(alarmReadFormButton);

                alarmTableDataForm.appendChild(alarmReadForm);

                // tr에 td 1, 2, 3 추가.
                alarmTableRow.appendChild(alarmTableDataImg);
                alarmTableRow.appendChild(alarmTableDataContent);
                alarmTableRow.appendChild(alarmTableDataForm);

                // 테이블에 tr 추가.
                notEmptyTbody.appendChild(alarmTableRow);
            }
        }
    }).catch(error => {
        console.error(error);
    });
}


function alarmRead(input) {
    fetch("/alarm/read", {
        method: "DELETE",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            alarmId: input.value,
        }),
    }).then((response) => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error("읽음 처리 실패...");
        }
    }).then(result => {
        getAlarmsList()
        // console.log(result);
    }).catch(error => {
        console.error(error);
    });
}


window.onload = function () {
    getAlarmsList();
}