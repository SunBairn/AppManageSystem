package com.zls.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/backend")
public class BackendController {
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "backend/login";
    }
}
