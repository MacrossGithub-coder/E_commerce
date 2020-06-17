<%@ page import="java.util.List" %>
<%@ page import="org.macross.entity.shoppingcart" %><%--
  Created by IntelliJ IDEA.
  User: MACROSS
  Date: 2020/6/4
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>购物车</title>
    <meta name="description" content="购物商城，网上购物">
    <meta name="keywords" content="网上购物，手机，电脑，服饰">
    <link rel="shortcut icon" href="./bitbug_favicon.ico">
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/shopbar.css">
    <script type="text/javascript" src="jquery-3.4.1.js"></script>
    <style>

    </style>
</head>
<script language="JavaScript">

    <%--function delete_goods(obj) {--%>
    <%--    // target=--%>
    <%--    var g_id=obj.getAttribute('g_id');--%>
    <%--    var g_count=obj.getAttribute('g_count');--%>
    <%--    var date=obj.getAttribute('date');--%>
    <%--    var total_price=obj.getAttribute('total_price');--%>
    <%--    var delete_id="date="+date;--%>
    <%--    var uname="${sessionScope.uname}";--%>
    <%--    var obj=document.getElementById(delete_id);--%>
    <%--    var obj2=document.getElementById("account");--%>
    <%--    obj2.innerHTML='';--%>

    <%--    $.post(--%>
    <%--        "../../DeleteGoodsByGidAndUnameServlet",--%>
    <%--        {"uname":uname,"gid":g_id,"gcount":g_count,"date":date,"total_price":total_price},--%>
    <%--        function (result) {--%>
    <%--            if(result=="true")--%>
    <%--            {--%>
    <%--                obj.parentNode.removeChild(obj);--%>
    <%--                $("#account").append('￥${sessionScope.account}.00');--%>
    <%--            }else--%>
    <%--                alert(result);--%>
    <%--        },--%>
    <%--        "text"--%>
    <%--    );--%>
    <%--};--%>
    function delete_goods(obj) {
        // target=
        var g_id=obj.getAttribute('g_id');
        var g_count=obj.getAttribute('g_count');
        var date=obj.getAttribute('date');
        var total_price=obj.getAttribute('total_price');
        var delete_id="date="+date;
        var uname="${sessionScope.uname}";
        var obj=document.getElementById(delete_id);
        var obj2=document.getElementById("account");
        obj2.innerHTML='';

        $.post(
            "../../controller/DeleteGoodsByGidAndUname",
            {"uname":uname,"gid":g_id,"gcount":g_count,"date":date,"total_price":total_price},
            function (data) {
                var  json= JSON.stringify(data);
                if(data.result=="true")
                {
                    obj.parentNode.removeChild(obj);
                    $("#account").append('￥'+data.new_account+'.00');
                }else
                    alert(data.result);
            },
            "json"
        );
    };
    function buy() {
        alert("余额不足，请联系开发者充值！");
    }
</script>

<body>
<%
    List<shoppingcart> shoppingcarts = (List<shoppingcart>) session.getAttribute("shoppingcarts");
    int account = (int) session.getAttribute("account");
%>
<!-- 顶部导航栏 start -->
<div class="top-nav">
    <div class="w">
        <div class="fl">
            <ul>
                <li class="fl">
                    <pre>品优购欢迎您！</pre>
                </li>
                <li class="fl"><a href="../../controller/QueryUserinfoByusername?name=${sessionScope.uname}" class="ltm">会员ID:${sessionScope.uname}</a></li>
                <li class="fl"><a href="../login/invalidate.jsp" class="ltm color-red">注销</a></li>
            </ul>
        </div>
        <div class="fr">
            <ul>
                <li><a href="">我的订单</a></li>
                <li></li>
                <li><a href="">我的品优购</a><i class="iconfont">&#xe6a4;</i></li>
                <li></li>
                <li><a href="">品优购会员</a></li>
                <li></li>
                <li><a href="">企业采购</a></li>
                <li></li>
                <li><a href="">关注品优购</a><i class="iconfont">&#xe6a4;</i></li>
                <li></li>
                <li><a href="">客户服务</a><i class="iconfont">&#xe6a4;</i></li>
                <li></li>
                <li><a href="">网站导航</a><i class="iconfont">&#xe6a4;</i></li>
            </ul>
        </div>
    </div>
</div>
<!-- 顶部导航栏 end -->
<div class="header w">
    <div class="logo">
        <a href="../../controller/QueryGoodsByPage" title="品优购"></a>
        <h2>购物车</h2>
    </div>
    <!-- 搜索框 -->
    <div class="sub-search">
        <input type="text" placeholder="自营">
        <button>搜索</button>
    </div>
</div>
<div class="w">

    <!-- 全选 -->
    <div class="all">
        <h3 class="color-red">全部商品</h3>
        <div class="all-select">
            <ul>
                <li><input type="checkbox">全选</li>
                <li>商品</li>
                <li>用户ID</li>
                <li>单价(元)</li>
                <li>数量</li>
                <li>小计(元)</li>
                <li>操作</li>
            </ul>
        </div>
    </div>

    <div class="box">
        <div class="box-hd">
            <input type="checkbox" checked>
            <div class="czzy">Apple产品自营旗舰店</div>
