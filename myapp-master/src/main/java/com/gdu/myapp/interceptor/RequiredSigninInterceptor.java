package com.gdu.myapp.interceptor;

import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class RequiredSigninInterceptor implements HandlerInterceptor {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    
    HttpSession session = request.getSession();
    if(session.getAttribute("emp") == null) {
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      out.println("<script>");
      out.println("location.href='" + request.getContextPath() + "/';");
      out.println("</script>");
      out.flush();
      out.close();
      return false;
    }
    
    return true;
    
  }
  
}
