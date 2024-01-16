package com.example.project_indi_test.port_one;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;

// 토큰 받는 메소드
@Controller
public class PortOneToken {

//    @Value("${imp.rest-api.key}")
    private String apiKey;

//    @Value("${imp.rest-api.secret-key}")
    private String secretKey;


    // http://localhost:8080/getToken
    @GetMapping("/getToken")
    @ResponseBody
    public String portOneGetToken() {

        // * 액세스 토큰 요청 ---> Server to Server
        RestTemplate rt1 = new RestTemplate();
        // 헤더 구성
        HttpHeaders headers1 = new HttpHeaders();
        headers1.add("Content-Type", "application/json;charset=UTF-8" );
        // 바디 구성
        HashMap<String, String> params1 = new HashMap<String, String>();
        params1.put("imp_key", apiKey);
        params1.put("imp_secret", secretKey);

        // 헤더 + 바디 결합 => HTTP MSG 완성
        HttpEntity<HashMap<String, String>> requestMsg1
                = new HttpEntity<>(params1, headers1);
        System.out.println("HTTP MSG : " + requestMsg1);

        // 요청 처리 - ResponseEntity로 응답이 된다.
        ResponseEntity<String> response1  = rt1.exchange("https://api.iamport.kr/users/getToken", HttpMethod.POST, requestMsg1, String.class);

        System.out.println("===================================");
        System.out.println(response1.getHeaders());
        System.out.println(response1.getBody());
        System.out.println("===================================");
        //---------------------------------------------- 여기까지 토큰을 받기 위함

        return response1.getBody();
    }

    // 헤더와 바디를 잘 넣었는데, body를 인식하지 못하는 BadRequest 400이 뜬 이유
    // MultiValueMap -> key = List<Value>
    // HashMap -> key = value
    // 이라서 위의 apiKey를 배열로 인식했다. MultiValueMap을 썼을 때 위와 같은 오류가 뜰 때는 HashMap으로 사용해보자
}
