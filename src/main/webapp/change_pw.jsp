<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.6.0.min.js"></script>
    <title>PLAY TTT!</title>
</head>
<body>

    <!-- 공통::팝업 -->
    <div class="popup-contents guide-contents fixed popup-down">
        <div class="popup-inner guide-inner bounce-out">
            <input type="button" value="×" id="close-btn" class="close-btn transition-fade">
            <div class="guide-slide">
                <button class="guide-nav guide-prev">
                    <img src="images/icon-prev.svg" alt="이전">
                </button>
                <div class="guide-slide-inner">
                    <div class="guide-inner1">
                        <div class="guide-inner-img flex-box item-center just-center">
                            <img src="images/frame/guide-1.png" alt="가이드1" class="center">
                        </div>
                        <p>플레이! 틱택토는 실시간 통신으로 진행 됩니다.</p>
                    </div>
                    <div class="guide-inner2">
                        <div class="guide-inner-img flex-box item-center just-center">
                            <img src="images/frame/guide-2.png" alt="가이드2" class="center">
                        </div>
                        <p>로그인에 성공하면 게임에 참여 하거나 직접 방을 만들 수 있습니다.</p>
                    </div>
                    <div class="guide-inner3">
                        <div class="guide-inner-img flex-box item-center just-center">
                            <img src="images/frame/guide-3.png" alt="가이드3" class="center">
                        </div>
                        <p>O가 선공, X는 후공입니다. 번갈아가며 칸을 채워주세요.</p>
                    </div>
                    <div class="guide-inner4">
                        <div class="guide-inner-img flex-box item-center just-center">
                            <img src="images/frame/guide-4.png" alt="가이드4" class="center">
                        </div>
                        <p>먼저 가로, 세로, 대각선 3칸을 채우는 플레이어가 우승합니다.</p>
                    </div>
                    <div class="guide-inner5">
                        <div class="guide-inner-img flex-box item-center just-center">
                            <img src="images/frame/guide-5.png" alt="가이드5" class="center">
                        </div>
                        <p>승률을 올려 랭킹에 도전해보세요!</p>
                    </div>
                </div>
                <button class="guide-nav guide-next">
                    <img src="images/icon-next.svg" alt="다음">
                </button>
            </div>
        </div>
    </div>
    <!-- 공통::가이드버튼 -->
    <div class="guide-wrap">
        <button type="button" class="guide-btn" id="guideBtn">?</button>
    </div>

    <!-- 변경 완료 팝업 -->
    <div class="popup-contents changepw-contents common-popup fixed">
        <div class="popup-inner flex-just-center center">
            <p>비밀번호 변경이 완료 되었습니다.<br>
                변경 된 비밀번호로 로그인해주세요.</p>
            <input type="button" value="로그인 페이지로" id="changepw-sucess-btn" class="btn btn-primary" onclick="location.href='/login'">
        </div>
    </div>

    <section id="changePW" class="form-bg">
        <div class="header">
            <h1>
                <a href="/">
                    <img src="images/main-logo.png" alt="메인로고">
                </a>
            </h1>
        </div>
        <div class="inner form-wrap">
            <div class="form-box">
                <div class="input-box">
                    <div class="input-label">
                        <label for="addPW">비밀번호</label>
                    </div>
                    <div class="input-wrap flex-box item-center just-between">
                        <input type="password" placeholder="문자종류 상관없이 최대 10자리." id="addPW" maxlength="10">
                        <img src="images/icon-pw.svg" alt="비밀번호" class="icon">
                    </div>
                    <div class="input-label">
                        <label for="addPWcheck">비밀번호 확인</label>
                    </div>
                    <div class="input-wrap flex-box item-center just-between">
                        <input type="password" placeholder="비밀번호 확인" id="addPWcheck" maxlength="10">
                        <img src="images/icon-pw.svg" alt="비밀번호 확인" class="icon">
                    </div>
                    <div class="error-message" id="checkPwError">
                        <p ></p>
                    </div>
                </div>
            </div>
            <div class="form-box">
                <input type="submit" value="확인" id="submitPW" class="btn btn-light">
            </div>
        </div>
    </section>
    
    <!-- 공통::js -->
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="js/common.js"></script>
    <script src="js/page/change_pw.js" type="module"></script>
</body>
</html>