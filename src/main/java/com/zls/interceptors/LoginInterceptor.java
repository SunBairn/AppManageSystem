package com.zls.interceptors;

import com.zls.pojo.DevUser;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取请求的URL
        String url=request.getRequestURI();
        //除了webapp下的index.jsp可以访问，其他都将被拦截
        if ((url.indexOf("/index")>=0||url.indexOf("/dev/toLogin")>=0||url.indexOf("/backend/toLogin")>=0||url.indexOf("/dev/login")>=0)&&url.indexOf("/app/index")<0){
            return true;
        }
        //获取session
        HttpSession session=request.getSession();
        DevUser devUser= (DevUser) session.getAttribute("devUser");
        if (devUser!=null){
           return true;
        }
        request.getRequestDispatcher("/403.jsp").forward(request,response);
        return false;
    }
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
