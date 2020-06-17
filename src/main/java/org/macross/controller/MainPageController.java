package org.macross.controller;


import org.macross.entity.Page;
import org.macross.entity.User;
import org.macross.entity.apple;
import org.macross.service.IQueryGoods;
import org.macross.service.IVerifyLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@SessionAttributes(value = {"p","target_apple","User"})
@Controller
@RequestMapping("/controller")
public class MainPageController {

    @Autowired
    Page page;

    @Autowired
    IQueryGoods queryGoods;

    @Autowired
    apple apple;

    @Autowired
    IVerifyLogin verifyLogin;

    @Autowired
    User user;


    @RequestMapping("QueryGoodsByPage")
    public ModelAndView QueryGoodsByPage(HttpServletRequest request)
    {
        int count = 15; //总数为15
        int pageSize =5; //页面大小为5
        int TotalPage=3; //总页数为3

        String cPage = request.getParameter("currentPage");
        if(cPage == null)
        {
            cPage = "0";
        }
        int currentPage = Integer.parseInt(cPage);
        page.setPageSize(pageSize);
        page.setStartId(currentPage*pageSize);
        List<apple> apples = queryGoods.queryGoodsByPage(page);

        page.setCurrentPage(currentPage);
        page.setTotalCount(count);
        page.setTotalPage(TotalPage);
        page.setPageSize(pageSize);
        page.setApples(apples);

        ModelAndView modelAndView = new ModelAndView("redirect:/views/pyg/pygIndex.jsp");
        modelAndView.addObject("p",page);
        return modelAndView;
    }

    @RequestMapping("QueryUserinfoByusername")
    public ModelAndView QueryUserinfoByusername(@RequestParam("name")String name)
    {
        ModelAndView modelAndView = new ModelAndView("redirect:/views/login/UpdateUserinfo.jsp");
        user.setUsername(name);
        User target_user = verifyLogin.queryUserinfoByusername(user);
        modelAndView.addObject("User",target_user);
        return modelAndView;
    }
    @ResponseBody
    @RequestMapping(value = "UpdateUserinfo",produces = {"application/json;charset=UTF-8"})//返回字符串为中文处理
    public String UpdateUserinfo(@RequestParam("name")String name,@RequestParam("mobile")String mobile,@RequestParam("password")String password,
                                 @RequestParam("repassword")String repassword,@RequestParam("address")String address)
    {
        String callback =null;
        if(password.length()>0)//需要更改密码情况
        {
            if(password.equals(repassword))
            {
                user.setUsername(name);
                user.setUsermobilephone(mobile);
                user.setUserpassword(password);
                user.setUseraddress(address);
                int result = verifyLogin.updateUserinfoByusername(user);
                if(result>0)
                {
                    System.out.println("修改成功！信息如下："+user.toString());

                    return ("修改成功！");
                }
                else {
                    return ("修改失败，系统异常！");
                }

            }
            else
            {
                return ("输入的两次密码不一致！");
            }
        }else
        {
            user.setUsername(name);
            user.setUsermobilephone(mobile);
            user.setUseraddress(address);

            int result = verifyLogin.UpdateUserinfoWithoutPwd(user);
            if(result>0)
            {
                System.out.println("修改成功！信息如下："+user.toString());
                return ("修改成功！");
            }
            else {
                return ("修改失败，系统异常！");
            }
        }
    }

    @ResponseBody
    @RequestMapping("QueryGoodsByPageServletWithAjax")
    public List<apple> QueryGoodsByPageServletWithAjax(@RequestParam("currentPage")String cPage){

        int pageSize =5; //页面大小为5
        int currentPage = Integer.parseInt(cPage);
        page.setPageSize(pageSize);
        page.setStartId(currentPage*pageSize);
        List<apple> apples = queryGoods.queryGoodsByPage(page);

        return apples;
    }

    @RequestMapping("QueryGoodDetailsByg_id")
    public ModelAndView QueryGoodDetailsByg_id(@RequestParam("g_id")String g_id,HttpServletRequest request)
    {
        ModelAndView modelAndView = new ModelAndView("redirect:/views/pyg/goods_details.jsp");
        int goods_id = Integer.parseInt(g_id);
        apple.setG_id(goods_id);
        apple target_apple = queryGoods.queryGoodDetailsByg_id(apple);
        modelAndView.addObject("target_apple",target_apple);
        return modelAndView;
    }


}
