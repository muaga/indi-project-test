package com.example.project_indi_test.code;

import org.junit.jupiter.api.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class TimeTest {

    @Test
    public void time_test() {

        // 시작 시간 입력 받기
        String startTimeStr = "13:14"; // => FlatPicker에서 시간 받는 거 하기

        // 소요 시간 입력 받기
        int durationMinutes = 89;

        // 시작 시간을 Date 객체로 변환
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
        Date startTime;
        try {
            startTime = dateFormat.parse(startTimeStr);
        } catch (Exception e) {
            System.err.println("올바른 시간 형식이 아닙니다. HH:mm 형식으로 입력하세요.");
            return;
        }

        // 끝나는 시간 계산
        long endTimeMillis = startTime.getTime() + (durationMinutes * 60 * 1000);
        Date endTime = new Date(endTimeMillis);

        // 결과 출력
        System.out.println("끝나는 시간: " + dateFormat.format(endTime));
    }
}
