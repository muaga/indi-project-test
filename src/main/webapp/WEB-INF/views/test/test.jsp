<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>더 보기 예제</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .main {
            display: flex;
            justify-content: center;
        }
        .box{
            background-color: #4BE2A7;
            height: 50px;
            width: 50px;
            color: black;
            margin-bottom: 20px;
            text-align: center;
            margin-right: 10px;
       }
    </style>
</head>
<body>

<c:forEach var="test" items="${testDTO.tests}" >
    <div class="main">
        <div class="box">${test.username}</div>
        <div class="box">${test.password}</div>
        <br>
    </div>
</c:forEach>

    <div class="main" id="container">
    </div>


<script>

    changeTest1 = {
        username: "you",
        password: "1234"
    };

    changeTest2 = {
        username: "main",
        password: "1234"
    };

    changeTest3 = {
        username: "we",
        password: "1234"
    };

    changeTests = [
        changeTest1,
        changeTest2,
        changeTest3
    ];


    window.onload = function () {
        change(changeTests);
    }

    function change (changeTests){

        let container = document.getElementById('container');


        changeTests.forEach(function (test, index) {
                console.log("test : " + test.username);
                console.log("test : " + test.password);

            let div1 = document.createElement('div');
            div1.className = "box";
            div1.innerHTML = test.username;

            let div2 = document.createElement('div');
            div2.className = "box";
            div2.innerHTML = test.password;

            container.appendChild(div1);
            container.appendChild(div2);
        });
    }
</script>

</body>
</html>
