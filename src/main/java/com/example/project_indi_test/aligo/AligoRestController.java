package com.example.project_indi_test.aligo;

import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@Controller
public class AligoRestController {

    public String apikey = "NCSFAD4KUN7NXV2H";

    public String secretKey = "as";

    public String userId = "nammmmu";

    public String sender = "01057600075";

    @PostMapping("/invite")
    @ResponseBody
    public ResponseEntity<Map<String, String>> inviteSms(@RequestBody Map<String, Object> requestBody) {
        try {
            // 클라이언트로부터 받은 유저, 메세지 내용
            String receiver = (String) requestBody.get("receiver");
            String msg = (String) requestBody.get("msg");
            String testmodeYn = "Y";

            // * 액세스 토큰 요청 ---> Server to Server
            RestTemplate rt1 = new RestTemplate();

            // 헤더 구성
            HttpHeaders headers1 = new HttpHeaders();
            headers1.add("Content-Type", "application/json;charset=UTF-8");
            headers1.add("Authorization", "HMAC-SHA256 apiKey=NCSAYU7YDBXYORXC, date=2019-07-01T00:41:48Z, salt=jqsba2jxjnrjor, signature=1779eac71a24cbeeadfa7263cb84b7ea0af1714f5c0270aa30ffd34600e363b4");

            // 바디 구성
            HashMap<String, String> params1 = new HashMap<>();
            params1.put("receiver", receiver);
            params1.put("sender", sender);
            params1.put("msg", msg); // 이 부분에서 imp_uid를 어떻게 획득하는지 확인이 필요합니다.
            params1.put("testmode_yn", testmodeYn);

            // 헤더 + 바디 결합 => HTTP MSG 완성
            HttpEntity<HashMap<String, String>> requestMsg1 = new HttpEntity<>(params1, headers1);

            // 요청 처리 - ResponseEntity로 응답이 된다.
            ResponseEntity<String> response1 = rt1.exchange("https://api.coolsms.co.kr/messages/v4/send", HttpMethod.POST, requestMsg1, String.class);

            System.out.println("============================");
            System.out.println("응답응답 : " + response1.getBody());
            System.out.println("============================");

            // 응답을 다시 클라이언트에게 전달
            return ResponseEntity.ok().body(Collections.singletonMap("message", "Refund request successful"));

        } catch (Exception e) {
            // 에러가 발생한 경우 클라이언트에게 에러 메시지 전달
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Collections.singletonMap("error", e.getMessage()));
        }
    }
}