<%--            <span class="fr">运费: ￥6.00 <em class="color-red">还差￥99.00免运费</em></span>--%>
        </div>
        <div class="box-bd">

         <%
             for (shoppingcart shoppingcart:shoppingcarts){
         %>
            <div class="small" id="date=<%=shoppingcart.getDate()%>">
                <ul>
                    <li>
                        <input type="checkbox" checked>
                        <img src="<%=shoppingcart.getGsrc()%>" alt="">
                    </li>
                    <li class="shop-name">
                        <a href="../../QueryGoodDetailsByg_idServlet?g_id=<%=shoppingcart.getId()%>"><%=shoppingcart.getGname()%> </a>
                    </li>
                    <li style="font-size: 20px;">
                        <%=shoppingcart.getUname()%>
                    </li>
                    <li><%=shoppingcart.getGprice()%>.00</li>
                    <li>
                        <div class="youhuo">
                            <div class="plus">-</div>
                            <div class="num"><%=shoppingcart.getCount()%></div>
                            <div class="mins">+</div>
                        </div>
                        <div class="youhuo">有货</div>
                    </li>
                    <li><%=shoppingcart.getTotal_price()%>.00</li>
                    <li>
                        <a onclick="delete_goods(this)" g_id="<%=shoppingcart.getId()%>" g_count="<%=shoppingcart.getCount()%>" date="<%=shoppingcart.getDate()%>" total_price="<%=shoppingcart.getTotal_price()%>">移出购物车</a> <br>
                        <a href="#">移到我的关注</a>
                    </li>
                </ul>
            </div>
        <%
            }
        %>

        </div>


    </div>
    <div class="delete">
        <div class="all-delete clearfix">
            <ul class="fl">
                <li>
                    <input type="checkbox" name="" id="">
                </li>
                <li>全选</li>
                <li><a href="">删除选中的商品</a></li>
                <li><a href="">移到我的关注</a></li>
                <li><a href="">清除下柜商品</a></li>
            </ul>
            <div class="js fr">
                <a onclick="buy()">结算</a>
            </div>
            <div class="last-pr fr">
                <p> 商品 总价（不含运费） ： <em id="account">￥<%=account%>.00</em>
                </p>
                <p> 已节省：-￥20.00</p>
            </div>

        </div>
    </div>


</div>
<!-- 底部 start -->
<div class="footer">
    <div class="w">
        <!-- 保证模块 -->
        <div class="ensure">
            <ul>
                <li>
                    <div class="pic item1"></div>
                    <div class="txt">
                        <h3>正品保障</h3>
                        <p>正品保障,提供发票</p>
                    </div>
                </li>
                <li>
                    <div class="pic item2"></div>
                    <div class="txt">
                        <h3>极速物流</h3>
                        <p>急速物流，急速送达</p>
                    </div>
                </li>
                <li>
                    <div class="pic item3"></div>
                    <div class="txt">
                        <h3>无忧售后</h3>
                        <p>7天无理由退换货</p>
                    </div>
                </li>
                <li>
                    <div class="pic item4"></div>
                    <div class="txt">
                        <h3>特色服务</h3>
                        <p>私人定制家电套餐</p>
                    </div>
                </li>
                <li>
                    <div class="pic item5"></div>
                    <div class="txt">
                        <h3>帮助中心</h3>
                        <p>您的购物指南</p>
                    </div>
                </li>
            </ul>
        </div>
        <!-- 帮助菜单 -->
        <div class="help">
            <dl>
                <dt>服务指南</dt>
                <dd><a href="#">购物流程</a></dd>
                <dd><a href="#">会员介绍</a></dd>
                <dd><a href="#">生活旅行/团购</a></dd>
                <dd><a href="#">常见问题</a></dd>
                <dd><a href="#">大家电</a></dd>
                <dd><a href="#">联系客服</a></dd>
            </dl>
            <dl>
                <dt>配送方式</dt>
                <dd><a href="#">上门自提</a></dd>
                <dd><a href="#">211限时达</a></dd>
                <dd><a href="#">配送服务查询</a></dd>
                <dd><a href="#">配送费收取标准</a></dd>
                <dd><a href="#">海外配送</a></dd>
                <dd><a href="#"></a></dd>
            </dl>
            <dl>
                <dt>支付方式</dt>
                <dd><a href="#">货到付款</a></dd>
                <dd><a href="#">在线支付</a></dd>
                <dd><a href="#">分期付款</a></dd>
                <dd><a href="#">邮局汇款</a></dd>
                <dd><a href="#">公司转账</a></dd>

            </dl>
            <dl>
                <dt>售后服务</dt>
                <dd><a href="#">售后政策</a></dd>
                <dd><a href="#">价格保护</a></dd>
                <dd><a href="#">退款说明</a></dd>
                <dd><a href="#">返修/退换货</a></dd>
                <dd><a href="#">取消订单</a></dd>
            </dl>
            <dl>
                <dt>特色服务</dt>
                <dd><a href="#">夺宝岛</a></dd>
                <dd><a href="#">DIY装机</a></dd>
                <dd><a href="#">延保服务</a></dd>
                <dd><a href="#">品优购E卡</a></dd>
                <dd><a href="#">品优购通信</a></dd>

            </dl>
            <dl>
                <dt>帮助中心</dt>
                <dd>
                    <img src="./img/客户端二维码_03.png" alt=""><br>
                    品优购客户端
                </dd>
            </dl>
        </div>
        <!-- 版权声明 -->
        <div class="copyright">
            <div class="w">
                <div class="aboutme">
                    <a href="">关于我们</a> | <a href="">联系我们</a> | <a href="">联系客服</a> | <a href="">商家入驻</a> | <a
                        href="">商家入驻</a> | <a href="">手机品优购</a> | <a href="">友情链接</a> | <a href="">销售联盟</a> | <a
                        href="">品优购社区</a> |
                    <a href="">品优购公益</a> | <a href="">English Site</a> | <a href="">Contact U</a>
                </div>
                <p>地址：北京市昌平区建材城西路金燕龙办公楼一层 邮编：100096 电话：400-618-4000 传真：010-82935100 邮箱: zhanghj+itcast.cn</p>
                <p>京ICP备08001421号京公网安备110108007702</p>
            </div>
        </div>

    </div>
</div>
<!-- 底部 end -->


</body>
</html>
