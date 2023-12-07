<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>좌석 선택하기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- css -->
    <link href="../../../../css/neh_style.css" rel="stylesheet">

</head>
<body>
<div class="container-fluid n_custom_fluid">
    <div class="row justify-content-center">
        <div id="n_pay_step">
            <ol>
                <li class="n_other_li">
                    <p class="n_pay_step_p">날짜 선택</p>
                </li>
                <li class="n_middle_li">
                    <p class="n_pay_step_choice">좌석 지정</p>
                </li>
                <li class="n_other_li">
                    <p class="n_pay_step_p">결제 하기</p>
                </li>
            </ol>
        </div>
        <div id="n_select_seat">
            <div id="n_movie_seat">
                <div class="n_last_count">
                    <div class="n_count_person">
                        <p>관람인원</p>
                    </div>
                    <div class="n_ticket_count">
                        <div class="n_last_count_button">
                            <button id="n_minus_button" onclick="count('minus')" disabled>-</button>
                            <p class="n_count">0</p>
                            <button id="n_plus_button" onclick="count('plus')">+</button>
                        </div>
                    </div>
                </div>
                <div id="n_seat_and_attention">
                    <div id="n_seat_wrapper">
                        <div class="n_seat_wrapper"></div>
                    </div>
                    <div id="n_attention_seat">
                        <span>
                            <input type="button" id="n_choice">
                            <p>선택</p>
                        </span>
                        <span>
                            <div>
                                <input type="button" id="n_exist" value="X">
                            </div>
                            <p>예매 완료</p>
                        </span>
                        <span>
                            <input type="button" id="n_possible">
                            <p>일반</p>
                        </span>
                    </div>
                </div>
            </div>
            <div id="n_select_movie_seat">
                <div id="n_select_info">
                    <div id="n_img">
                        <img src="images/moviePhoto/the_boy1.jpg">
                    </div>
                    <div id="n_movie_title">
                        <img src="images/icons/movie_level_all.png">
                        <p>그대들은 어떻게 살 것인가?</p>
                    </div>
                    <div id="n_movie_day_and_time">
                        <div class="n_select_count">
                            <span id="n_day"><p>2023.01.02</p></span>
                            <span id="n_time"><p>15:05 ~ 17:03</p></span>
                        </div>
                    </div>
                    <div>
                        <div class="n_select_seat_wrapper"></div>
                    </div>
                </div>
                <form>
                    <button type="submit" id="n_payment_button">
                        <div class="n_last_price">
                            <span class="n_last_price" id="n_last_count"><p id="n_count">0</p><p>인</p></span>
                            <span class="n_last_price" id="last_price"><p>총</p><p id="n_price">0</p><p>원</p></span>
                        </div>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>


