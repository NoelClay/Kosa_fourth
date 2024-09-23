function submitSendMessageForm(event) {
    event.preventDefault();
    const form = event.currentTarget;
    const receiverId = form.querySelector(".receiver-id");
    const content = form.querySelector("textarea");
    fetch("/baseleap/message/send-message", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            receiverId: receiverId.value,
            content: content.value,
        }),
    }).then((response) => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error("전송 실패...");
        }
    }).then(result => {
        console.log(result);
        alert(result.message);
        content.value = "";
        const modal = document.querySelector(".modal.show");
        if (modal) {
            const modalInstance = bootstrap.Modal.getInstance(modal);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
    }).catch(error => {
        console.error(error);
    });
}