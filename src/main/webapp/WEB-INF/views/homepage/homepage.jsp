<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- JSP -->
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="ko">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>${userNickname}'s HomePage</title>
                <!-- 스타일시트 경로 설정 -->
                <link rel="stylesheet" href="/css/template-style.css">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous"></script>
                <!-- <style>
                /* 기본적인 레이아웃 스타일 */
                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                    background-color: #f4f4f4;
                    line-height: 1.6;
                }

                header {
                    background-color: black;
                    color: white;
                    text-align: center;
                    padding: 15px;
                    font-size: 22px;
                }

                nav {
                    float: left;
                    width: 18%;
                    background-color: #2c3e50;
                    padding: 20px;
                    height: 100vh;
                }

                nav button {
                    display: block;
                    width: 90%;
                    margin: 15px 0;
                    padding: 12px;
                    background-color: #34495e;
                    border: none;
                    cursor: pointer;
                    font-size: 16px;
                    color: white;
                    border-radius: 5px;
                }

                nav button:hover {
                    background-color: #1abc9c;
                }

                .main-content {
                    margin-left: 20%;
                    padding: 30px;
                    background-color: white;
                    min-height: 100vh;
                }

                .audio-player {
                    text-align: center;
                    margin-bottom: 25px;
                }

                .guestbook {
                    width: 100%;
                    border-collapse: collapse;
                }

                .guestbook th,
                .guestbook td {
                    border: 1px solid #ddd;
                    padding: 10px;
                    text-align: center;
                }

                .guestbook th {
                    background-color: #34495e;
                    color: white;
                }

                /* 모달 스타일 */
                .modal {
                    display: none;
                    position: fixed;
                    z-index: 1;
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    overflow: auto;
                    background-color: rgba(0, 0, 0, 0.5);
                    padding-top: 60px;
                }

                .modal-content {
                    background-color: #fefefe;
                    margin: 5% auto;
                    padding: 20px;
                    border: 1px solid #888;
                    width: 60%;
                    border-radius: 10px;
                }

                .close {
                    color: #aaa;
                    float: right;
                    font-size: 28px;
                    font-weight: bold;
                }

                .close:hover,
                .close:focus {
                    color: black;
                    text-decoration: none;
                    cursor: pointer;
                }

                button {
                    border-radius: 4px;
                    transition: all 0.3s ease;
                }

                button:hover {
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                }

                .audio-player {
                    text-align: center;
                    margin-bottom: 20px;
                }
            </style> -->

                <style>
                    /* 홈페이지 관련 스타일 태그 추가 */
                    .audio-player {
                        text-align: center;
                        align-content: center;
                        align-items: center;
                        margin: 30px;
                        margin-left: 200px;
                        width: 50px;
                        height: 50px;
                    }

                    .guestbook {
                        width: 100%;
                        border-collapse: collapse;
                    }

                    .guestbook th,
                    .guestbook td {
                        border: 1px solid #ddd;
                        padding: 10px;
                        text-align: center;
                    }

                    .guestbook th {
                        background-color: #34495e;
                        color: white;
                    }

                    /* 모달 스타일
                    .modal {
                        display: none;
                        position: fixed;
                        z-index: 1;
                        left: 0;
                        top: 0;
                        width: 100%;
                        height: 100%;
                        overflow: auto;
                        background-color: rgba(0, 0, 0, 0.5);
                        padding-top: 60px;
                    }
                    */

                    .modal-content {
                        background-color: #fefefe;
                        margin: 5% auto;
                        padding: 20px;
                        border: 1px solid #888;
                        width: 60%;
                        border-radius: 10px;
                    }

                    .close {
                        color: #aaa;
                        float: right;
                        font-size: 28px;
                        font-weight: bold;
                    }

                    .close:hover,
                    .close:focus {
                        color: black;
                        text-decoration: none;
                        cursor: pointer;
                    }

                    button {
                        border-radius: 4px;
                        transition: all 0.3s ease;
                    }

                    button:hover {
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                    }

                    .menu-icon svg:hover {
                        transform: scale(1.1);
                        /* 호버 시 확대 효과 */
                        background-color: #1abc9c;
                    }

                    .menu-icon button:hover {
                        transform: scale(1.1);
                        /* 호버 시 확대 효과 */
                        background-color: #1abc9c;
                    }

                    .menu-icon svg {
                        width: 100%;
                        height: 100%;
                        border-radius: 50%;
                        /* 동그랗게 만듦 */
                        cursor: pointer;
                        transition: transform 0.3s, background-color 0.3s;
                    }

                    .menu-icon button {
                        width: 100%;
                        height: 100%;
                        border-radius: 50%;
                        /* 동그랗게 만듦 */
                        cursor: pointer;
                        transition: transform 0.3s, background-color 0.3s;
                    }
                </style>

                <!-- 유저의 활성화된 테마가 있을 경우 그 테마를 적용 -->
                <c:if test="${activeTheme != null}">
                    <link rel="stylesheet" href="${activeTheme}">
                </c:if>
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
                            <a href="/baseleap/postlist" class="menu-icon" title="게시글 보기">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-list-columns-reverse" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                        d="M0 .5A.5.5 0 0 1 .5 0h2a.5.5 0 0 1 0 1h-2A.5.5 0 0 1 0 .5m4 0a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1h-10A.5.5 0 0 1 4 .5m-4 2A.5.5 0 0 1 .5 2h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m4 0a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m-4 2A.5.5 0 0 1 .5 4h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m4 0a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5m-4 2A.5.5 0 0 1 .5 6h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m4 0a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5m-4 2A.5.5 0 0 1 .5 8h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m4 0a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5m-4 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m4 0a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1h-10a.5.5 0 0 1-.5-.5m-4 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m4 0a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5m-4 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m4 0a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5" />
                                </svg></a>
                            <a href="http://localhost:8080/home/page?userId=${pageUserId}" class="menu-icon"
                                title="방명록 보기"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                    fill="currentColor" class="bi bi-journal-text" viewBox="0 0 16 16">
                                    <path
                                        d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5" />
                                    <path
                                        d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2" />
                                    <path
                                        d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z" />
                                </svg></a>
                            <a href="/baseleap/my-page/search" class="menu-icon" title="유저 검색"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-search" viewBox="0 0 16 16">
                                    <path
                                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                                </svg></a>
                        </div>

                        <!-- 유저 프로필 영역 -->
                        <div class="user-profile">
                            <a href="/baseleap/home/page?userId=${sessionScope.userId}">
                                <img src="${profileImgPath}" alt="Profile Picture" class="profile-picture">
                            </a>
                            <div class="user-info">
                                <h2>${userNickname}'s HomePage</h2>
                                <hr>
                                <p>${userIntroduce}</p>
                            </div>
                        </div>

                        <!-- 하단 메뉴 -->
                        <div class="menu-bottom">
                            <a href="#" class="menu-icon" title="게시글 쓰기"><svg xmlns="http://www.w3.org/2000/svg"
                                    width="16" height="16" fill="currentColor" class="bi bi-pencil-square"
                                    viewBox="0 0 16 16">
                                    <path
                                        d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                    <path fill-rule="evenodd"
                                        d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                                </svg></a>

                            <!-- 현재 로그인한 유저가 페이지 소유자인 경우 홈피 꾸미기 버튼이 보이도록 설정 -->
                            <c:if test="${loginUserId == pageUserId}">
                                <a class="menu-icon" id="openSettings"><svg xmlns="http://www.w3.org/2000/svg"
                                        width="16" height="16" fill="currentColor" class="bi bi-brush"
                                        viewBox="0 0 16 16">
                                        <path
                                            d="M15.825.12a.5.5 0 0 1 .132.584c-1.53 3.43-4.743 8.17-7.095 10.64a6.1 6.1 0 0 1-2.373 1.534c-.018.227-.06.538-.16.868-.201.659-.667 1.479-1.708 1.74a8.1 8.1 0 0 1-3.078.132 4 4 0 0 1-.562-.135 1.4 1.4 0 0 1-.466-.247.7.7 0 0 1-.204-.288.62.62 0 0 1 .004-.443c.095-.245.316-.38.461-.452.394-.197.625-.453.867-.826.095-.144.184-.297.287-.472l.117-.198c.151-.255.326-.54.546-.848.528-.739 1.201-.925 1.746-.896q.19.012.348.048c.062-.172.142-.38.238-.608.261-.619.658-1.419 1.187-2.069 2.176-2.67 6.18-6.206 9.117-8.104a.5.5 0 0 1 .596.04M4.705 11.912a1.2 1.2 0 0 0-.419-.1c-.246-.013-.573.05-.879.479-.197.275-.355.532-.5.777l-.105.177c-.106.181-.213.362-.32.528a3.4 3.4 0 0 1-.76.861c.69.112 1.736.111 2.657-.12.559-.139.843-.569.993-1.06a3 3 0 0 0 .126-.75zm1.44.026c.12-.04.277-.1.458-.183a5.1 5.1 0 0 0 1.535-1.1c1.9-1.996 4.412-5.57 6.052-8.631-2.59 1.927-5.566 4.66-7.302 6.792-.442.543-.795 1.243-1.042 1.826-.121.288-.214.54-.275.72v.001l.575.575zm-4.973 3.04.007-.005zm3.582-3.043.002.001h-.002z" />
                                    </svg></a>
                                <a href="/baseleap/my-page/info" class="menu-icon" title="페이지 설정"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-gear" viewBox="0 0 16 16">
                                        <path
                                            d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492M5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0" />
                                        <path
                                            d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115z" />
                                    </svg></a>
                            </c:if>
                            <!-- 로그인 유저가 페이지 소유자가 아닌 경우 '나의 한마디' 버튼이 보이도록 설정 -->
                            <c:if test="${loginUserId != pageUserId}">
                                <a class="menu-icon" id="openGuestBookForm"><svg xmlns="http://www.w3.org/2000/svg"
                                        width="16" height="16" fill="currentColor" class="bi bi-pen"
                                        viewBox="0 0 16 16">
                                        <path
                                            d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001m-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708z" />
                                    </svg></a>
                                <a href="#" class="menu-icon" title="페이지 설정"><svg xmlns="http://www.w3.org/2000/svg"
                                        width="16" height="16" fill="currentColor" class="bi bi-gear"
                                        viewBox="0 0 16 16">
                                        <path
                                            d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492M5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0" />
                                        <path
                                            d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115z" />
                                    </svg></a>
                            </c:if>


                        </div>
                    </aside>

                    <!-- 메인 콘텐츠 -->
                    <main class="content">
                        <div class="post-summary">
                            <!-- 게시글 요약 부분: 각 게시글의 제목, 카테고리, 날짜, 내용 요약이 표시됨 -->

                            <div class="audio-player">
                                <!-- 자동 재생 + 음소거된 오디오 플레이어 -->
                                <audio id="backgroundMusic" autoplay muted loop hidden>
                                    <source src="${musicPath}" type="audio/mpeg">
                                    Your browser does not support the audio element.
                                </audio>
                                <a onclick="unmute()">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
                                        class="bi bi-megaphone" viewBox="0 0 16 16">
                                        <path
                                            d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-.214c-2.162-1.241-4.49-1.843-6.912-2.083l.405 2.712A1 1 0 0 1 5.51 15.1h-.548a1 1 0 0 1-.916-.599l-1.85-3.49-.202-.003A2.014 2.014 0 0 1 0 9V7a2.02 2.02 0 0 1 1.992-2.013 75 75 0 0 0 2.483-.075c3.043-.154 6.148-.849 8.525-2.199zm1 0v11a.5.5 0 0 0 1 0v-11a.5.5 0 0 0-1 0m-1 1.35c-2.344 1.205-5.209 1.842-8 2.033v4.233q.27.015.537.036c2.568.189 5.093.744 7.463 1.993zm-9 6.215v-4.13a95 95 0 0 1-1.992.052A1.02 1.02 0 0 0 1 7v2c0 .55.448 1.002 1.006 1.009A61 61 0 0 1 4 10.065m-.657.975 1.609 3.037.01.024h.548l-.002-.014-.443-2.966a68 68 0 0 0-1.722-.082z" />
                                    </svg>
                                </a>
                            </div>

                            <br>
                            <hr>
                            <br>

                            <!-- 나머지 게시글들... -->
                            <h2>${userNickname}'s Guestbook
                                <a href="#" class="menu-icon" title="메시지보내기버튼" id="openMessageForm"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-envelope-at" viewBox="0 0 16 16">
                                        <path
                                            d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2zm3.708 6.208L1 11.105V5.383zM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2z" />
                                        <path
                                            d="M14.247 14.269c1.01 0 1.587-.857 1.587-2.025v-.21C15.834 10.43 14.64 9 12.52 9h-.035C10.42 9 9 10.36 9 12.432v.214C9 14.82 10.438 16 12.358 16h.044c.594 0 1.018-.074 1.237-.175v-.73c-.245.11-.673.18-1.18.18h-.044c-1.334 0-2.571-.788-2.571-2.655v-.157c0-1.657 1.058-2.724 2.64-2.724h.04c1.535 0 2.484 1.05 2.484 2.326v.118c0 .975-.324 1.39-.639 1.39-.232 0-.41-.148-.41-.42v-2.19h-.906v.569h-.03c-.084-.298-.368-.63-.954-.63-.778 0-1.259.555-1.259 1.4v.528c0 .892.49 1.434 1.26 1.434.471 0 .896-.227 1.014-.643h.043c.118.42.617.648 1.12.648m-2.453-1.588v-.227c0-.546.227-.791.573-.791.297 0 .572.192.572.708v.367c0 .573-.253.744-.564.744-.354 0-.581-.215-.581-.8Z" />
                                    </svg></a>
                            </h2>
                            <table class="guestbook">
                                <tr>
                                    <th>Username</th>
                                    <th>Message</th>
                                </tr>
                                <!-- 방명록 데이터를 반복하여 테이블에 출력 -->
                                <c:forEach var="un" items="${usernames}" varStatus="status">
                                    <tr>
                                        <td>${un}</td>
                                        <td>${comments[status.index]}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!-- 모달 1: 홈피 설정 -->
                        <div id="settingsModal" class="modal">
                            <div class="modal-content">
                                <span class="close" id="closeSettings">&times;</span>
                                <h2>홈피 설정 변경</h2>
                                <button id="musicRegisterBtn">음악 등록</button>
                                <button id="musicActivateBtn">음악 활성화</button>
                                <!-- <button id="themeChangeBtn">테마 색상 변경</button> -->
                            </div>
                        </div>

                        <!-- 모달 2: 음악 등록 -->
                        <div id="musicRegisterModal" class="modal">
                            <div class="modal-content">
                                <span class="close" id="closeMusicRegister">&times;</span>
                                <h2>음악 등록</h2>
                                <p>음악을 서버에 직접 등록하세요</p>
                                <form action="/music/register" method="post" enctype="multipart/form-data">
                                    <label for="musicName">음악 이름:</label>
                                    <input type="text" id="musicName" name="musicName" required>
                                    <br>
                                    <label for="musicFile">음악 파일:</label>
                                    <input type="file" id="musicFile" name="musicFile" accept=".mp3" required>
                                    <br><br>
                                    <button type="submit">등록</button>
                                </form>
                            </div>
                        </div>

                        <!-- 모달 3: 음악 활성화 -->
                        <div id="musicActivateModal" class="modal">
                            <div class="modal-content">
                                <span class="close" id="closeMusicActivate">&times;</span>
                                <h2>음악 활성화</h2>
                                <form action="/music/activate" method="post">
                                    <!-- 사용자의 음악 리스트를 반복하여 출력 -->
                                    <c:forEach var="music" items="${musicList}">
                                        <label>
                                            <!-- 활성화된 음악 선택 -->
                                            <input type="radio" name="selectedMusic" value="${music.name}"
                                                ${music.active ? 'checked' : '' }>
                                            ${fn:split(music.name,'_')[1]}
                                        </label>
                                        <br>
                                    </c:forEach>
                                    <button type="submit">확인</button>
                                </form>
                            </div>
                        </div>

                        <!-- 모달 4: 테마 색상 변경 -->
                        <div id="themeChangeModal" class="modal">
                            <div class="modal-content">
                                <span class="close" id="closeThemeChange">&times;</span>
                                <h2>테마 색상 변경</h2>
                                <p>여기에 테마 색상 변경 내용을 추가하세요.</p>
                            </div>
                        </div>

                        <!-- 모달 4: 게스트북 등록 -->
                        <div id="guestBookFormModal" class="modal">
                            <div class="modal-content">
                                <span class="close" id="closeGuestBookRegister">&times;</span>
                                <h2>내가 쓴 한마디</h2>
                                <!-- 방명록 등록 폼 -->
                                <form action="/guestbook/register" method="post">
                                    <input type="hidden" name="loginUserId" value="${loginUserId}">
                                    <input type="hidden" name="pageUserId" value="${pageUserId}">
                                    <textarea name="myComment" id="myComment" cols="30"
                                        rows="10">${myCommentWrote != null ? myCommentWrote.comment : ''}</textarea>
                                    <button type="submit"> 등록하기 </button>
                                </form>
                            </div>
                        </div>

                        <!-- 모달 5: 문현동 메시지 보내기 기능 일부 발췌 -->
                        <div class="modal" id="message-modal" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5">메세지 보내기</h1>
                                        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="닫기"></button> -->
                                        <span class="close">&times;</span>
                                    </div>
                                    <div class="modal-body">
                                        <form id="send-message-form" onsubmit="submitSendMessageForm(event)">
                                            <input type="hidden" class="receiver-id" value="${pageUserId}">
                                            <div class="mb-3">
                                                <label for="target-user" class="col-form-label">받는 사람:
                                                </label>
                                                <input type="text" class="form-control" id="target-user"
                                                    value="${userNickname}" readonly>
                                            </div>
                                            <div class="mb-3">
                                                <label for="message-text" class="col-form-label">메세지 내용:
                                                </label>
                                                <textarea class="form-control" id="message-text"></textarea>
                                            </div>
                                            <button form="send-message-form" type="submit"
                                                class="btn btn-primary">보내기</button>
                                            <button form="send-message-form" type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">취소</button>
                                        </form>
                                    </div>
                                    <!-- <div class="modal-footer">
                                        <button form="send-message-form" type="submit"
                                            class="btn btn-primary">보내기</button>
                                        <button form="send-message-form" type="button"
                                            class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                    </div> -->
                                </div>
                            </div>
                        </div>


                    </main>
                </div>




                <script>
                    // 내 홈피 꾸미기 버튼 추가
                    var openSettingBtn = document.getElementById('openSettings');
                    if (openSettingBtn) { // 버튼이 존재하는지 확인
                        openSettingBtn.addEventListener('click', function () {
                            document.getElementById('settingsModal').style.display = 'block';
                        });
                    }


                    // 음악 등록 모달 열기
                    var musicRegisterBtn = document.getElementById('musicRegisterBtn');
                    if (musicRegisterBtn) { // 버튼이 존재하는지 확인
                        musicRegisterBtn.addEventListener('click', function () {
                            document.getElementById('musicRegisterModal').style.display = 'block';
                        });
                    }

                    // 음악 활성화 모달 열기
                    var musicActivateBtn = document.getElementById('musicActivateBtn');
                    if (musicActivateBtn) { // 버튼이 존재하는지 확인
                        musicActivateBtn.addEventListener('click', function () {
                            document.getElementById('musicActivateModal').style.display = 'block';
                        });
                    }

                    // 테마 변경 모달 열기
                    var themeChangeBtn = document.getElementById('themeChangeBtn');
                    if (themeChangeBtn) { // 버튼이 존재하는지 확인
                        themeChangeBtn.addEventListener('click', function () {
                            document.getElementById('themeChangeModal').style.display = 'block';
                        });
                    }

                    // 방명록 폼 열기
                    var guestBookFormBtn = document.getElementById('openGuestBookForm');
                    if (guestBookFormBtn) { // 버튼이 존재하는지 확인
                        guestBookFormBtn.addEventListener('click', function () {
                            document.getElementById('guestBookFormModal').style.display = 'block';
                        });
                    }

                    // 모달 닫기 버튼
                    var closeButtons = document.querySelectorAll('.modal .close');
                    closeButtons.forEach(function (button) {
                        button.addEventListener('click', function () {
                            button.closest('.modal').style.display = 'none';
                        });
                    });

                    // 각 폼이 독립적으로 작동하게 설정
                    var guestBookForm = document.querySelector('#guestBookFormModal form');
                    if (guestBookForm) {
                        guestBookForm.addEventListener('submit', function (event) {
                            event.preventDefault(); // 기본 제출 방지
                            console.log("방명록 제출");
                            this.submit(); // 원하는 폼만 제출
                        });
                    }

                    var musicRegisterForm = document.querySelector('#musicRegisterModal form');
                    if (musicRegisterForm) {
                        musicRegisterForm.addEventListener('submit', function (event) {
                            event.preventDefault(); // 기본 제출 방지
                            console.log("음악 등록 제출");
                            this.submit(); // 원하는 폼만 제출
                        });
                    }

                    var musicActivateForm = document.querySelector('#musicActivateModal form');
                    if (musicActivateForm) {
                        musicActivateForm.addEventListener('submit', function (event) {
                            event.preventDefault(); // 기본 제출 방지
                            console.log("음악 활성화 제출");
                            this.submit(); // 원하는 폼만 제출
                        });
                    }

                    function unmute() {
                        const player = document.getElementById("backgroundMusic");

                        player.muted = !player.muted;

                        player.play();
                    }

                    //모달 5 메시지 보내기 모달 활성화 버튼추가 
                    var messageFormBtn = document.getElementById('openMessageForm');
                    if (messageFormBtn) { // 버튼이 존재하는지 확인
                        messageFormBtn.addEventListener('click', function () {
                            document.getElementById('message-modal').style.display = 'block';
                        });
                    }

                </script>

                <script type="application/javascript" src="/js/follow.js"></script>
                <script type="application/javascript" src="/js/message.js"></script>

            </body>

            </html>