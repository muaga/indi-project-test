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
        }

        .carousel-inner img{
            border-radius: 8px;
        }
        .explan {
            background-color: #f9fafb;
            border-radius: 8px;
            padding: 16px;
            margin: 40px 0;
        }
        .explan ul {
            display: flex;
            position: relative;
            margin: 0;
            flex-shrink: 0;
            cursor: pointer;
            padding: 0 0 0 4px;
            height: 54px;
            text-align: center;
            overflow: hidden;
        }
        .explan li{
            margin-right: 30px;
            list-style: none;
            flex-basis: min-content;
            font-size: 13px;
        }
        .explan_fund{
            display: inline-block;
            margin-bottom: 4px;
            width: 32px;
            height: 32px;
        }
        .explan_refund{
            display: inline-block;
            margin-bottom: 4px;
            width: 32px;
            height: 32px;
        }
        .explan_info {
            margin-top: 14px;
            border-top: solid;
            border-top-color: dimgray;
            border-width: thin;
        }
        .explan_info p{
            padding: 0 0 0 4px;
            margin: 14px 0 0 0;
            font-size: 13px;
        }
        .movie_info {
           margin: 40px 0 0
        }
        .movie_info h3 {
            color: black;
            font-weight: bold;
            margin: 0 0 20px;
        }
        .movie_info h4, .more_movie_all h4 {
            color: dimgray;
            font-weight: bold;
        }
        .movie_info h5 {
            color: black;
            padding: 14px;
            margin: 0;
            font-weight: bold;
        }
        .movie_info p {
            color: dimgray;
            padding: 0 14px;
            margin: 0;
            font-weight: 500;
        }
        .movie_text {
            padding: 40px 0;
        }
        .movie_photo {
            padding: 40px 0;
        }
        .movie_photo img {
            width: 100%;
            padding: 0 14px 20px;
        }
        #director_img {
            width: 50%;
            padding: 0 14px;
        }
        .movie_text th {
            width: 20%;
            background-color: lightgrey;
            text-align: center;
            color: grey;
        }
        .movie_text td {
            width: 30%;
            color: dimgray;
        }
        .toggle_button {
            width: 100%;
            border: solid 0.5px;
            border-color: #4be2a7;
            border-radius: 8px;
            height: 50px;
            background: transparent;
            color: #4be2a7;
            margin: 0px 0 40px;
        }
        .more_movie_all{
            margin-top: 40px;
        }
        .more_movie_all p {
            margin: 5px 0;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .more_movie {
            width: 25%;
        }
        .more_movie img {
            width: 100%;
        }
        .more_movie_list {
            padding-top: 20px;
        }
        .more_movie_achieve {
            font-size: 18px;
            color: #4be2a7;
            font-weight: bold;
        }
        .more_movie_title {
            display: block;
            font-weight: bold;
            font-size: 15px;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
        }
        .more_movie_content {
            display: block;
            font-size: 13px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        .more_movie_directer {
            font-size: 12px;
            color: dimgray;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
        }

        .movie_category {
            display: flex;
            justify-content: flex-start;
            border-bottom: solid;
            border-width: thin;
            border-color: lightgrey;
            padding: 0 0 16px;
        }

        .movie_category #sharp{
            color: #4be2a7;
            font-size: 14px;
            padding-right: 5px;
        }
        .movie_category #category{
            font-weight: 500;
            font-size: 13px;
        }

        .col-sm-5 p {
            margin: 0;
        }

        .sell_img{
            display: flex;
            justify-content: flex-start;
            margin: 16px 0;
            font-weight: bold;
            color: #4be2a7;
            font-size: 14px;
        }
        .sell_img img {
            padding-right: 5px;
        }
        .sell_title {
            display: flex;
            justify-content: flex-start;
            margin: 20px 0;
        }

        .sell_title #movie_title {
            font-weight: bold;
            font-size: 20px;
            color: black;
        }

        .sell_content {
            font-size: 13px;
            color: dimgray;
            margin: 20px 0;
        }
        .sell_archive{
            display: flex;
            justify-content: flex-start;
            align-items: center;
            margin: 20px 0;
        }
        .sell_archive span{
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }

        .sell_archive #sell_archive_percent{
            font-size: 24px;
            font-weight: bold;
            color: #4be2a7;
        }
        .sell_archive #sell_archive_frame{
            font-weight: 500;
            color: #4be2a7;
            display: flex;
            padding: 0 14px 0 0;
        }
        .sell_archive #sell_dday{
            height: 27px;
            padding: 0 8px;
            background-color: #d9fff0;
            color: #4be2a7;
            border-radius: 8px;
        }

        .sell_archive #sell_dday p{
            font-size: 11px;
            height: 12px;
        }

        .sell_fund_state {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            margin: 20px 0;
        }

        .sell_fund_state span{
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }

        .sell_fund_state #sell_fund_price{
            font-size: 24px;
            font-weight: bold;
            color: black;
        }
        .sell_fund_state #sell_fund_frame{
            font-weight: 500;
            color: black;
            display: flex;
            padding: 0 14px 0 0;
        }
        .sell_fund_state #sell_play{
            height: 27px;
            padding: 0 8px;
            background-color: lightgrey;
            color: black;
            border-radius: 8px;
        }

        .sell_fund_state #sell_play p{
            font-size: 11px;
            height: 12px;
        }
        .sell_period {
            width: 70%;
            font-size: 14px;
            display: flex;
            align-items: flex-start;
        }

        .sell_period #fund_type, #period {
            display: block;
        }

        .sell_period #fund_period, #period p {
            padding: 3px 0;
            color: dimgray;
            font-weight: 500;
        }

        .sell_period #fund_type {
            margin: 0 55px 0 0;
        }
        #show_period {
            padding: 3px 0;
            color: red;
            font-weight: bold;
        }

        .sell_ticket {
            margin: 30px 0 20px;
        }
        .sell_ticket h5{
            font-weight: bold;
            padding-bottom: 10px;
            color: red;
        }
        .sell_ticket h6{
            font-weight: bold;
        }
        .sell_ticket_type {
            font-size: 13px;
            border: solid;
            border-width: thin;
            border-color: lightgrey;
            border-radius: 10px;
            padding: 20px;
        }
        .sell_button {
            display: flex;
            align-items: center;
        }
        .sell_bookmark_button {
            width: 13%;
            height: 60px;
            background-color: transparent;
            border-radius: 8px;
            border-color: lightgrey;
            box-shadow: none;
            margin: 0 12px 0 0;
            border-width: thin;
        }
        .sell_bookmark_button img {
            height: 22px;
            width: 22px;
        }
        .sell_ticket_button {
            background-color: #4be2a7;
            height: 60px;
            width: 92%;
            border-radius: 8px;
            border-color: transparent;
            color: white;
            font-size: 20px;
        }
        .theater_info, .parking_info {
            font-weight: bold;
        }
        #theater_name {
            color: red;
            font-weight: bold;
        }
        .ticket_count {
            display: flex;
            justify-content: end;
        }

        .ticket_count_button {
            display: flex;
            align-items: center;
            border: solid;
            border-width: thin;
            border-radius: 4px;
            border-color: darkgray;
            width: 98px;
            height: 30px;
            text-align: center;
        }
        .ticket_count_button #minus_button {
            border: none;
            width: 33%;
            background: none;
            border-right: solid;
            border-color: darkgray;
            border-width: thin;
            height: 30px;
        }
        .ticket_count_button #count {
            width: 33%;
        }

        .ticket_count_button #plus_button {
            border: none;
            width: 33%;
            background: none;
            border-left: solid;
            border-color: darkgray;
            border-width: thin;
            height: 30px;
        }
    </style>
