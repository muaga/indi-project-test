<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>그대들은 어떻게 살 것인가</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }

        .select_movie {
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            height: 60px;
            background-color: dimgray;
        }
        .select_movie h5 {
            margin: 0;
        }

        .container-fluid {
            display: flex;
            align-items: center;
            max-width: 1280px;
        }

        .body {
            width: 100%;
        }

        .row {
            margin: 40px auto;
            max-width: 830px;
        }

        .select_form {
            display: flex;
            padding: 0;
            height: 190px;
        }

        .select_movie_img {
            border-radius: 10px;
            margin-right: 24px;
            width: 43%;
        }
        .ticket_type {
            display: flex;
            font-size: 20px;
            font-weight: bold;
            color: green;
        }
        .form_check_detail p{
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .form_check_detail #select_movie_title {
            font-size: 20px;
            font-weight: bold;
        }

        .form_check_detail #select_movie_content{
            font-size: 14px;
            margin-bottom: 14px;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
        }

        .show_period {
            display: flex;
            color: dimgray;
            font-weight: bold;
        }
        .show_period img {
            margin: 0 6px 0 0;
        }

        .selcet_price{
            display: flex;
            flex-direction: column;
            background: lightgray;
            border-radius: 10px;
            padding: 22px;
            margin: 24px 0;
        }
        .selcet_price #ticket_title {
            font-size: 16px;
            font-weight: bold;
        }
        .selcet_price #select_price {
            display: flex;
            align-content: normal;
            justify-content: flex-end;
            font-weight: bold;
        }
        .donation {
            padding: 0;
            margin: 25px 0px;
            width: 90%;
        }
        .donation_info {
            display: flex;
            justify-content: space-between;
        }

        .donation_info #donation_title{
            font-weight: bold;
        }
        .donation_comment {
            font-size: 14px;
            color: dimgray;
        }
        .donation_price {
            display: flex;
            justify-content: end;
            align-items: baseline;
        }
        .donation_price input {
            width: 15%;
            font-size: 14px;
        }
        .total_price {
            display: flex;
            justify-content: center;
        }
        .total_price #total_price {
            font-weight: bold;
            color: green;
            padding-left: 5px;
        }
        .total_comment {
            font-weight: bold;
            color: dimgray;
        }
        #next_button {
            background-color: green;
            width: 17%;
            border: none;
            padding: 13px 0;
            color: white;
            border-radius: 5px;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
<body>
    <div class="select_movie">
        <h5>기대되는 영화! "그대들은 어떻게 살 것인가?"</h5>
    </div>
    <div class="container-fluid">
        <div class="body">
            <div class="row justify-content-center">
                <div class="select_form">
                    <img class="select_movie_img" src="images/그대들은-1.jpg">
                    <div class="form_check_detail">
                        <span class="ticket_type">
                        <p>[온라인 티켓]</p>
                        </span>
                        <p id="select_movie_title">그대들은 어떻게 살 것인가?</p>
                        <p id="select_movie_content">어머니를 그리워하며 새로운 보금자리에 적응하던 주인공 "마히토"가 정체불명의 왜가리와 함께 저택의 신비로운 탑에 대한 이야기를 듣게 되는 작품을 기대해 주세요</p>
                        <div class="show_period">
                            <img src="images/movie.png" width="20" height="20">
                            <p>23.10.15 온라인 상영 예정</p>
                            <!--23.10.15 ~ 23.10.30 오프라인 상영 기간 추가-->
                        </div>
                    </div>
                </div>
                <div class="selcet_price">
                    <span id="ticket_title">[4일간 무제한 스트리밍]</span>
                    <span id="select_price"><p id="ticket_price">8,000</p><p>원</p></span>
                </div>
                <div class="donation">
                    <span class="donation_info">
                        <p id="donation_title">후원금 더하기(선택)</p>
                        <p class="donation_comment">후원금을 더하여 참여할 수 있습니다. 추가 후원금을 입력하시겠습니까?</p>
                    </span>
                    <span class="donation_price">
                        <input type="text" class="form-control" id="donation_price" placeholder="0" name="donationPrice" value="" oninput="inputDonation()">
                        <p class="donation_comment">원을 추가로 후원합니다.</p>
                    </span>
                </div>
                <form action="/" method="get">
                    <input type="hidden" name="total_price" value="">
                    <input type="hidden" name="select_movie" value="">
                    <div class="total_price">
                        <p class="total_comment">"그대들은 어떻게 살 것 인가?"에 </p>
                        <p id="total_price">8,000</p>
                        <p class="total_comment">원을 참여합니다.</p>
                    </div>
                    <button type="submit" id="next_button">다음 단계로 ></button>
                </form>
            </div>
        </div>
    </div>
</body>
<script>
    function inputDonation(){
        // 입력된 값
        let ticket_price = document.querySelector("#ticket_price").innerHTML;
        let inputDonationPrice = document.querySelector("#donation_price").value;

        // String -> int
        let ticketIntPrice = parseInt(ticket_price.replace(/,/g, '')); // 8,000 -> 숫자
        let inputIntprice = parseInt(inputDonationPrice);

        // 펀딩금 + 후원금, int -> String
        let totalIntPrice = ticketIntPrice + inputIntprice; // 숫자
        let totalStringPrice = totalIntPrice.toLocaleString(); // 숫자 -> 1,000

        // 최종 결제 금액
        let totalPrice = document.querySelector("#total_price");
        if(inputDonationPrice == 0){
            totalPrice.innerHTML = ticket_price;
        }else{
            totalPrice.innerHTML = totalStringPrice;
        }
    }
</script>
</html>