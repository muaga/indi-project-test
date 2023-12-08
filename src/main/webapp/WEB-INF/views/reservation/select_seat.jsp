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
                        <div class="n_select_seat_wrapper">
                            <input type="hidden" id="n_clicked_seat_list" name="" value="">
                            <input type="hidden" id="n_exist_seat_list" name="" value="">
                            <input type="hidden" id="n_selected_seat_data" name="" value="">
                        </div>
                    </div>
                </div>
                <form>
                    <button type="submit" id="n_payment_button">
                        <div class="n_last_price">
                            <span class="n_last_price" id="n_last_count"><p id="n_person_count">0</p><p>인</p></span>
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
        let clickedList = document.querySelector("#n_clicked_seat_list");



        // 총 관람 좌석 수
        let allSeatCount = 124;
        // 이미 예약이 완료된 좌석 수
        let existSeatCount = 123;
        // 제한 숫자
        let limitNumber;


        if(118 <= existSeatCount && existSeatCount <= 124){
            limitNumber = allSeatCount - existSeatCount - 1;

        }else if(existSeatCount < 118){
            limitNumber = 5;
        }

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

        if(limitNumber < number){
            plusButton.disabled = true;
        }else {
            plusButton.disabled = false;
        }

        if(number < clickedList.value){
          alert("선택한 좌석 먼저 해제해주세요.");
          return;
        }


        count.innerHTML = number;
    }


    // 좌석 선택하기
    ///////////////////////////////////////////////////////////////
    const seatWrapper = document.querySelector(".n_seat_wrapper"); // 극장 자리들
    let existSeats = new Array(); // 이미 선택된 자리(비활성화)
    let clickedSeats = new Array(); // 선택한 모든 자리
    let exist = ""; // 이미 선택된 자리가 있는 div를 담는 함수
    let clicked = ""; // 선택한 자리가 있는 div를 담는 함수
    let div = ""; // 추가할 tag
    let Data = document.querySelector("#n_selected_seat_data"); // 이미 예약이 완료된 좌석
    let selectedSeatsData = [];
    //TODO 은혜: 나중에 Data는 배열이므로, selectedSeatsData로 바꾸기

    // 페이지 로딩 시 아래의 함수 실행
    window.onload = function (){
        if(selectedSeatsData != null){
            selectedSeat();
        }
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
                let wantCount = parseInt(document.querySelector(".n_count").innerHTML);
                let clickedList = document.querySelector("#n_clicked_seat_list");

                // 관람인원에 따른 코드 실행
                if(wantCount == 0) {
                    alert("관람인원을 선택해주세요");
                    clickedSeats == [];
                }else{
                // 중복으로 선택되는 것을 방지
                clickedSeats = clickedSeats.filter((select, seats) => clickedSeats.indexOf(select) !== seats);

                // 선택이 된 좌석을 클릭 시 삭제
                if (input.classList.contains("n_clicked")) {
                    input.classList.remove("n_clicked");
                    clicked = document.querySelectorAll(".n_clicked");
                    clicked.forEach(select => {
                        clickedSeats.push(select.value);
                    });
                    console.log("선택한 자리: " + clickedSeats);
                    clickedList.value = clickedSeats.length;
                    lastSelectedSeat();
                    sumPrice();
                }
                // 좌석 선택하기
                else {
                    let seatNumber;

                    if (isNaN(parseInt(clickedList.value))) {
                        seatNumber = 1;
                    } else {
                        seatNumber = parseInt(clickedList.value) + 1;
                    }

                    if (seatNumber > wantCount) {
                        alert("이미 " + wantCount + "개의 자리를 선택하셨습니다.");
                        return;

                    }else{
                        input.classList.add("n_clicked");
                        clicked = document.querySelectorAll(".n_clicked");
                        clicked.forEach(select => {
                            clickedSeats.push(select.value);
                        });
                        clickedList.value = clickedSeats.length;
                        lastSelectedSeat();
                        sumPrice();
                        }
                    }
                }
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
    function selectedSeat() {
        selectedSeatsData.forEach(existSeat => {
            exist = document.querySelector("input[value='" + existSeat + "']");
            existSeats.push(exist);
        })
        if (existSeats != null) {
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
    let ticketCount = document.querySelector("#n_person_count");
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


    // 선택한 좌석 목록 만들기 + 인원 등록
    //////////////////////////////////////////////////////////////
    function lastSelectedSeat(){
         if(clickedSeats != null){
             // 선택한 좌석 인원 등록
             let clickedCount = clickedSeats.length.toString();
             ticketCount.innerHTML = clickedCount;

             // 선택한 좌석 목록 만들기
             lastClicked = document.querySelectorAll(".n_last_seat");

             lastClicked.forEach(clickedSeat => {
                 lastClickedSeats.push(clickedSeat);
             })

             if(lastClickedSeats.values() != null){
                 lastClickedSeats.forEach(cliecked => {
                     cliecked.value = "";
                     cliecked.classList = "n_last_seat";
                 })
             }

             clickedSeats.forEach((selectedSeatNumber, index) => {
                 lastClickedSeats[index].classList = "n_last";
                 lastClickedSeats[index].value = selectedSeatNumber;
             })
         }
    }

    // 결제금액이 0일 때 결제 막기
    let paymentButton = document.querySelector("#n_payment_button");
    let totalPrice = document.querySelector("#n_price");
    paymentButton.addEventListener("click", function (){
        console.log("total + " + totalTicketPrice);
        if(parseInt(totalPrice.innerHTML) == 0){
            alert("결제할 금액이 없습니다.");
        }
    });


    // 영화관 좌석 value 지정하기
    ////////////////////////////////////////////////////////////
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