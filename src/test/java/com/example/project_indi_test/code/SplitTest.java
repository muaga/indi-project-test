package com.example.project_indi_test.code;

import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
public class SplitTest {

    @Test
    public void split_Test(){
        List<String> seatList = new ArrayList<>();

        seatList.add("A1");
        seatList.add("A2, A3");
        seatList.add("A4, A5, A6");
        seatList.add("A7, A8, A9, A10");
        seatList.add("A11, A12, A13, A14, A15");


        List<String> splitSeatList = new ArrayList<>();
        for(String seat : seatList){
            String[] splits = seat.split(",");
            for (String split : splits){
                System.out.println("split = " + split);
            }
        }

    }
}
