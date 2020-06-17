package org.macross.controller;

import org.macross.entity.JSONIO;
import org.macross.entity.shoppingcart;
import org.macross.service.IQueryGoods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

//PS:@SessionAttributes会与HttpServletrequest 原生Servlet对象冲突，两个最好不要一起用，一起用的话保证Session域的值不要一样
@Controller
@RequestMapping("/controller")
public class ShoppingCartController {
    @Autowired
    IQueryGoods queryGoods;

    @Autowired
    shoppingcart shoppingcart;

    @ResponseBody
    @RequestMapping(value = "AddToShoppingCart",produces = {"application/json;charset=UTF-8"})
    public String AddToShoppingCart(@RequestParam("id")String id, @RequestParam("uname")String unmae, @RequestParam("gname")String gname,
                                    @RequestParam("gprice")String gprice, @RequestParam("gsrc")String gsrc, @RequestParam("count")String number)
    {

//      {"id":$id,"uname":$uname,"gname":$gname,"gprice":$gprice,"gsrc":$gsrc,"count":$count}, jquery请求

        int int_gprice=Integer.parseInt(gprice);
        int gid= Integer.parseInt(id);
        int count = Integer.parseInt(number);
        int total_price=int_gprice*count;

        Date currentTime = new Date();
        //产生新的日期对象（使用System.currentTimeMillis()

        //新建日期格式
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        //将日期对象格式化成指定格式并以String输出
        String date = simpleDateFormat.format(currentTime);

        shoppingcart.setId(gid);
        shoppingcart.setUname(unmae);
        shoppingcart.setGname(gname);
        shoppingcart.setGprice(gprice);
        shoppingcart.setGsrc(gsrc);
        shoppingcart.setCount(count);
        shoppingcart.setTotal_price(total_price);
        shoppingcart.setDate(date);

        int result = queryGoods.addToshoppingCart(shoppingcart);
        if (result>0)
        {
            System.out.println("加入购物车成功！打印信息如下：");
            System.out.println(shoppingcart.toString());
            return "加入购物车成功！";
        }
        else
        {
            return "系统异常,加入购物车失败，请联系开发者！";
        }
    }

    @RequestMapping("QueryShoppingCartByName")
    public ModelAndView QueryShoppingCartByName(@RequestParam("name")String name,HttpServletRequest request)
    {
        ModelAndView modelAndView = new ModelAndView("redirect:/views/shoppingcart/user_shoppingcart.jsp");
        shoppingcart.setUname(name);
        List<shoppingcart> shoppingcarts = queryGoods.QueryShoppingCartByNameServlet(shoppingcart);
        int account=0;//计算用户总账单
        System.out.println("查询到用户购物车记录为：");
        for(shoppingcart shoppingcart:shoppingcarts)
        {
            System.out.println(shoppingcart.toString());
            account+=shoppingcart.getTotal_price();
        }
        request.getSession().setAttribute("shoppingcarts",shoppingcarts);
        request.getSession().setAttribute("account",account);

        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("DeleteGoodsByGidAndUname")
    public JSONIO DeleteGoodsByGidAndUname(@RequestParam("gid")String g_id, @RequestParam("uname")String uname, @RequestParam("gcount")String g_count,
                                           @RequestParam("date")String date, @RequestParam("total_price")String price, HttpServletRequest request)
    {
        int total_price = Integer.parseInt(price);
        int id=Integer.parseInt(g_id);
        int count=Integer.parseInt(g_count);
        shoppingcart.setUname(uname);
        shoppingcart.setId(id);
        shoppingcart.setCount(count);
        shoppingcart.setDate(date);

        int old_account= (int)request.getSession().getAttribute("account");
        int new_account=old_account-total_price;

        request.getSession().setAttribute("account",new_account);

        int result = queryGoods.DeleteGoodsByGidAndUname(shoppingcart);
        if (result > 0) {
            JSONIO jsonio=new JSONIO();
            jsonio.setResult("true");
            jsonio.setNew_account(new_account);
            return jsonio;

        } else {
            JSONIO jsonio=new JSONIO();
            jsonio.setResult("系统异常！请联系开发者");
            return jsonio;

        }
    }
}
