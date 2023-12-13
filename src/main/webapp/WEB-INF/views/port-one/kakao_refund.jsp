<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>그대들은 어떻게 살 것인가</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 카카오 결제하기  -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- 카카오 환불하기   -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <style>

    </style>
</head>
<body>
<!-- 환불하기 버튼 생성 -->
<button onclick="cancelPay()">환불하기</button>

<script>
    // 카카오 페이 환불 요청
    async function cancelPay() {
        try {
            const response = await fetch("/wantRefund", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    "merchant_uid": "order_no_0002",
                    "cancel_request_amount": 8000,
                    "reason": "테스트 결제 환불",
                }),
            });

            if (response.ok) {
                console.log("성공이닷");
            } else {
                console.error("환불 실패:", response.status, response.statusText);
                response.status(500).json(/* 오류 응답 생성 */);
            }
        } catch (error) {
            console.error("Ajax 요청 중에 오류 발생:", error);
            // 여기서 에러를 적절하게 처리하거나, 필요에 따라 다른 동작 수행

        }
    }

</script>
</body>
</html>
