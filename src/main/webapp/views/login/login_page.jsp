<%--
  Created by IntelliJ IDEA.
  User: MACROSS
  Date: 2020/5/28
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>品优购登录</title>
    <link rel="shortcut icon" href="image/品优购网页图标.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/login_page.css">
    <style>
        @font-face {
            font-family: 'iconfont';
            /* project id 1848240 */
            src: url(http://at.alicdn.com/t/font_1848240_e9zrzfskeit.eot);
            src: url(http://at.alicdn.com/t/font_1848240_e9zrzfskeit.eot?#iefix) format('embedded-opentype'),
            url(http://at.alicdn.com/t/font_1848240_e9zrzfskeit.woff2) format('woff2'),
            url(http://at.alicdn.com/t/font_1848240_e9zrzfskeit.woff) format('woff'),
            url(http://at.alicdn.com/t/font_1848240_e9zrzfskeit.ttf) format('truetype'),
            url(http://at.alicdn.com/t/font_1848240_e9zrzfskeit.svg#iconfont) format('svg');
        }
    </style>
</head>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script>
    // function reloadCheckImg()
    // {
    //     // $("img").attr("src", "./CheckCode/img.jsp?t="+(new Date().getTime()));  //<img src="...">
    //     // $("#checkcode").empty();
    //     // $("#checkcode").append("<img src='./CheckCode/img.jsp?t='"+(new Date().getTime())+"  class='input-checkcodeimg'  >");
    //     // var obj1=document.getElementById('checkcode');
    //     // obj1.innerHTML='';
    //     $("#checkcode").append("<img src='./CheckCode/img.jsp?t='"+(new Date().getTime())+"  class='input-checkcodeimg'  >");
    //     // $("#checkcode").append("<a>test</a>");
    //     alert("ok!")
    // }
    $(document).on('click','span',function(){
        //图片的点击事件
        $("#checkcode").empty();
        $("#checkcode").append("<img src='./CheckCode/img.jsp?t='"+(new Date().getTime())+"  class='input-checkcodeimg'  >");
        // $("#checkcode").append("<id='checkcode'>");
    });

    // $(document).ready(function () {
    //     $("#checkcodeID").blur(function () {
    //
    //         var $checkcode = $("#checkcodeID").val();
    //         $.post(
    //             "../../CheckCodeServlet",
    //             "checkcode="+$checkcode,
    //             function (result) {
    //                 if(result=="false")
    //                     alert("验证码识别错误");
    //             }
    //         )
    //
    //     })
    // });

    // function login() {
    //     var $checkcode = $("#checkcodeID").val();
    //     var $uname = $("#uname").val();
    //     var $upwd = $("#upwd").val();
    //     $.post(
    //         "../../loginServlet",
    //         {"name":$uname,"password":$upwd,"checkcode":$checkcode},
    //         function (result) {
    //             if(result=="false")
    //                 alert("验证码识别错误");
    //             else if(result=="true"){
    //                 // location.href="../../QueryGoodsByPageServlet";
    //                 window.location.href="../../QueryGoodsByPageServlet";
    //             }
    //             else {
    //                 alert("账号或密码错误");
    //             }
    //         }
    //     )
    // };


</script>
<body>
<%!
    String uname;
    String upwd;
%>
<%
    //boolean flag = false;
//    Cookie[] cookies =request.getCookies();
//    if(cookies!=null){
//        System.out.println(cookies);
//        for(Cookie cookie:cookies){
//            System.out.println(cookie.getName()+cookie.getValue());
//            if(cookie.getName().equals("uname"))
//            {
//                uname = cookie.getValue();
//                //flag = true;
//
//            }
//            if(cookie.getName().equals("upwd"))
//            {
//                upwd = cookie.getValue();
//
//                //flag = true;
//            }
//        }
//    }
    String uname= (String) request.getSession().getAttribute("uname");
    String upwd=(String) request.getSession().getAttribute("upwd");
%>
<a class="pin" href=""><img src="img/logo.png" alt=""></a>
<div class="big-box">
    <div class="big-box-li">
        <div class="content-box">
            <i class="tab-a" id="register-1"></i>
            <i class="tab-b" id="register-2"></i>
            <div class="register">
                <a href="#register-1" class="register-a">扫描登录</a>|
                <a href="#register-2" class="register-b">账户登录</a>
            </div>
            <div class="register-scan position"><br>
                <span class="span-a">请用手机app扫描一下二维码登录</span><br>
                <img src="大作业image/images/wx_cz.jpg" alt="">
            </div>
            <div class="register-account position">
                <span class="span-b">公共场所不建议自动登录，以免账号丢失</span>
                <div class="account-content">
                    <form action="../../controller/Login" method="post">
                    <i class="before iconfont">&#xe627;</i><input class="input input-name" type="text"
                                                                  placeholder="邮箱/用户名/手机号" name="uname" id="uname" value="<%=(uname==null?"":uname)%>"><br>
                    <i class="before iconfont">&#xe62e;</i><input class="input input-name" type="password"
                                                                  placeholder="请输入密码" name="upwd" id="upwd" value="<%=(uname==null?"":upwd)%>"><br>
                    <i class="before iconfont">&#xe60d;</i><input class="input input-name" type="text"
                                                                  placeholder="请输入验证码" name="checkcode"  id="checkcodeID">
<%--                    <a href="javascript:reloadCheckImg();"><img src="./CheckCode/img.jsp" class="input-checkcodeimg" ></a>--%>
<%--                    <span href="javascript:reloadCheckImg(); " "><img src="./CheckCode/img.jsp" class="input-checkcodeimg"  ></span>--%>
                    <span  id="checkcode" onclick="reloadCheckImg()"><img src="./CheckCode/img.jsp" class="input-checkcodeimg"  ></span>
                    <br>

                    <input type="checkbox" id="click" checked >
                    <label for="click" >记住密码</label>
                    <a  class="account-password" onclick="reloadCheckImg()">忘记密码？</a><br>
<%--                    <button class="input" type="submit" >登录</button>--%>
                    <button class="input" type="submit"  >登录</button>

                    </form>
                </div>
                <div class="bottom">
                    <a href=""><i class="bottom-i qq"></i></a>
                    <a href=""><i class="bottom-i microblog"></i></a>
                    <a href=""><i class="bottom-i alipay"></i></a>
                    <a href=""><i class="bottom-i wechat"></i></a>
                    <a href="register.html" class="register-bottom">立即注册</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="navigation-box">
    <div class="navigation">
        <div class="navigation-li">
            <div class="page-bottom">
                <li class="page-bottom-li"><a href="">关于我们</a>|</li>
                <li class="page-bottom-li"><a href="">联系我们</a>|</li>
                <li class="page-bottom-li"><a href="">联系客服</a>|</li>
                <li class="page-bottom-li"><a href="">商家入驻</a>|</li>
                <li class="page-bottom-li"><a href="">营销中心</a>|</li>
                <li class="page-bottom-li"><a href="">手机品优购</a>|</li>
                <li class="page-bottom-li"><a href="">友情链接</a>|</li>
                <li class="page-bottom-li"><a href="">销售联盟</a>|</li>
                <li class="page-bottom-li"><a href="">品优购社区</a>|</li>
                <li class="page-bottom-li"><a href="">品优购公益</a>|</li>
                <li class="page-bottom-li"><a href="">English Site</a>|</li>
                <li class="page-bottom-li"><a href="">Contact U</a></li>
            </div><br>
            <span class="page-bottom-span">地址：北京市昌平区建材城西路金燕龙办公楼一层 邮编：100096 电话：400-618-4000 传真：010-82935100
                    邮箱：zhanghj+itcast.cn</span><br>
            <span class="page-bottom-span">京ICP备08001421 号京公安备 11010800702</span>
        </div>
    </div>
    <br>
    <br>
    <br>

</div>
</body>

</html>