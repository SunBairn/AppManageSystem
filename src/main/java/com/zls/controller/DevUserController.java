package com.zls.controller;

import com.zls.pojo.DevUser;

import com.zls.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/dev")
public class DevUserController {
    @Autowired
    private DevUserService devUserService;

    @RequestMapping("/toLogin")
    public String toLogin(DevUser devUser) {
        return "dev/login";
    }

    @RequestMapping("/login")
    public String login(DevUser devUser, Model model, HttpSession session) {
        devUser = devUserService.login(devUser);
        if (devUser != null) {
            //登录成功
            model.addAttribute("devUser", devUser);
            session.setAttribute("devUser", devUser);
            return "dev/index";
        } else {
            //登录失败
//            model.addAttribute("errMsg", "登录失败");
            return "dev/login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("devUser");
        session.invalidate();
        return "redirect:/";
    }

}
