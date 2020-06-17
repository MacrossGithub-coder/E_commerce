<%--
  Created by IntelliJ IDEA.
  User: MACROSS
  Date: 2020/6/3
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>品优购注册</title>
    <link rel="shortcut icon" href="image/品优购网页图标.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/register.css">
    <link rel="stylesheet" href="css/login_page.css">
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
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
<script>
    function Update() {
        var $name = $("#name").val();
        var $mobile = $("#mobile").val();
        var $password = $("#password").val();
        var $repassword = $("#repassword").val();
        var $address = $("#address").val();
        $.post(
            "../../controller/UpdateUserinfo",
            {"name":$name,"mobile":$mobile,"password":$password,"repassword":$repassword,"address":$address},
            function (result) {
                alert(result);
            },
            "text"
        );
    }
</script>
<body>
<div class="big-box">
    <div class="top">
        <a href="../../controller/QueryGoodsByPage"><img src="img/logo.png" alt=""></a>
    </div>
    <div class="register-box">
        <div class="register-top">
            <span class="new">更改用户信息</span>
<%--            <span class="had">我有账号，去<a href="login_page.jsp">登录</a></span>--%>
        </div>
        <div class="register-content">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名：<input class="input" type="text" id="name" readonly="readonly" value=${sessionScope.User.username}><span class="after"></span><br>
            &nbsp;&nbsp;&nbsp;手机号码：<input class="input" type="text" reuqired pattern="^[0-9]{11}$" id="mobile" value=${sessionScope.User.usermobilephone}><span class="after"></span><br>
            &nbsp;&nbsp;&nbsp;新密码：<input class="input2" type="password" id="password" ><span class="after" ></span><br>
            确认密码：<input class="input2" type="password" id="repassword"><span class="after" ></span><br>
            &nbsp;&nbsp;&nbsp;配送地址：<input class="input" type="text" id="address" value=${sessionScope.User.useraddress}><span class="after" ></span><br>
            <!--                <input class="checkbox" type="checkbox" id="click" checked>-->
            <!--                <label for="click">同意并注册</label><a href="" class="protocal">《知果果用户协议》</a><br>-->
            <button onclick="Update()" style=" margin-left: 51px;">修改</button>
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

</body>
</html>
