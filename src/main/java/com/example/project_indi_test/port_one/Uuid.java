package com.example.project_indi_test.port_one;

import java.util.UUID;

public class Uuid {

    void contextLoads() {
        String uuid4 = UUID.randomUUID().toString().replace("-", ""); // merchant_uid
        String splitUuid4 = uuid4.substring(0, 10); // 예매번호로 사용하기

        System.out.println("==================");
        System.out.println(uuid4);
        System.out.println("==================");
        System.out.println(splitUuid4);
    }
}