<body>
    <div class="container-fluid">
        <div class="body">
            <div class="row justify-content-center">
                <div class="col-sm-7">
                    <!-- 펀딩 영화 이미지 -->
                    <div id="demo" class="carousel slide" data-bs-ride="carousel">

                        <!-- Indicators/dots -->
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                            <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                            <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
                        </div>

                        <!-- The slideshow/carousel -->
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="/images/the_boy_1.jpg" class="d-block w-100">
                            </div>
                            <div class="carousel-item">
                                <img src="/images/the_boy_2.jpg" class="d-block w-100">
                            </div>
                            <div class="carousel-item">
                                <img src="/images/the_boy_3.jpg" class="d-block w-100">
                            </div>
                        </div>

                        <!-- Left and right controls/icons -->
                        <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                    </div>
                    <!-- 펀드/환불 설명 -->
                    <div class="explan">
                        <div>
                            <ul>
                                <li onclick="selectFund()">
                                    <span class="explan_fund" aria-hidden="true">
                                        <img id="fund" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTYuMDMxMjUgMjguODI0SDI1Ljk1OTJDMjcuMDU1MyAyOC44MjQgMjcuOTU5MiAyNy45MiAyNy45NTEyIDI2LjgyNFYxMy41SDI5VjlDMjkgNy44OTU0MyAyOC4xMDQ2IDcgMjcgN0g1QzMuODk1NDMgNyAzIDcuODk1NDMgMyA5VjEzLjUwMDFINC4wMzEyNVYyNi44MjRDNC4wMzEyNSAyNy45MjggNC45MjcyNSAyOC44MjQgNi4wMzEyNSAyOC44MjRaIiBmaWxsPSIjQjlFRUVFIi8+CjxwYXRoIGQ9Ik0xNiA2LjVDMTguMDMzIDQuMDE4NDkgMjAuMTIxMyAyLjcxMTEzIDIxLjExMTcgMi40NjM1M0MyMi42NDc3IDIuMDcxNTMgMjMuNzE5NyAzLjc0MzUzIDIyLjY1NTcgNC45MTE1M0MyMS45MjYxIDUuNzExNzYgMjAuODc5IDYuNDI0MDQgMTkuNSA2Ljg2NSIgc3Ryb2tlPSIjMjEyNTI5IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiLz4KPHBhdGggZD0iTTE2IDYuNUMxMy45MzY5IDMuOTcyMTcgMTEuODc3NiAyLjcxMzA5IDEwLjg4NjEgMi40NjM1M0M5LjM1MDE0IDIuMDcxNTMgOC4yNzgxNCAzLjc0MzUzIDkuMzQyMTQgNC45MTE1M0M5LjkwNzcyIDUuNTMxODUgMTEuMzMyNiA2LjMzMTg3IDEyLjUgNi44MDk4MiIgc3Ryb2tlPSIjMjEyNTI5IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiLz4KPHBhdGggZD0iTTQuMDMxMjUgMTMuNVYyNi44MjRDNC4wMzEyNSAyNy45MjggNC45MjcyNSAyOC44MjQgNi4wMzEyNSAyOC44MjRIMjUuOTU5MkMyNy4wNTUyIDI4LjgyNCAyNy45NTkyIDI3LjkyIDI3Ljk1MTIgMjYuODI0VjEzLjQ5OTkiIHN0cm9rZT0iIzIxMjUyOSIvPgo8cGF0aCBkPSJNMjguNzgzIDEzLjU2NzhWOC44Mzk4NEMyOC43ODMgNy43MzU4NCAyNy44ODcgNi44Mzk4NCAyNi43ODMgNi44Mzk4NEg1LjIwNzAzQzQuMTAzMDMgNi44Mzk4NCAzLjIwNzAzIDcuNzM1ODQgMy4yMDcwMyA4LjgzOTg0VjEzLjU2NzhIMjguNzgzWiIgc3Ryb2tlPSIjMjEyNTI5Ii8+CjxwYXRoIGQ9Ik0xNS45NzQ2IDYuNzUxOTVWMjguODI0IiBzdHJva2U9IiMyMTI1MjkiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIvPgo8L3N2Zz4K">
                                    </span>
                                    <span>펀딩</span>
                                </li>
                                <li onclick="selectRefund()">
                                    <span class="explan_refund" aria-hidden="true">
                                    <img id="refund" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3QgeD0iNy41IiB5PSI3LjUiIHdpZHRoPSIxNyIgaGVpZ2h0PSIxNyIgcng9IjEiIHN0cm9rZT0iIzIxMjUyOSIvPgo8cGF0aCBkPSJNMjIuMjc2NSA1LjMzNzIzTDIxLjUgMi40Mzk0NUwyNC4zOTc4IDEuNjYzIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE2IDEuNUM3Ljk5MTg3IDEuNSAxLjUgNy45OTE4NyAxLjUgMTZDMS41IDI0LjAwODEgNy45OTE4NyAzMC41IDE2IDMwLjVDMjQuMDA4MSAzMC41IDMwLjUgMjQuMDA4MSAzMC41IDE2QzMwLjUgMTAuNzM2OCAyNy42OTU4IDYuMTI4NTcgMjMuNSAzLjU4NzgyQzIzLjAxNzcgMy4yOTU3NSAyMi41MTcgMy4wMzEwMSAyMiAyLjc5NTczIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE0LjUgOFYxMUgxNy41VjgiIHN0cm9rZT0iIzIxMjUyOSIvPgo8L3N2Zz4K">
                                    </span>
                                    <span>환불</span>
                                </li>
                            </ul>
                        </div>
                        <div class="explan_info">
                            <p id="info">인디픽터 펀딩은 영화를 단순히 관람하는 것이 아닌 <strong>독립영화의 새로운 작품 제작 과정 지원·상영·사회적 가치</strong>를 확산해요.</p>
                        </div>
                    </div>
                    <!-- 펀딩 영화 정보 -->
                    <div class="movie_info">
                        <div>
                            <h4>프로젝트 시나리오</h4>
                        </div>
                        <div class="movie_text">
                            <h3>시놉시스</h3>
                            <p>
                                소년은 아버지의 사랑을 갈망하지만 아버지는 낚시에만 관심이 있다. 어느 날 아버지가 병으로 세상을 떠나자, 소년의 상실감은 아버지의 소유물에 대한 집착으로 변한다. 상상 속 동굴에서 소년은 아버지의 자전거와 낚싯대를 가져간 친척들을 저주하고 복수에 성공한다. 하지만 저주가 소년의 영혼을 집어삼키기 시작하는데… 감독의 어린 시절에서 영감을 받아 만든 이야기다.
                            </p>
                        </div>
                        <div class="movie_text">
                            <h3>연출의도</h3>
                            <p>
                                소년은 아버지의 사랑을 갈망하지만 아버지는 낚시에만 관심이 있다. 어느 날 아버지가 병으로 세상을 떠나자, 소년의 상실감은 아버지의 소유물에 대한 집착으로 변한다. 상상 속 동굴에서 소년은 아버지의 자전거와 낚싯대를 가져간 친척들을 저주하고 복수에 성공한다. 하지만 저주가 소년의 영혼을 집어삼키기 시작하는데… 감독의 어린 시절에서 영감을 받아 만든 이야기다.
                            </p>
                        </div>
                        <div class="movie_photo">
                            <h3>포토</h3>
                            <img src="/images/the_boy_1.jpg">
                            <img src="/images/the_boy_2.jpg">
                            <img src="/images/the_boy_3.jpg">
                        </div>
                        <span id="toggleMore" style="display: none">
                            <div class="movie_text">
                                <h3>감독 작품 경력</h3>
                                <img id="director_img" src="/images/the_boy_miyazaki.jpg">
                                <h5>미야자키 하야오</h5>
                                <p>
                                    [저주소년](2022)</br>
                                    [먼지요정 후와 무](2022)</br>
                                    [춤추는 개구리](2018)</br>
                                    [구어 구워](2013)</br>
                                    [오목어](2012)</br>
                                    [그믈](2009)[소이연](2007)</br>
                                    [볼록이 이야기](2003)</br>
                                    천지영[저주소년](2022)</br>
                                    [먼지요정 후와 무](2022)</br>
                                </p>
                            </div>
                            <div class="movie_text">
                                <h3>영화제 상영 및 수상작</h3>
                                <p>
                                    Palm Springs International ShortFest - Best Animated Short(2022)</br>
                                    Bengaluru International Short Film Festival - Second runner up Prize(2022)</br>
                                    제19회 서울인디애니페스트 – KIAFA 특별상(2022)제26회 부천국제판타스틱영화제(2022)</br>
                                    제24회 정동진독립영화제(2022)</br>
                                    제12회 서울배리어프리영화제(2022)</br>
                                    2022 Nshville Film Festival(2022)</br>
                                    2022 Philadelphia Film Festival(2022)2022 Uppsala Short Film Festival(2022)</br>
                                    2022 Animage International Animation Festival(2022)</br>
                                    2022 Foyle Film Festival(2022)</br>
                                    2022 Lanterna Mágica International Animation Festival(2022)</br>
                                    2023 Tashkent International AnimationForum - Best Family Short Animation Film(2023)</br>
                                    2023 Flickerfest International Short Film Festival(2023)</br>
                                    2023 Winter Cicle Film Festival(2023)</br>
                                    2023 New York International Children's Film Festival(2023)</br>
                                </p>
                            </div>
                            <div class="movie_text">
                                <h3>스태프</h3>
                                <table class="table table-bordered">
                                    <tbody>
                                    <tr>
                                        <th>감독</th>
                                        <td>Doe</td>
                                        <th>각본</th>
                                        <td>Doe</td>
                                    </tr>
                                    <tr>
                                        <th>촬영</th>
                                        <td>Moe</td>
                                        <th>조명</th>
                                        <td>Doe</td>
                                    </tr>
                                    <tr>
                                        <th>미술</th>
                                        <td>Dooley</td>
                                        <th>편집</th>
                                        <td>Doe</td>
                                    </tr>
                                    <tr>
                                        <th>사운드</th>
                                        <td>Dooley</td>
                                        <th>음악</th>
                                        <td>Doe</td>
                                    </tr>
                                    <tr>
                                        <th>의상</th>
                                        <td colspan="3">Dooley</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </span>
                        <button class="toggle_button" onclick="toggleMore()">프로젝트 더 보기</button>
                    </div>
                    <!-- 기대되는 영화 목록 -->
                    <div class="more_movie_all">
                        <h4>기대되는 좋은 영화들</h4>
                        <div class="row more_movie_list">
                            <div class="col-sm more_movie">
                            <img src="/images/the_boy_poster.jpg">
                            <p class="more_movie_achieve">70%달성</p>
                                <p class="more_movie_title">3월의 휴가</p>
                                <p class="more_movie_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="more_movie_directer">육상효</p>
                            </div>
                            <div class="col-sm more_movie">
                                <img src="/images/the_boy_poster.jpg">
                                <p class="more_movie_achieve">70%달성</p>
                                <p class="more_movie_title">3월의 휴가</p>
                                <p class="more_movie_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="more_movie_directer">육상효</p>
                            </div>
                            <div class="col-sm more_movie">
                                <img src="/images/the_boy_poster.jpg">
                                <p class="more_movie_achieve">70%달성</p>
                                <p class="more_movie_title">3월의 휴가</p>
                                <p class="more_movie_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="more_movie_directer">육상효</p>
                            </div>
                            <div class="col-sm more_movie">
                                <img src="/images/the_boy_poster.jpg">
                                <p class="more_movie_achieve">70%달성</p>
                                <p class="more_movie_title">3월의 휴가</p>
                                <p class="more_movie_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="more_movie_directer">육상효</p>
                            </div>
                        </div>
                        <div class="row more_movie_list">
                            <div class="col-sm more_movie">
                                <img src="/images/the_boy_poster.jpg">
                                <p class="more_movie_achieve">70%달성</p>
                                <p class="more_movie_title">3월의 휴가</p>
                                <p class="more_movie_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="more_movie_directer">육상효</p>
                            </div>
                            <div class="col-sm more_movie">
                                <img src="/images/the_boy_poster.jpg">
                                <p class="more_movie_achieve">70%달성</p>
                                <p class="more_movie_title">3월의 휴가</p>
                                <p class="more_movie_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="more_movie_directer">육상효</p>
                            </div>
                            <div class="col-sm more_movie">
                                <img src="/images/the_boy_poster.jpg">
                                <p class="more_movie_achieve">70%달성</p>
                                <p class="more_movie_title">3월의 휴가</p>
                                <p class="more_movie_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="more_movie_directer">육상효</p>
                            </div>
                            <div class="col-sm more_movie">
                                <img src="/images/the_boy_poster.jpg">
                                <p class="more_movie_achieve">70%달성</p>
                                <p class="more_movie_title">3월의 휴가</p>
                                <p class="more_movie_content">“따님은 어머님을 보거나 목소리를 들을 수 없고요.</p>
                                <p class="more_movie_directer">육상효</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="sell_info">
                        <div class="movie_category">
                            <p id="sharp">#</p>
                            <p id="category">애니메이션</p>
                        </div>
                        <div class="sell_img">
                            <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdCb3g9IjAgMCAyMCAyMCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik05LjYxNTIzIDQuNzg0OTVDOS42MTUyMyA0Ljc4NDk1IDEzLjA3NTIgNC4yNTk5NSAxNC4xNjAyIDMuMDY5OTVDMTQuODI1MiAyLjMzOTk1IDE0LjE1NTIgMS4yOTQ5NSAxMy4xOTUyIDEuNTM5OTVDMTIuNDU1MiAxLjcyNDk1IDExLjMxMDIgMi40MDk5NSA5LjYxNTIzIDQuNzg0OTVaIiBzdHJva2U9IiMwMDhFOTEiIHN0cm9rZS13aWR0aD0iMS4yOCIvPgo8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZD0iTTEwLjM4NDggNC43ODQ5NUMxMC4zODQ4IDQuNzg0OTUgNi45MjQ4MSA0LjI1OTk1IDUuODM5ODEgMy4wNjk5NUM1LjE3NDgxIDIuMzM5OTUgNS44NDQ4MSAxLjI5NDk1IDYuODA0ODEgMS41Mzk5NUM3LjUzOTgxIDEuNzI0OTUgOC42ODQ4MSAyLjQwOTk1IDEwLjM4NDggNC43ODQ5NVoiIHN0cm9rZT0iIzAwOEU5MSIgc3Ryb2tlLXdpZHRoPSIxLjI4Ii8+CjxwYXRoIGQ9Ik0xNi4yMjQ1IDE4LjAxNDlIMy43Njk1M0MzLjA3OTUzIDE4LjAxNDkgMi41MTk1MyAxNy40NTQ5IDIuNTE5NTMgMTYuNzY0OVY1LjQxOTkxQzIuNTE5NTMgNC43OTQ5MSAzLjAyOTUzIDQuMjg0OTEgMy42NTQ1MyA0LjI4NDkxSDE2LjMzNDVDMTYuOTU5NSA0LjI4NDkxIDE3LjQ2OTYgNC43OTQ5MSAxNy40Njk2IDUuNDE5OTFWMTYuNzY0OUMxNy40NzQ1IDE3LjQ0OTkgMTYuOTA5NSAxOC4wMTQ5IDE2LjIyNDUgMTguMDE0OVoiIGZpbGw9IiM0Q0RBREEiLz4KPHBhdGggZD0iTTE3Ljk4OTkgOC40Nzk5VjUuNTI0OUMxNy45ODk5IDQuODM0OSAxNy40Mjk5IDQuMjc0OSAxNi43Mzk5IDQuMjc0OUgzLjI1NDg4QzIuNTY0ODggNC4yNzQ5IDIuMDA0ODggNC44MzQ5IDIuMDA0ODggNS41MjQ5VjguNDc5OUgxNy45ODk5WiIgZmlsbD0iIzAwQkVCRSIvPgo8cGF0aCBkPSJNOS45ODUzNSA0LjIxOTk3VjE4LjAxNSIgc3Ryb2tlPSIjMDA4RTkxIiBzdHJva2Utd2lkdGg9IjEuMjgiLz4KPC9zdmc+Cg==">
                            <p>개봉완료! 현재 오프라인 상영중!</p>
                        </div>
                        <div class="sell_title">
                            <p id="movie_title">그대들은 어떻게 살 것인가?</p>
                        </div>
                        <div class="sell_content">
                            <p>어머니를 그리워하며 새로운 보금자리에 적응하던 주인공 "마히토"가 정체불명의 왜가리와 함께 저택의 신비로운 탑에 대한 이야기를 듣게 되는 작품을 기대해 주세요</p>
                        </div>
                        <div class="sell_archive">
                            <span>
                            <p id="sell_archive_percent">50</p>
                            <p id="sell_archive_frame">% 달성</p>
                            </span>
                            <span id="sell_dday"><p>70일 남음</p></span>
                        </div>
                        <div class="sell_fund_state">
                            <span>
                            <p id="sell_fund_price">1,430,000</p>
                            <p id="sell_fund_frame">원 달성</p>
                            </span>
                            <span id="sell_play"><p>28일 참여</p></span>
                        </div>
                        <div class="sell_period">
                            <span id="fund_type">
                                <p id="fund_period">진행기간</p>
                                <p id="show_period">오프라인 상영 기간</p>
                            </span>
                            <span id="period">
                                <p>23.08.30 ~ 23.12.13</p>
                                <p>23.10.15 ~ 23.10.30</p>
                            </span>
                        </div>
                    </div>
                    <div class="sell_ticket">
                        <div>
                            <h5>오프라인 티켓 구매</h5>
                            <div class="sell_ticket_type">
                                <h6>9000원</h6>
                                <p>[오프라인 티켓]</p>
                                <p>독립·예술영화를 아끼고 사랑하는 관객들을 위한 오프라인 상영 관람 티켓</p>
                                </br>
                                <div class="ticket_count">
                                    <div class="ticket_count_button">
                                        <button id="minus_button" onclick="count('minus')" disabled>-</button>
                                        <p id="count">0</p>
                                        <button id="plus_button" onclick="count('plus')">+</button>
                                    </div>
                                </div>
                                </br>
                                <p class="theater_info">- 영화관 안내</p>
                                <p id="theater_name">그린 아트 시네마</p>
                                <p id="theater_address">부산광역시 부산진구 부전제2동 521-10</p>
                                <p id="theater_number">051-000-0000</p>
                                </br>
                                <p class="parking_info">- 주차장 안내</p>
                                <p id="parking_detail">주차장이 협소할 수 있으니, 양해 부탁드립니다.</p>
                            </div>
                        </div>
                    </div>
                    <div class="sell_button">
                        <button type="button" class="sell_bookmark_button"><img src="images/heart.png"></button>
                        <button type="button" class="sell_ticket_button">영화 예매</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    // 펀딩 & 환불 버튼 클릭 시 해당 안내문 출력
    let selectInfo = document.querySelector("#info");
    let fundIcon = document.querySelector("#fund");
    let refundIcon = document.querySelector("#refund");
    let selectFundSrc = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTYuMDMxMjUgMjguODI0SDI1Ljk1OTJDMjcuMDU1MyAyOC44MjQgMjcuOTU5MiAyNy45MiAyNy45NTEyIDI2LjgyNFYxMy41SDI5VjlDMjkgNy44OTU0MyAyOC4xMDQ2IDcgMjcgN0g1QzMuODk1NDMgNyAzIDcuODk1NDMgMyA5VjEzLjUwMDFINC4wMzEyNVYyNi44MjRDNC4wMzEyNSAyNy45MjggNC45MjcyNSAyOC44MjQgNi4wMzEyNSAyOC44MjRaIiBmaWxsPSIjQjlFRUVFIi8+CjxwYXRoIGQ9Ik0xNiA2LjVDMTguMDMzIDQuMDE4NDkgMjAuMTIxMyAyLjcxMTEzIDIxLjExMTcgMi40NjM1M0MyMi42NDc3IDIuMDcxNTMgMjMuNzE5NyAzLjc0MzUzIDIyLjY1NTcgNC45MTE1M0MyMS45MjYxIDUuNzExNzYgMjAuODc5IDYuNDI0MDQgMTkuNSA2Ljg2NSIgc3Ryb2tlPSIjMjEyNTI5IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiLz4KPHBhdGggZD0iTTE2IDYuNUMxMy45MzY5IDMuOTcyMTcgMTEuODc3NiAyLjcxMzA5IDEwLjg4NjEgMi40NjM1M0M5LjM1MDE0IDIuMDcxNTMgOC4yNzgxNCAzLjc0MzUzIDkuMzQyMTQgNC45MTE1M0M5LjkwNzcyIDUuNTMxODUgMTEuMzMyNiA2LjMzMTg3IDEyLjUgNi44MDk4MiIgc3Ryb2tlPSIjMjEyNTI5IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiLz4KPHBhdGggZD0iTTQuMDMxMjUgMTMuNVYyNi44MjRDNC4wMzEyNSAyNy45MjggNC45MjcyNSAyOC44MjQgNi4wMzEyNSAyOC44MjRIMjUuOTU5MkMyNy4wNTUyIDI4LjgyNCAyNy45NTkyIDI3LjkyIDI3Ljk1MTIgMjYuODI0VjEzLjQ5OTkiIHN0cm9rZT0iIzIxMjUyOSIvPgo8cGF0aCBkPSJNMjguNzgzIDEzLjU2NzhWOC44Mzk4NEMyOC43ODMgNy43MzU4NCAyNy44ODcgNi44Mzk4NCAyNi43ODMgNi44Mzk4NEg1LjIwNzAzQzQuMTAzMDMgNi44Mzk4NCAzLjIwNzAzIDcuNzM1ODQgMy4yMDcwMyA4LjgzOTg0VjEzLjU2NzhIMjguNzgzWiIgc3Ryb2tlPSIjMjEyNTI5Ii8+CjxwYXRoIGQ9Ik0xNS45NzQ2IDYuNzUxOTVWMjguODI0IiBzdHJva2U9IiMyMTI1MjkiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIvPgo8L3N2Zz4K";
    let fundSrc = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTE2IDYuNUMxOC4wMzMgNC4wMTg0OSAyMC4xMjEzIDIuNzExMTMgMjEuMTExNyAyLjQ2MzUzQzIyLjY0NzcgMi4wNzE1MyAyMy43MTk3IDMuNzQzNTMgMjIuNjU1NyA0LjkxMTUzQzIxLjkyNjEgNS43MTE3NiAyMC44NzkgNi40MjQwNCAxOS41IDYuODY1IiBzdHJva2U9IiMyMTI1MjkiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIvPgo8cGF0aCBkPSJNMTYgNi41QzEzLjkzNjkgMy45NzIxNyAxMS44Nzc2IDIuNzEzMDkgMTAuODg2MSAyLjQ2MzUzQzkuMzUwMTQgMi4wNzE1MyA4LjI3ODE0IDMuNzQzNTMgOS4zNDIxNCA0LjkxMTUzQzkuOTA3NzIgNS41MzE4NSAxMS4zMzI2IDYuMzMxODcgMTIuNSA2LjgwOTgyIiBzdHJva2U9IiMyMTI1MjkiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIvPgo8cGF0aCBkPSJNNC4wMzEyNSAxMy41VjI2LjgyNEM0LjAzMTI1IDI3LjkyOCA0LjkyNzI1IDI4LjgyNCA2LjAzMTI1IDI4LjgyNEgyNS45NTkyQzI3LjA1NTIgMjguODI0IDI3Ljk1OTIgMjcuOTIgMjcuOTUxMiAyNi44MjRWMTMuNDk5OSIgc3Ryb2tlPSIjMjEyNTI5Ii8+CjxwYXRoIGQ9Ik0yOC43ODMgMTMuNTY3OFY4LjgzOTg0QzI4Ljc4MyA3LjczNTg0IDI3Ljg4NyA2LjgzOTg0IDI2Ljc4MyA2LjgzOTg0SDUuMjA3MDNDNC4xMDMwMyA2LjgzOTg0IDMuMjA3MDMgNy43MzU4NCAzLjIwNzAzIDguODM5ODRWMTMuNTY3OEgyOC43ODNaIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE1Ljk3NDYgNi43NTE5NVYyOC44MjQiIHN0cm9rZT0iIzIxMjUyOSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIi8+Cjwvc3ZnPgo=";
    let selectRefunSrc = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3QgeD0iNy41IiB5PSI3LjUiIHdpZHRoPSIxNyIgaGVpZ2h0PSIxNyIgcng9IjEiIGZpbGw9IiNCOUVFRUUiIHN0cm9rZT0iIzIxMjUyOSIvPgo8cGF0aCBkPSJNMjIuMjc2NSA1LjMzNzIzTDIxLjUgMi40Mzk0NUwyNC4zOTc4IDEuNjYzIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE2IDEuNUM3Ljk5MTg3IDEuNSAxLjUgNy45OTE4NyAxLjUgMTZDMS41IDI0LjAwODEgNy45OTE4NyAzMC41IDE2IDMwLjVDMjQuMDA4MSAzMC41IDMwLjUgMjQuMDA4MSAzMC41IDE2QzMwLjUgMTAuNzM2OCAyNy42OTU4IDYuMTI4NTcgMjMuNSAzLjU4NzgyQzIzLjAxNzcgMy4yOTU3NSAyMi41MTcgMy4wMzEwMSAyMiAyLjc5NTczIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE0LjUgOFYxMUgxNy41VjgiIHN0cm9rZT0iIzIxMjUyOSIvPgo8L3N2Zz4K";
    let refundSrc = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3QgeD0iNy41IiB5PSI3LjUiIHdpZHRoPSIxNyIgaGVpZ2h0PSIxNyIgcng9IjEiIHN0cm9rZT0iIzIxMjUyOSIvPgo8cGF0aCBkPSJNMjIuMjc2NSA1LjMzNzIzTDIxLjUgMi40Mzk0NUwyNC4zOTc4IDEuNjYzIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE2IDEuNUM3Ljk5MTg3IDEuNSAxLjUgNy45OTE4NyAxLjUgMTZDMS41IDI0LjAwODEgNy45OTE4NyAzMC41IDE2IDMwLjVDMjQuMDA4MSAzMC41IDMwLjUgMjQuMDA4MSAzMC41IDE2QzMwLjUgMTAuNzM2OCAyNy42OTU4IDYuMTI4NTcgMjMuNSAzLjU4NzgyQzIzLjAxNzcgMy4yOTU3NSAyMi41MTcgMy4wMzEwMSAyMiAyLjc5NTczIiBzdHJva2U9IiMyMTI1MjkiLz4KPHBhdGggZD0iTTE0LjUgOFYxMUgxNy41VjgiIHN0cm9rZT0iIzIxMjUyOSIvPgo8L3N2Zz4K";

    function selectFund(){
        selectInfo.innerHTML = "인디픽터 펀딩은 영화를 단순히 관람하는 것이 아닌 <strong>독립영화의 새로운 작품 제작 과정 지원·상영·사회적 가치</strong>를 확산해요.";
        fundIcon.src = selectFundSrc;
        refundIcon.src = refundSrc;
        console.log("펀드 클릭");
    }
    function selectRefund(){
        selectInfo.innerHTML = "<strong>영화 관람 전</strong> 결제 취소가 가능합니다.";
        fundIcon.src = fundSrc;
        refundIcon.src = selectRefunSrc;
        console.log("환불 클릭");
    }
    // 프로젝트 스토리 더보기 버튼
    function toggleMore() {
        let moreContent = document.getElementById("toggleMore");
        if (moreContent.style.display === "none") {
            moreContent.style.display = "inline";
        } else {
            moreContent.style.display = "none";
        }
    }
    // 티켓 수량 버튼
    function count(type){
        let minusButton = document.querySelector("#minus_button");
        let count = document.querySelector("#count");
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

        // 계산 끝난 number를 count.innerHTML에 지정하기
        count.innerHTML = number;
        console.log("number : " + number);
    }
</script>
</html>