<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
  <head>
    <title>예매 완료</title>
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
        <div id="n_reservation_ticket">
          <div class="n_movie_img">
            <img src="/images/the_boy_poster.jpg">
          </div>
          <div class="n_reservation_detail">
            <span id="n_comment"><p>영화 예매가 완료되었습니다!</p></span>
            <div class="n_detail">
              <span>
                <p class="n_title">· 예매 영화</p>
                <p>그대들은 어떻게 살 것인가?</p>
              </span>
              <span>
                <p class="n_title">· 관람 시간</p>
                <p id="n_day">2024.10.02</p>
                <p id="n_time">15:05 ~ 16:20</p>
              </span>
              <span>
                <p class="n_title">· 관람 인원</p>
                <p>3명</p>
              </span>
              <span>
                <p class="n_title">· 좌석 번호</p>
                <p class="n_seat_number">G15</p>
                <p class="n_seat_number">G16</p>
                <p class="n_seat_number">G17</p>
              </span>
              <span>
                <p class="n_title">· 관람 극장</p>
                <p id="n_place">그린 시네마</p>
              </span>
              <span>
                <p class="n_title">· 결제 정보</p>
                <p>16,000원</p>
              </span>
            </div>
          </div>
          <div class="n_reservation_number">
            <span><p id="n_title">예매 번호</p></span>
            <span><p id="n_number">9931-650-40013</p></span>
          </div>
        </div>
        <div id="n_reservation_list_button">
          <form action="" method="get">
            <input type="hidden" name="" value="" >
            <button type="submit" id="n_button">예매 내역</button>
          </form>
        </div>
        <div id="n_attention_comment">
          <p>· 상영안내</p>
          <p class="n_comment">- 쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</p>
          <p class="n_comment">- 상영시간 1시간 전까지 취소 가능하며, 갭쳐화면으로는 입장하실 수 없습니다.</p>
        </div>
      </div>
    </div>
  </body>
</html>