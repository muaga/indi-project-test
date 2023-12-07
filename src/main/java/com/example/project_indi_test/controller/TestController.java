package com.example.project_indi_test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

    @GetMapping("/")
    public String test(){
        return "test";
    }

    @GetMapping("/select-movie-day")
    public String selectMovieDay(){
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
}
