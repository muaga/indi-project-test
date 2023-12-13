package com.example.project_indi_test.code;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest

public class DateTest {

    @Test
    public void date_test () {
        String startDateString = "2023-12-25";
        String endDateString = "2024-01-02";

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // String -> Date 타입으로 변경시 패턴 지정
        LocalDate startDate = LocalDate.parse(startDateString, formatter);
        LocalDate endDate = LocalDate.parse(endDateString, formatter);

        List<LocalDate> dateList = generateDateList(startDate, endDate); // 시작 날짜와 끝 날짜 사이의 날짜를 List로 만들기

        // 출력
        for (LocalDate date : dateList) {
            System.out.println(date.format(formatter));
        }
    }

    private static List<LocalDate> generateDateList(LocalDate startDate, LocalDate endDate) {
        List<LocalDate> dateList = new ArrayList<>();
        LocalDate currentDate = startDate; // 시작 날짜를 현재로 지정

        while (!currentDate.isAfter(endDate)) { // 시작 날짜가 끝 날짜보다 이후가 아니라면 while 돌기(
            dateList.add(currentDate); // 날짜 List에 while 돌면서 담기기
            currentDate = currentDate.plusDays(1);
            // while이 돋 때 마다 시작 날짜 + 1일이 돌면서 endDate에 가까워 지면 while 종료
        }

        return dateList;
    }
}
