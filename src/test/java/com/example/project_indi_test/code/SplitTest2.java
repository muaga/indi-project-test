package com.example.project_indi_test.code;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest
public class SplitTest2 {

    @Test
    public void date_test () {
        List<String> seatList = new ArrayList<>();

        seatList.add("A1");
        seatList.add("A2, A3");
        seatList.add("A4, A5, A6");
        seatList.add("A7, A8, A9, A10");
        seatList.add("A11, A12, A13, A14, A15");


        List<String> unitSplitSeatList = new ArrayList<>();
        for (String seat : seatList) {
            String[] splits = seat.split(",");
            for (String split : splits) {
                String unitSeat = split.trim();
//                System.out.println("split = " + unitSeat);
                unitSplitSeatList.add(unitSeat);
            }
        }

        for (String unitSeat : unitSplitSeatList){
//            System.out.println("unitSeat : " + unitSeat);
        }
    }
}
