function submitFollowingForm(event) {
    event.preventDefault();
    const form = event.currentTarget;
    const input = form.querySelector("input");
    const button = form.querySelector("button");
    following(input, button);
    form.onsubmit = submitUnfollowForm;
}


function submitUnfollowForm(event) {
    event.preventDefault();
    const form = event.currentTarget;
    const input = form.querySelector("input");
    const button = form.querySelector("button");
    unfollow(input, button);
    form.onsubmit = submitFollowingForm;
}


function following(input, button) {
    fetch("/my-page/following", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            targetId: input.value,
        }),
    }).then((response) => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error("팔로잉 실패...");
        }
    }).then(result => {
        console.log(result);
        button.textContent = "언팔로우";
    }).catch(error => {
        console.error(error);
    });
}


function unfollow(input, button) {
    fetch("/my-page/unfollow", {
        method: "DELETE",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            targetId: input.value,
        }),
    }).then((response) => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error("언팔로우 실패...");
        }
    }).then(result => {
        console.log(result);
        button.textContent = "팔로잉";
    }).catch(error => {
        console.error(error);
    });
}