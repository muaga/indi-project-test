package com.example.project_indi_test.port_one;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@Controller
public class PortController {

    // 환불 버튼
    @GetMapping("/refund")
    public String refundPage(){
        return "port-one/kakao_refund2";
    }
}
