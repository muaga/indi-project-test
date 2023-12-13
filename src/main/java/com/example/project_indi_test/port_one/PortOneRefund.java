package com.example.project_indi_test.port_one;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@Controller
public class PortOneRefund {

    @Value("${imp.rest-api.key}")
    private String apiKey;

    @Value("${imp.rest-api.secret-key}")
    private String secretKey;

    private String token = "35370e053432f24e9f016142c2fa6368418108c4";

    private String impUid = "imp81816223";


    // http://localhost:8080/wantRefund
    @PostMapping("/wantRefund")
    @ResponseBody
    public ResponseEntity<Map<String, String>> wantRefund(@RequestBody Map<String, Object> requestBody) {
        try {
            // 클라이언트로부터 받은 주문번호, 환불사유, 환불금액
            String merchantUid = (String) requestBody.get("merchant_uid");
            String reason = (String) requestBody.get("reason");
            String cancelRequestAmountString = requestBody.get("cancel_request_amount").toString();

            // * 액세스 토큰 요청 ---> Server to Server
            RestTemplate rt1 = new RestTemplate();

            // 헤더 구성
            HttpHeaders headers1 = new HttpHeaders();
            headers1.add("Content-Type", "application/json;charset=UTF-8");
            headers1.add("Authorization", token);

            // 바디 구성
            HashMap<String, String> params1 = new HashMap<>();
            params1.put("reason", reason);
            params1.put("merchant_uid", merchantUid); // 이 부분에서 imp_uid를 어떻게 획득하는지 확인이 필요합니다.
            params1.put("amount", cancelRequestAmountString);

            // 헤더 + 바디 결합 => HTTP MSG 완성
            HttpEntity<HashMap<String, String>> requestMsg1 = new HttpEntity<>(params1, headers1);

            // 요청 처리 - ResponseEntity로 응답이 된다.
            ResponseEntity<String> response1 = rt1.exchange("https://api.iamport.kr/payments/cancel", HttpMethod.POST, requestMsg1, String.class);

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


