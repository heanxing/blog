package com.blog.Interceptor;

import com.blog.view.UserInfo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by heanxing on 2018/12/28.
 */

/**
 * 拦截器
 */
public class RequstInterceptor implements HandlerInterceptor {
    /**
     * 执行Handler方法之前执行
     * 用于身份认证、身份授权
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        //1.0获取请求地址
        String url = request.getRequestURI();
        //2.0对特殊地址，直接放行
        if (url.indexOf("login") >= 0){
            return true;


        }
        //3.0判断session存在的话，登录后台
        HttpSession session= request.getSession();
        UserInfo userInfo= (UserInfo) session.getAttribute("userInfo");
        if (userInfo != null){
            //角色存在
            return true;

        }
        //4.0执行这里表示用户身份需要验证，跳转到登录界面
        request.getRequestDispatcher("/WEB-INF/page/admin/login.jsp").forward(request,response);



        return false;

    }


    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {

    }

    /**
     * 执行Handler完成后，执行此方法
     * 应用场景：统一异常处理，统一日志处理
     */
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {

    }




}
