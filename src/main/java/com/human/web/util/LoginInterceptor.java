package com.human.web.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.human.web.vo.EmployeesVO;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        EmployeesVO employees = (EmployeesVO) session.getAttribute("employees");

        if (employees == null) {
            // session.setAttribute("msg", "로그인 세션이 만료되었습니다.");
            response.sendRedirect(request.getContextPath() + "/login.do");
            return false;
        }
        return true;
    }
}
