package org.macross.controller;

import org.macross.entity.User;
import org.macross.service.IVerifyLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.regex.Pattern;


@Controller
@RequestMapping("/controller")
public class RegisterAndLoginController {

    @Autowired
    IVerifyLogin verifyLogin;

    @Autowired
    User user;

    @ResponseBody
    @RequestMapping(value = "Register")
    public String Register(@RequestParam("name")String name,@RequestParam("mobile")String mobile,@RequestParam("password")String password,
                           @RequestParam("repassword")String repassword,@RequestParam("address")String address){

        String result=null;
        if(password.equals(repassword)){

            user.setUsername(name);
            user.setUsermobilephone(mobile);
            user.setUserpassword(password);
            user.setUseraddress(address);
            int count = verifyLogin.register(user);
            if(count>0){
                System.out.println("注册成功！信息如下："+user.toString());
                result="true";
            }
        }else {
            System.out.println("false");
            result="false";
        }
        return result;
    }

    @RequestMapping(value = "Login")
    public ModelAndView Login(@RequestParam(value = "uname")String name, @RequestParam(value = "upwd")String password,
                              @RequestParam(value = "checkcode")String checkcodeClient, HttpServletRequest request)
    {
        String checkcodeServer =(String) request.getSession().getAttribute("CHECKCODE");


        int result=0;

        if(checkcodeClient.length()==0)
        {
            String error0="请输入验证码";
            ModelAndView modelAndView = new ModelAndView("login/error");
            modelAndView.addObject("error0",error0);
            return modelAndView;
        }else
        {
            if(checkcodeServer.equals(checkcodeClient))
            {
                if(isInteger(name)){//判断使用用户名登录还是手机号登录
                    user.setUsermobilephone(name);
                    user.setUserpassword(password);
                    result = verifyLogin.userLoginWithMobilephone(user);
                }
                else {
                    user.setUsername(name);
                    user.setUserpassword(password);
                    result=verifyLogin.userLoginWithName(user);
                }


                if(result>0)
                {
                    request.getSession().setAttribute("uname",name);
                    request.getSession().setAttribute("upwd",password);

                    System.out.println("用户："+name+"的sessionId:"+request.getSession().getId());
                    request.getSession().setMaxInactiveInterval(1800);//30分钟

                    ModelAndView modelAndView = new ModelAndView("forward:/controller/QueryGoodsByPage");
                    return modelAndView;
                }
                else
                {

                    String error2="账号或密码输入错误";
                    ModelAndView modelAndView = new ModelAndView("login/error");
                    modelAndView.addObject("error2",error2);
                    return modelAndView;

                }

            }
            else {
                String error1="验证码输入错误";
                ModelAndView modelAndView = new ModelAndView("login/error");
                modelAndView.addObject("error1",error1);
                return modelAndView;
            }
        }

    }
    //    判断字符串是否为纯数字：
    public static boolean isInteger(String str) {
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
        return pattern.matcher(str).matches();
    }
    //    中文乱码解决
    public static String encodeStr(String str) {
        try {
            return new String(str.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

}