<script>
    // 티켓 수량 버튼
    ///////////////////////////////////////////////////////////////
    function count(type){
        let minusButton = document.querySelector("#n_minus_button");
        let plusButton = document.querySelector("#n_plus_button");
        let count = document.querySelector(".n_count");
        let number = count.innerHTML; // 0

        if(type == "plus"){
            number = parseInt(number) + 1;
        }else{
            number = parseInt(number) - 1;
        }

        if(number <= 0){
            minusButton.disabled = true;
        }else {
            minusButton.disabled = false;
        }

        if(5 < number){
            plusButton.disabled = true;
        }else {
            plusButton.disabled = false;
        }
        // 계산 끝난 number를 count.innerHTML에 지정하기
        count.innerHTML = number;
        console.log("number : " + number);
    }

    // 좌석 선택하기
    ///////////////////////////////////////////////////////////////
    const seatWrapper = document.querySelector(".n_seat_wrapper"); // 극장 자리들
    let existSeats = new Array(); // 이미 선택된 자리(비활성화)
    let clickedSeats = new Array(); // 선택한 모든 자리
    let exist = ""; // 이미 선택된 자리가 있는 div를 담는 함수
    let clicked = ""; // 선택한 자리가 있는 div를 담는 함수
    let div = ""; // 추가할 tag

    let selectedSeatsData = ['A1', 'A2', 'A3', 'C5'];

    // 페이지 로딩 시 아래의 함수 실행
    window.onload = function (){
        selectedSeat();
    };

    for(let i = 0; i < 10; i++) {
        div = document.createElement("div");
        seatWrapper.append(div);

        for(let j = 0; j < 14; j++) {
            let input = document.createElement("input");
            input.type = "button";
            input.name = "seats";
            input.classList = "n_seat";
            input.disabled = false;

            mapping(input, i, j);
            div.append(input);

            input.addEventListener("click", function (e) {
                // 관람인원만큼 선택 가능하기
                let wantCount = parseInt(document.querySelector(".n_count").innerHTML, 10);
                console.log("관람인원 수: " + wantCount);
                console.log("선택한 사람 수: " + clickedSeats.length);

                // 선택한 자리가 이미 wantCount개인 경우 추가 선택 방지
                <%--if (clickedSeats.length >= wantCount) {--%>
                <%--    console.log(`이미 ${wantCount}개의 자리를 선택하셨습니다.`);--%>
                <%--    return;--%>
                <%--}--%>

                // 선택이 된 좌석을 클릭 시 삭제
                if (input.classList.contains("n_clicked")) {
                    input.classList.remove("n_clicked");
                    clicked = document.querySelectorAll(".n_clicked");
                    clicked.forEach(select => {
                        clickedSeats.push(select.value);
                    });
                    console.log("선택한 자리: " + clickedSeats);
                    lastSelectedSeat();
                    sumPrice();
                }
                // 좌석 선택하기
                else {
                    input.classList.add("n_clicked");
                    clicked = document.querySelectorAll(".n_clicked");
                    clicked.forEach(select => {
                        clickedSeats.push(select.value);
                    });
                    console.log("선택한 자리: " + clickedSeats);
                    lastSelectedSeat();
                    sumPrice();
                }

                // 중복으로 선택되는 것을 방지
                clickedSeats = clickedSeats.filter((select, seats) => clickedSeats.indexOf(select) !== seats);
            })
        }
    }

    // 선택한 좌석 목록보기
    ///////////////////////////////////////////////////////////////
    const selectSeatWrapper = document.querySelector(".n_select_seat_wrapper"); // 선택한 자리들
    let lastClickedSeats = new Array();
    let lastClicked = "";
    let lastDiv = "";

    for(let l = 0; l < 1; l++){
        lastDiv = document.createElement("div");
        lastDiv.classList = "n_select_list";
        selectSeatWrapper.append(lastDiv);

        for(let d = 0; d < 6; d++ ){
            let lastInput = document.createElement("input");
            lastInput.type = "button";
            lastInput.name = "lastSeats";
            lastInput.classList = "n_last_seat";
            lastInput.disabled = true;
            lastDiv.append(lastInput);
        }
    }

    // 선택이 불가능한 좌석
    function selectedSeat(){
        //for문 돌면서 찾기
        selectedSeatsData.forEach(existSeat => {
            exist = document.querySelector("input[value='"+ existSeat +"']");
            existSeats.push(exist);
        })
        if(existSeats != null){
            existSeats.forEach(input => {
                input.classList.add("n_exist");
                input.disabled = true;
                input.value = "X";
            })
        }
        console.log("선택 불가능한 자리 : " + selectedSeatsData);
    }
    // 좌석 총 인원 수와 결제 금액
    ///////////////////////////////////////////////////////////////
    let ticketCount = document.querySelector("#n_count");
    let totalTicketPrice = document.querySelector("#n_price");
    let ticketPrice = 8000;

    function sumPrice(){
        // 티켓 값과 선택한 좌석 갯수
        let sumTicketprice = clickedSeats.length * ticketPrice;

        // 총 금액, int -> String
        let totalStringTicketPrice = sumTicketprice.toLocaleString(); // 숫자 -> 1,000

        // 최종 결제 금액
        if(clickedSeats.length <= 0){
            totalTicketPrice.innerHTML = "0";
        }else{
            totalTicketPrice.innerHTML = totalStringTicketPrice;
        }
    }


    // 선택한 좌석 목록 만들기
    function lastSelectedSeat(){
         if(clickedSeats != null){
             let clickedCount = clickedSeats.length.toString();
             ticketCount.innerHTML = clickedCount;
             console.log("티켓카운터 : " + ticketCount.innerHTML);
             // 만들어 놓은 lastSeat input 태그 가져오기
             lastClicked = document.querySelectorAll(".n_last_seat");

             // input 태그 6개를 String으로 받는 다음, arraylist에 넣기
             lastClicked.forEach(clickedSeat => {
                 lastClickedSeats.push(clickedSeat);
             })

             // input 태그 속 value가 있다면 ""로 초기화를 먼저 하고 classList 변경하기
             if(lastClickedSeats.values() != null){
                 lastClickedSeats.forEach(cliecked => {
                     cliecked.value = "";
                     cliecked.classList = "n_last_seat";
                 })
             }

             // 클릭되는 갯수에 따라 forEach 돌면서 input 태그 arraylist에 담기
             clickedSeats.forEach((selectedSeatNumber, index) => {
                 lastClickedSeats[index].classList = "n_last";
                 lastClickedSeats[index].value = selectedSeatNumber;
                 console.log("lastSeat.value : " + lastClickedSeats[index].classList);
             })
         }
    }

    // 영화관 좌석 value 지정하기
    function mapping(input, i, j) {
        if (i == 0) {
            input.value = "A" + j;
            if ((j == 0 || j == 1)) {
                input.classList.add("n_hidden");
                input.disabled = true;
            }
            if ((j == 12 || j == 13)) {
                input.classList.add("n_hidden");
                input.disabled = true;
            }
        } else if (i == 1) {
            input.value = "B" + j;
            if (j == 0 || j == 13) {
                input.classList.add("n_hidden");
                input.disabled = true;
            }
        } else if (i == 2) {
            input.value = "C" + j;
        } else if (i == 3) {
            input.value = "D" + j;
        } else if (i == 4) {
            input.value = "E" + j;
        } else if (i == 5) {
            input.value = "F" + j;
        } else if (i == 6) {
            input.value = "G" + j;
        } else if (i == 7) {
            input.value = "H" + j;
        } else if (i == 8) {
            input.value = "I" + j;
        } else if (i == 9) {
            input.value = "J" + j;
        }
        if (j == 3 || j == 9) {
            input.style = 'margin-right:20px;';
        }
    }
</script>
</body>
</html>