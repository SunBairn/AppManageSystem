package com.zls.utils;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(urlPatterns = {},loadOnStartup = 2)
public class WebPathInitServlet extends HttpServlet {
    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        //在整体应用上下文当中存储了一个zls的值，用来引用上下文路径
        servletConfig.getServletContext().setAttribute("zls" ,servletConfig.getServletContext().getContextPath());
        super.init(servletConfig);
    }

}
