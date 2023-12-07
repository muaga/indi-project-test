<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
  <head>
    <title>결제 하기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/icomoon/style.css">
    <link rel="stylesheet" href="/css/rome.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="/css/style.css">

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
              <p class="n_pay_step_p">좌석 지정</p>
            </li>
            <li class="n_other_li">
              <p class="n_pay_step_choice">결제 하기</p>
            </li>
          </ol>
        </div>
        <div id="n_select_movie_pay">
          <form class="n_pay">
            <div id="n_movie_title">
              <img src="images/movie-level-all.png">
              <p>그대들은 어떻게 살 것인가?</p>
            </div>
            <div class="n_movie_day">
              <p id="day">2023.01.02</p>
              <p id="time">15:05 ~ 17:03</p>
            </div>
            <div class="n_movie_place">
              <p id="place">그린 아트 시네마</p>
              <p id="address">부산광역시 부산진구 부전제2동 521-10</p>
              <p id="number">051.000.0000</p>
            </div>
            <div class="n_people_and_pay">
              <div class="n_people">
                <p>인원 : </p><p> 3인</p>
              </div>
              <div class="n_total_pay">
                <p>최종 결제 금액</p>
                <p id="price">21,000원</p>
              </div>
            </div>
            <div id="n_payment">
              <p>카카오페이로 결제하기</p>
              <button type="button">카카오 결제 버튼</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>