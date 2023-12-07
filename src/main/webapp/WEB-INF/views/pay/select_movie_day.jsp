<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
  <head>
    <title>날짜 선택</title>
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
              <p class="n_pay_step_choice">날짜 선택</p>
            </li>
            <li class="n_middle_li">
              <p class="n_pay_step_p">좌석 지정</p>
            </li>
            <li class="n_other_li">
              <p class="n_pay_step_p">결제 하기</p>
            </li>
          </ol>
        </div>
        <div id="n_select_day">
          <div class="n_movie_calendar">
            <form action="#" class="row">
              <div id="inline_cal"></div>
            </form>
          </div>
          <div class="n_select_day_movies">
            <input type="text" id="result" placeholder="날짜를 선택해주세요" disabled="">
            <form id="n_day_movies_form">
              <button type="submit" id="select_movie_button">
                <div id="n_day_movies">
                <span id="n_movie_time">
                  <p class="n_start_time">14:05</p>
                  <p class="n_end_time">~15:57</p>
                </span>
                  <span id="n_movie_title">
                  <p>그대들은 어떻게 살 것인가?</p>
                </span>
                </div>
                <div id="n_seat">
                  <div id="n_seat_count">
                    <p class="n_possible_seat">119</p><p class="n_all_seat">/168</p>
                  </div>
                </div>
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>

    
    <script>
      function change() {
        let dayValue = document.querySelector("#result").value;
        console.log("dayValue: " + dayValue);
      }
    </script>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/rome.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>