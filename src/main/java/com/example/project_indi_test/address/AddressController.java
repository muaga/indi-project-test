package com.example.project_indi_test.address;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AddressController {

   @GetMapping("/address-send")
    public String aligo(){
       return "address/address";
   }
}
