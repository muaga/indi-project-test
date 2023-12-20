package com.example.project_indi_test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.ArrayList;
import java.util.List;

@Controller
public class TestController {

    @GetMapping("/")
    public String test(Model model){
        Test test1 = Test.builder()
                .username("ssar")
                .password("1234")
                .build();
        Test test2 = Test.builder()
                .username("cos")
                .password("1234")
                .build();

        List<Test> tests = new ArrayList<>();
        tests.add(test1);
        tests.add(test2);

        TestDTO testDTO = TestDTO.builder()
                .tests(tests)
                .build();

        model.addAttribute("testDTO", testDTO);

        return "test/test";
    }

    @GetMapping("/select-movie-day")
    public String selectMovieDay(){

        System.out.println("==================================");
        System.out.println("카카오페이 결제 완료");
        System.out.println("==================================");

        return "pay/select_movie_day";
    }

    @GetMapping("/select-movie-pay")
    public String selectMoviePay(){
        return "pay/select_movie_pay";
    }

    @GetMapping("/reservation-ticket")
    public String reservationTicket(){
        return "pay/reservation_ticket";
    }
    @GetMapping("/video")
    public String video(){
        return "video/video";
    }

    @GetMapping("/on-detail")
    public String onDetail(){
        return "fund-detail/online-detail";
    }

    @GetMapping("/off-detail")
    public String offDetail(){
        return "fund-detail/offline-detail";
    }

    @GetMapping("/cart")
    public String cart(){
        return "pay/cart";
    }

    @GetMapping("/select-seat")
    public String selectSeat(){
        return "reservation/select_seat";
    }
////////////////////////////////////////////////////////////////////////////////////

    // 온라인 결제 화면 요청(GET)
    @GetMapping("/{movieId}/on")
    public String onPayment(@PathVariable Integer movieId, Model model){
        return "payment/on_payment";
    }

}

