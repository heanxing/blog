package com.blog.action;

import com.blog.exception.AnException;
import com.blog.service.UserInfoService;
import com.blog.view.Result;
import com.blog.view.UserInfo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by heanxing on 2018/12/26.
 */
@Controller
@RequestMapping("admin")
public class UserInfoAction {
    private Logger log=Logger.getLogger(this.getClass());




    @Autowired
    private UserInfoService userInfoService;

    /**
     * 首页跳转登录页面
     */
    @RequestMapping("index.action")
    public String index() {
        return "admin/index";
    }

    @RequestMapping("login.action")
    public String login() {
        return "admin/login";
    }


    @RequestMapping("login.json")
    @ResponseBody
    public Result login2(ModelMap map, HttpServletRequest request) throws AnException {
        log.debug("我进来了");
        log.info("我进来了");
        log.error("我进来了");
        //1.获取参数
        String loginName= request.getParameter("login_name");
        String passWord= request.getParameter("pass_word");
        //2.校验参数
            //2.1判断参数是否为空
        if (StringUtils.isEmpty(loginName)||StringUtils.isEmpty(passWord)){
           throw new AnException("用 户和密码不能为空");

        }
             //2.2判断用户名是否正确
        UserInfo userInfo=userInfoService.selectUser(loginName,passWord);
        if (userInfo==null){
            throw new AnException("用户名或密码不正确");

        }
        //3.设置session
        request.getSession().setAttribute("userInfo",userInfo);
        //4返回状态码
        return Result.success().add("key","我是来测试的");

    }


    @RequestMapping("login_out.action")
    public String   loginOut(HttpSession session){
        session.invalidate();;
        return "admin/login";

    }





}
