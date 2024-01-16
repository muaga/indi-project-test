<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>문자 보내기</title>
</head>
<body>

<div>
    <button onclick="sendSms()">문자 보내기</button>
</div>

<script>
    // 문자 요청
    async function sendSms() {
        try {
            const response = await fetch("/invite", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    "receiver": "01057600075",
                    "msg": "문자 테스트 중입니다.",
                }),
            });

            if (response.ok) {
                console.log("성공이닷");
            } else {
                console.error("문자 전송:", response.status, response.statusText);
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