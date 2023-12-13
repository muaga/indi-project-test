package com.example.project_indi_test.code;

import com.example.project_indi_test.port_one.TokenDTO;
import net.minidev.json.parser.JSONParser;
import net.minidev.json.parser.ParseException;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;

@SpringBootTest
public class tokenTest {


    //    @Value("${imp.rest-api.key}")
    private String apiKey = "5064237412678407";

    //    @Value("${imp.rest-api.secret-key}")
    private String secretKey = "k4MtJ9y69ErPEGGhWQdE41KIFktLgp9uzgGXE8XMVUL0F4kZKzmCE7p8fsv0G8L2UDs5iLW3LYXdNUrE";
    @Test
    public void contextLoads() throws ParseException, JSONException {
        // * 액세스 토큰 요청 ---> Server to Server
        RestTemplate rt1 = new RestTemplate();
        // 헤더 구성
        HttpHeaders headers1 = new HttpHeaders();
        headers1.add("Content-Type", "application/json;charset=UTF-8" );
        // 바디 구성
        HashMap<String, String> params1 = new HashMap<String, String>();
        params1.put("imp_key", apiKey);
        System.out.println("apiKey" + apiKey);
        params1.put("imp_secret", secretKey);
        System.out.println("secretKey" + secretKey);

        // 헤더 + 바디 결합 => HTTP MSG 완성
        HttpEntity<HashMap<String, String>> requestMsg1
                = new HttpEntity<>(params1, headers1);
        System.out.println("HTTP MSG : " + requestMsg1);

        // 요청 처리 - ResponseEntity로 응답이 된다.
        ResponseEntity<TokenDTO> response1  = rt1.exchange("https://api.iamport.kr/users/getToken", HttpMethod.POST, requestMsg1, TokenDTO.class);

        System.out.println("===================================");
        System.out.println(response1.getHeaders());
        System.out.println(response1.getBody());
        System.out.println("===================================");
        //---------------------------------------------- 여기까지 토큰을 받기 위함

        System.out.println("토큰 DTO에 넣은 값 : " + response1.getBody().getAccessToken());
    }
}
