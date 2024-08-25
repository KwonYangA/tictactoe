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
    <%--<script>
        window.onpageshow = function (event) {
            if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
                // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
                // 이벤트 추가하는 곳
                gameExit()
                console.log('back button event');
            }
        };
    </script>--%>
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

    <!-- 승리 팝업 -->
    <div class="popup-contents result-contnts winner-contents common-popup fixed popup-down">
        <div class="popup-inner flex-just-center center">
            <div class="result-title">이겼습니다!</div>
            <div class="result-sub">멋진 승부였어요.</div>
            <div class="result-score">
                <span class="result-score-title">당신의 현재 전적</span>
                <span class="result-user-score">0승 0패 0무</span>
            </div>
            <input type="button" value="퇴장하기" class="btn btn-primary exit-btn">
        </div>
    </div>

    <%--<!-- 패배 팝업 -->
    <div class="popup-contents result-contnts loser-contents common-popup fixed popup-down">
        <div class="popup-inner flex-just-center center">
            <div class="result-title">패배했습니다.</div>
            <div class="result-sub">멋진 승부였어요.</div>
            <div class="result-score">
                <span class="result-score-title">당신의 현재 전적</span>
                <span class="result-user-score">0승 0패 0무</span>
            </div>
            <input type="button" value="퇴장하기" class="btn btn-primary">
        </div>
    </div>

    <!-- 무승부 팝업 -->
    <div class="popup-contents result-contnts draw-contents common-popup fixed popup-down">
        <div class="popup-inner flex-just-center center">
            <div class="result-title">비겼습니다.</div>
            <div class="result-sub">멋진 승부였어요.</div>
            <div class="result-score">
                <span class="result-score-title">당신의 현재 전적</span>
                <span class="result-user-score">0승 0패 0무</span>
            </div>
            <input type="button" value="퇴장하기" class="btn btn-primary" onclick="history.go(-1)">
        </div>
    </div>--%>

    <section id="game" class="section">
        <div class="header" >
            <h1>
                <a href="/">
                    <img src="images/main-logo.png" alt="메인로고">
                </a>
            </h1>
        </div>
        <div class="inner">
            <div class="player-box-wrap">
                <!-- 
                    turn-active : 현재 차례인플레이어 확인.
                    this-user : 사용자가 현재 작동시키고 있는 플레이어 확인 .
                    waiting-box : 후공 플레이어 미접속 상태.
                 -->
                <div class="player-box player-first waiting-box flex-box column item-center player1">
                    <div class="marker">O</div>
                    <div class="user-icon">
                        <div class="user-icon-img">
                            <img src="images/profile_icon.png" alt="프로필 사진">
                        </div>
                        <div class="me-marker">ME</div>
                    </div>
                    <div class="user-name"></div>
                    <div class="user-waiting">WAITING PLAYER...</div>
                    <div class="turn">YOUR TURN</div>
                </div>
    
                <div class="player-box player-second waiting-box flex-box column item-center player2">
                    <div class="marker">X</div>
                    <div class="user-icon">
                        <div class="user-icon-img">
                            <img src="images/profile_icon.png" alt="프로필 사진">
                        </div>
                        <div class="me-marker">ME</div>
                    </div>
                    <div class="user-name"></div>
                    <div class="user-waiting">WAITING PLAYER...</div>
                    <div class="turn">YOUR TURN</div>
                </div>
            </div>

            <div class="game-stage">
                <div class="game-row">
                    <div class="game-box box-light" data-value="0">
                        <%--<img src="images/obj-circle-hevy.svg" alt="O" class="first-order animate__bounceIn">
                        <img src="images/obj-cross-hevy.svg" alt="X" class="second-order">--%>
                    </div>
                    <div class="game-box box-dark" data-value="1">
                        <%--<img src="images/obj-circle-hevy.svg" alt="O" class="first-order animate__bounceIn">
                        <img src="images/obj-cross-hevy.svg" alt="X" class="second-order animate__bounceIn">--%>
                    </div>
                    <div class="game-box box-light" data-value="2">
                        <%--<img src="images/obj-circle-hevy.svg" alt="O" class="first-order">
                        <img src="images/obj-cross-hevy.svg" alt="X" class="second-order">--%>
                    </div>
                </div>
                <div class="game-row">
                    <div class="game-box box-dark" data-value="3">
                        <%--<img src="images/obj-circle-hevy.svg" alt="O" class="first-order">
                        <img src="images/obj-cross-hevy.svg" alt="X" class="second-order">--%>
                    </div>
                    <div class="game-box box-light" data-value="4">
                        <%--<img src="images/obj-circle-hevy.svg" alt="O" class="first-order">
                        <img src="images/obj-cross-hevy.svg" alt="X" class="second-order">--%>
                    </div>
                    <div class="game-box box-dark" data-value="5">
                        <%--<img src="images/obj-circle-hevy.svg" alt="O" class="first-order">
                        <img src="images/obj-cross-hevy.svg" alt="X" class="second-order">--%>
                    </div>
                </div>
                <div class="game-row">
                    <div class="game-box box-light" data-value="6">
                        <%--<img src="images/obj-circle-hevy.svg" alt="O" class="first-order">
                        <img src="images/obj-cross-hevy.svg" alt="X" class="second-order">--%>
                    </div>
                    <div class="game-box box-dark" data-value="7">
                        <%--<img src="images/obj-circle-hevy.svg" alt="O" class="first-order">
                        <img src="images/obj-cross-hevy.svg" alt="X" class="second-order">--%>
                    </div>
                    <div class="game-box box-light" data-value="8">
                        <%--<img src="images/obj-circle-hevy.svg" alt="O" class="first-order">
                        <img src="images/obj-cross-hevy.svg" alt="X" class="second-order">--%>
                    </div>
                </div>
            </div>
        </div>
            
        <div class="title-graphic">
            <img src="images/obj-pen.png" alt="펜" class="obj-pen">
            <img src="images/obj-search.png" alt="돋보기" class="obj-search">
        </div>
        <div class="game-btn">
            <input type="button" value="나가기" class="btn btn-light" id="roomExit">
            <!-- 비 활성화시 disabled 클래스 추가 -->
        </div>
    </section>
    
    <!-- 공통::js -->
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="js/common.js"></script>
    <script>



        /*$(function () {

            var gameArea = $('.game-box');

            gameArea.click(function () {

                var order = Math.floor(Math.random() * 2);
                var first = $(this).find('.first-order');
                var second = $(this).find('.second-order');

                if (order === 0) {
                    first.removeClass('animate__bounceIn');
                    second.addClass('animate__bounceIn');
                } else {
                    first.addClass('animate__bounceIn');
                    second.removeClass('animate__bounceIn');
                }
            });

            var challangeWinBtn = $('.player-first .marker');
            var challangeWinPopup = $('.winner-contents');
            var challangeWinInner = challangeWinPopup.find('.popup-inner');

            challangeWinBtn.click(function () {
                challangeWinInner.removeClass('bounce-out');
                challangeWinInner.addClass('bounce');
                challangeWinPopup.fadeIn(300);
            });

            var challangeLoseBtn = $('.player-second .marker');
            var challangeLosePopup = $('.loser-contents');
            var challangeLoseInner = challangeLosePopup.find('.popup-inner');

            challangeLoseBtn.click(function () {
                challangeLoseInner.removeClass('bounce-out');
                challangeLoseInner.addClass('bounce');
                challangeLosePopup.fadeIn(300);
            });

            var challangeDrawBtn = $('.turn');
            var challangeDrawPopup = $('.draw-contents');
            var challangeDrawInner = challangeDrawPopup.find('.popup-inner');

            challangeDrawBtn.click(function () {
                challangeDrawInner.removeClass('bounce-out');
                challangeDrawInner.addClass('bounce');
                challangeDrawPopup.fadeIn(300);
            });

            var secondArea = $('.player-second');

            //대상 임시
            $('.player-second .user-icon').click(function () {
                secondArea.toggleClass('waiting-box');
            });
        });*/
    </script>
    <script src="js/page/game_room.js" type="module"></script>

</body>
</html>