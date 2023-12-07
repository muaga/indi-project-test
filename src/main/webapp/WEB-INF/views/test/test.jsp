<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>더 보기 예제</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        #more-content {
            display: none;
        }
        .test{
            background-image: url("../../../../resources/static/images/heart.png");
            height: 50px;
            width: 50px;
       }
    </style>
</head>s
<body>

<div class="container mt-4">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">내용</h5>
            <p class="card-text">
                기본 내용은 여기에 있습니다.
            </p>
            <span id="more-content">
                        추가적인 내용이 여기에 있습니다. 이 부분은 초기에 숨겨져 있습니다.
            </span>
        </div>
        <div class="test">
            <p>여기</p>
        </div>
        <button class="btn btn-primary" onclick="toggleMore()">더 보기</button>
    </div>
</div>

<script>
    function toggleMore() {
        var moreContent = document.getElementById("more-content");
        if (moreContent.style.display === "none") {
            moreContent.style.display = "inline";
        } else {
            moreContent.style.display = "none";
        }
    }
</script>

</body>
</html>
