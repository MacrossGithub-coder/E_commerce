<%@ page import="org.macross.entity.Page" %>
<%@ page import="org.macross.entity.apple" %><%--
  Created by IntelliJ IDEA.
  User: MACROSS
  Date: 2020/6/1
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>pyg</title>
    <link rel="stylesheet" href="./css/base.css" type="text/css">
    <link rel="stylesheet" href="./css/common.css" type="text/css">
    <link rel="stylesheet" href="./css/pygIndex.css" type="text/css">
    <link rel="stylesheet" href="./css/style.css" type="text/css">
    <link rel="stylesheet" href="./css/menupic.css" type="text/css">
    <link rel="icon" href="./css/bitbug_favicon.ico" type="image/x-icon">
    <script type="text/javascript" src="jquery-3.4.1.js"></script>
    <style>
        @font-face {
            font-family: 'iconfont';
            /* project id 1731093 */
            src: url('http://at.alicdn.com/t/font_1731093_7m5sog46gdv.eot');
            src: url('http://at.alicdn.com/t/font_1731093_7m5sog46gdv.eot?#iefix') format('embedded-opentype'),
            url('http://at.alicdn.com/t/font_1731093_7m5sog46gdv.woff2') format('woff2'),
            url('http://at.alicdn.com/t/font_1731093_7m5sog46gdv.woff') format('woff'),
            url('http://at.alicdn.com/t/font_1731093_7m5sog46gdv.ttf') format('truetype'),
            url('http://at.alicdn.com/t/font_1731093_7m5sog46gdv.svg#iconfont') format('svg');
        }

        .iconfont {
            font-family: "iconfont" !important;
            font-size: 16px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -webkit-text-stroke-width: 0.2px;
            -moz-osx-font-smoothing: grayscale;
            color: red;
        }
    </style>
</head>
<script>

    var getId = (function () {

        "use strict";


        var i = ${sessionScope.p.currentPage};
        return function () {
            if(i==2)
            {
                i= 0;
            }
            else return i++;
        };

    })();
    function refresh() {
        var obj1=document.getElementById('Goods_img');
        obj1.innerHTML='';
        var obj2=document.getElementById('Goods_header');
        obj2.innerHTML='';

        var cpage=getId()+1;

        if(isNaN(cpage))
        {
            cpage=0;
        }
        // 这里需要引入jacksonjar包
        $.post(
            "../../controller/QueryGoodsByPageServletWithAjax",
            "currentPage="+cpage,
            function (data) {
                for(var i=0;i<data.length;i++){
                    $("#Goods_img").append("<li class='fl'><a href='../../controller/QueryGoodDetailsByg_id?g_id="+data[i].g_id+"'><img src='"+data[i].g_src+"' class='img_iphone'></a></li>");
                // <li class='fl'><a href=''><img src='./jpg/iphone_img/iphone11.jpg' alt='' class='img_iphone'></a></li>
                    $("#Goods_header").append("<li class='fl'><a href='../../controller/QueryGoodDetailsByg_id?g_id="+data[i].g_id+"'><pre> "+data[i].g_name+" </pre><span></span><span class='money-tb'>￥"+data[i].g_price+".00</span></a></li>");
                    // <li class='fl'><a href=''><pre> iPhone 11 黑色 </pre><span></span><span class='money-tb'>￥5099.00</span></a></li>
                }

            },
            "json"
        );

    }

    // ../../controller/QueryGoodDetailsByg_id?g_id="+data[i].g_id

</script>
<body>
<%
    Page p =(Page)session.getAttribute("p");

    String name =(String)session.getAttribute("uname");
    if(name!=null)
    {
//        out.print(name);
        System.out.println("用户ID:"+name+"登录成功！");
    }
    else
    {
        response.sendRedirect("../login/login_page.jsp");
    }
%>
<div class="top-menu">
    <div class="external-tm w">
        <p class="left-tm">
        <ul class="arrange-ltm">
            <li class="fl">
                <pre>品优购欢迎您！</pre>
            </li>
            <li class="fl"><a href="../../controller/QueryUserinfoByusername?name=${sessionScope.uname}" class="ltm">会员ID:${sessionScope.uname}</a></li>
            <li class="fl"><a href="../login/invalidate.jsp" class="ltm color-red">注销</a></li>
        </ul>
        </p>
        <div class="right-tm fr">
            <ul>
                <li class="fl"><a href="" class="rtm">我的订单</a></li>
                <li class="fl part-rtm"></li>
                <li class="fl"><a href="" class="rtm">我的品优购<b class="icon-ctrl3"></b></a></li>
                <li class="fl part-rtm"></li>
                <li class="fl"><a href="" class="rtm">品优购会员</a></li>
                <li class="fl part-rtm"></li>
                <li class="fl"><a href="" class="rtm">企业采购</a></li>
                <li class="fl part-rtm"></li>
                <li class="fl"><a href="" class="rtm">关注品优购<b class="icon-ctrl3"></b></a></li>
                <li class="fl part-rtm"></li>
                <li class="fl"><a href="" class="rtm">客户服务<b class="icon-ctrl3"></b></a></li>
                <li class="fl part-rtm"></li>
                <li class="fl"><a href="" class="rtm">网站导航<b class="icon-ctrl3"></b></a></li>
            </ul>
        </div>
    </div>
</div>
<div class="search-pen w">
    <div class="external-logo">
        <a href="" class="logo"></a>
    </div>
    <div class="external-search">
        <input type="text" class="search1" placeholder="语言开发">
        <button class="search2">搜索</button>
    </div>
    <div class="external-hot-s">
        <a href="" class="hot-s color-red">优惠购首发</a>
        <a href="" class="hot-s">亿元优惠</a>
        <a href="" class="hot-s">9.9团购</a>
        <a href="" class="hot-s">美满99减30</a>
        <a href="" class="hot-s">办公用品</a>
        <a href="" class="hot-s">电脑</a>
        <a href="" class="hot-s">通信</a>
    </div>
    <div class="external-shopcar">
        <a href="../../controller/QueryShoppingCartByName?name=${sessionScope.uname}"><i class="iconfont">&#xe63b;</i>我的购物车<i class="shopcar1">8</i><i
                class="icon-ctrl shopcar2"></i></a>
    </div>
</div>
<div class="navigation-pen">
    <div class="w">
        <div class="left-np fl">
            <div class="top-lnp">全部商品分类</div>
            <div class="bottom-lnp">
                <ul>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">家用电器</a><i
                            class="icon-ctrl variety-blnp3"></i></li>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">手机、</a><a href=""
                                                                                         class="variety-blnp2">数码、</a><a href="" class="variety-blnp2">通信</a><i
                            class="icon-ctrl variety-blnp3"></i></li>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">电脑、</a><a href=""
                                                                                         class="variety-blnp2">办公</a><i class="icon-ctrl variety-blnp3"></i></li>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">家居、</a><a href=""
                                                                                         class="variety-blnp2">家具、</a><a href="" class="variety-blnp2">家装、</a><a href=""
                                                                                                                                                                 class="variety-blnp2">厨具</a><i class="variety-blnp3 icon-ctrl"></i></li>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">男装、</a><a href=""
                                                                                         class="variety-blnp2">女装</a><a href="" class="variety-blnp2">童装、</a><a href=""
                                                                                                                                                                class="variety-blnp2">内衣</a><i class="variety-blnp3 icon-ctrl"></i></li>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">个户化妆、</a><a href=""
                                                                                           class="variety-blnp2">清洁用品</a><a href="" class="variety-blnp2">宠物</a><i
                            class="variety-blnp3 icon-ctrl"></i></li>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">鞋靴、</a><a href=""
                                                                                         class="variety-blnp2">箱包、</a><a href="" class="variety-blnp2">珠宝、</a><a href=""
                                                                                                                                                                 class="variety-blnp2">奢饰品</a><i class="variety-blnp3 icon-ctrl"></i></li>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">运动户外、</a><a href=""
                                                                                           class="variety-blnp2">钟表</a><i class="variety-blnp3 icon-ctrl"></i></li>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">汽车、</a><a href=""
                                                                                         class="variety-blnp2">汽车用品</a><i class="variety-blnp3 icon-ctrl"></i></li>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">母婴、</a><a href=""
                                                                                         class="variety-blnp2">玩具乐器</a><i class="variety-blnp3 icon-ctrl"></i></li>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">食品、</a><a href=""
                                                                                         class="variety-blnp2">酒类、</a><a href="" class="variety-blnp2">生鲜、</a><a href=""
                                                                                                                                                                 class="variety-blnp2">特产</a><i class="variety-blnp3 icon-ctrl"></i></li>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">医药保健</a><i
                            class="variety-blnp3 icon-ctrl"></i></li>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">图书、</a><a href=""
                                                                                         class="variety-blnp2">音像、</a><a href="" class="variety-blnp2">电子书</a><i
                            class="variety-blnp3 icon-ctrl"></i></li>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">彩票、</a><a href=""
                                                                                         class="variety-blnp2">旅行、</a><a href="" class="variety-blnp2">充值、</a><a href=""
                                                                                                                                                                 class="variety-blnp2">票务</a><i class="variety-blnp3 icon-ctrl"></i></li>
                    <li class="variety-blnp1"><a href="" class="variety-blnp2">理财、</a><a href=""
                                                                                         class="variety-blnp2">众筹、</a><a href="" class="variety-blnp2">白条、</a><a href=""
                                                                                                                                                                 class="variety-blnp2">保险</a><i class="variety-blnp3 icon-ctrl"></i></li>
                </ul>
            </div>
        </div>
        <div class="right-np fl">
            <a href="" class="fl rnp">服装城</a>
            <a href="" class="fl rnp">美妆馆</a>
            <a href="" class="fl rnp">传智超市</a>
            <a href="" class="fl rnp">全球购</a>
            <a href="" class="fl rnp">闪购</a>
            <a href="" class="fl rnp">团购</a>
            <a href="" class="fl rnp">拍卖</a>
            <a href="" class="fl rnp">有趣</a>
        </div>
    </div>
</div>
<div class="w">
    <div class="slide-pen">
        <div class="left-sp fl">
            <div class="external-lsp">
                <a href="../../controller/QueryGoodDetailsByg_id?g_id=9" class="lsp1"><img src="./jpg/focus1.jpg" alt="" class="pic-lsp"></a>

                <button class="lsp2"></button>
                <button class="lsp3"></button>
                <div class="lsp4">
                    <a href="./jpg/01-电商-主页-gai_24.jpg" class="slide-lsp4"></a>
                    <a href="" class="slide-lsp4"></a>
                    <a href="" class="slide-lsp4"></a>
                    <a href="" class="slide-lsp4"></a>
                    <a href="" class="slide-lsp4"></a>
                </div>
            </div>
        </div>
        <div class="right-sp fr">
            <div class="top-rsp">
                <div class="trsp1">
                    品优购快报
                    <a href="" class="fr">更多<i class="icon-ctrl more-trsp1"></i></a>
                </div>
                <div class="trsp2">
                    <ul>
                        <li class="bulletin-trsp2"><span class="font-trsp2">[ 618特惠 ]</span> <a href="">iphone会场 大额神券提前抢 </a></li>
                        <li class="bulletin-trsp2"><span class="font-trsp2">[ 618特惠 ]</span> <a href="">大额神券 超值爆款 超值套装 </a></li>
                        <li class="bulletin-trsp2"><span class="font-trsp2">[ 618特惠 ]</span> <a
                                href="">AirPodS套装至高优惠2400元</a></li>
                        <li class="bulletin-trsp2"><span class="font-trsp2">[ 618特惠 ]</span> <a href="">iPhone SE 称心称手 超值入手</a></li>
                        <li class="bulletin-trsp2"><span class="font-trsp2">[ 618特惠 ]</span> <a
                            href="">iPhone11 低至4599元</a></li>
                        <li class="bulletin-trsp2"><span class="font-trsp2">[ 618特惠 ]</span> <a href="">iphone 11 Pro 64G 领券立减1700元</a>
                        </li>
                        <li class="bulletin-trsp2"><span class="font-trsp2">[ 618特惠 ]</span> <a href="">iphone 11 Pro Max 64G 领券立减2100元</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="center-rsp">
                <ul>
                    <li class="crsp1"><a href="" class="crsp12"><span>话费</span></a></li>
                    <li class="crsp1"><a href="" class="crsp13"><span>机票</span></a></li>
                    <li class="crsp1"><a href="" class="crsp14"><span>电影票</span></a></li>
                    <li class="crsp1"><a href="" class="crsp15"><span>游戏</span></a></li>
                    <li class="crsp1"><a href="" class="crsp16"><span>彩票</span></a></li>
                    <li class="crsp1"><a href="" class="crsp17"><span>加油卡</span></a></li>
                    <li class="crsp1"><a href="" class="crsp18"><span>酒店</span></a></li>
                    <li class="crsp1"><a href="" class="crsp19"><span>火车票</span></a></li>
                    <li class="crsp1"><a href="" class="crsp20"><span>众筹</span></a></li>
                    <li class="crsp1"><a href="" class="crsp21"><span>理财</span></a></li>
                    <li class="crsp1"><a href="" class="crsp22"><span>礼品卡</span></a></li>
                    <li class="crsp1"><a href="" class="crsp23"><span>白条</span></a></li>
                </ul>
            </div>
            <!-- <div class="bottom-rsp">
                <a href=""><img src="./jpg/bargain.jpg" alt=""></a>
            </div> -->
        </div>
    </div>
</div>
<div class="recommend-today w">
    <div class="left-rt">
        <img src="./jpg/clock.png" alt="" class="">
        <h3>今日推荐</h3>
    </div>
    <div class="right-rt">
        <a href="../../controller/QueryGoodDetailsByg_id?g_id=6"><img src="./jpg/01-电商-主页-gai_03.jpg" alt="" class="rrt rrt1"></a>
        <a href="../../controller/QueryGoodDetailsByg_id?g_id=7"><img src="./jpg/01-电商-主页-gai_05.jpg" alt="" class="rrt rrt1"></a>
        <a href="../../controller/QueryGoodDetailsByg_id?g_id=8"><img src="./jpg/01-电商-主页-gai_07.jpg" alt="" class="rrt rrt1"></a>
        <a href="../../controller/QueryGoodDetailsByg_id?g_id=9"><img src="./jpg/01-电商-主页-gai_09.jpg" alt="" class="rrt "></a>
    </div>
</div>
<div class="like-self">
    <div class="w">
        <div class="top-ls">
            <h3 class="fl">苹果618专区</h3>
            <a  class="r-tls fr" type="submit" onclick="refresh()">换一批</a>
<%--            <button  class="r-tls fr"  onclick="register()">换一批</button>--%>
        </div>
        <div class="bottom-ls">
            <div class="pic-bls">
                <ul id="Goods_img">
                    <%
                        for(org.macross.entity.apple apple:p.getApples())
                        {
                    %>
                    <li class="fl"><a href="../../controller/QueryGoodDetailsByg_id?g_id=<%=apple.getG_id()%>"><img src="<%=apple.getG_src()%>" alt="" class="img_iphone"></a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
            <div class="text-bls">
                <ul id="Goods_header">
                    <%
                        for(apple apple:p.getApples())
                        {
                    %>
                    <li class="fl"><a href="../../controller/QueryGoodDetailsByg_id?g_id=<%=apple.getG_id()%>"><pre><%=apple.getG_name()%></pre><span class="money-tb">￥<%=apple.getG_price()%>.00</span></a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
</div>

</div>
<div class="bottom-menu">
    <div class="w">
        <div class="top-bm">
            <ul>
                <li class="tbm1 fl">
                    <h3>正品保障</h3>
                    <p>正品保障，提供发票</p>
                </li>
                <li class="tbm2 fl">
                    <h3>极速物流</h3>
                    <p>急速物流，急速送达</p>
                </li>
                <li class="tbm3 fl">
                    <h3>无忧售后</h3>
                    <p>7天无理由退货</p>
                </li>
                <li class="tbm4 fl">
                    <h3>特色服务</h3>
                    <p>私人定制家电套餐</p>
                </li>
                <li class="tbm5 fl">
                    <h3>帮助中心</h3>
                    <p>您的购物指南</p>
                </li>
            </ul>
        </div>
        <div class="center-bm">
            <ul class="fl">
                <li>
                    <h3>购物指南</h3>
                </li>
                <li><a href="">购物流程</a></li>
                <li><a href="">会员介绍</a></li>
                <li><a href="">生活旅行/团购</a></li>
                <li><a href="">常见问题</a></li>
                <li><a href="">大家电</a></li>
                <li><a href="">联系客服</a></li>
            </ul>
            <ul class="fl">
                <li>
                    <h3>配送方式</h3>
                </li>
                <li><a href="">上门自提</a></li>
                <li><a href="">211限时达</a></li>
                <li><a href="">配送服务查询</a></li>
                <li><a href="">配送费收取标准</a></li>
                <li><a href="">海外配送</a></li>
            </ul>
            <ul class="fl">
                <li>
                    <h3>支付方式</h3>
                </li>
                <li><a href="">货到付款</a></li>
                <li><a href="">在线支付</a></li>
                <li><a href="">分期付款</a></li>
                <li><a href="">邮局汇款</a></li>
                <li><a href="">公司转账</a></li>
            </ul>
            <ul class="fl">
                <li>
                    <h3>售后服务</h3>
                </li>
                <li><a href="">售后政策</a></li>
                <li><a href="">价格保护</a></li>
                <li><a href="">退款说明</a></li>
                <li><a href="">返修/退换货</a></li>
                <li><a href="">取消订单</a></li>
            </ul>
            <ul class="fl">
                <li>
                    <h3>特色服务</h3>
                </li>
                <li><a href="">夺宝岛</a></li>
                <li><a href="">DIY装机</a></li>
                <li><a href="">延保服务</a></li>
                <li><a href="">品优购E卡</a></li>
                <li><a href="">品优购通信</a></li>
            </ul>
            <ul class="fl">
                <li>
                    <h3>帮助中心</h3>
                </li>
                <li><img src="./jpg/wx_cz.jpg" alt=""></li>
                <li>品优购客户端</li>
            </ul>
        </div>
        <div class="bottom-bm">
            <ul>
                <li class="fl"><a href="">关于我们</a></li>
                <li class="fl"><a href="">联系我们</a></li>
                <li class="fl"><a href="">联系客服</a></li>
                <li class="fl"><a href="">商家入驻</a></li>
                <li class="fl"><a href="">营销中心</a></li>
                <li class="fl"><a href="">手机品优购</a></li>
                <li class="fl"><a href="">友情链接</a></li>
                <li class="fl"><a href="">销售联盟</a></li>
                <li class="fl"><a href="">品优购社区</a></li>
                <li class="fl"><a href="">品优购公益</a></li>
                <li class="fl"><a href="">English Site</a></li>
                <li class="fl"><a href="">Contact U</a></li>
            </ul>
            <div>
                <p>地址：北京市昌平区建材城西路金燕龙办公楼一层 邮编：100096 电话：400-618-4000 传真：010-82935100 邮箱：zhanghj+itcast.cn</p>
            </div>
            <div>
                <p>京ICP 备 08001421 号京公网安备 110108007702</p>
            </div>
        </div>
    </div>
</div>
<div class="shortcut-pen">
    <ul>
        <li><a href="">家用电器</a></li>
        <li><a href="">收集通讯</a></li>
        <li><a href="">电脑办公</a></li>
        <li><a href="">家居家具</a></li>
        <li><a href="">生活用品</a></li>
        <li><a href="">运动户外</a></li>
        <li><a href="">汽车用品</a></li>
        <li><a href="">食品酒类</a></li>
        <li><a href="">医药保健</a></li>
        <li><a href="">图书音像</a></li>
        <li><a href="">金融彩票</a></li>
    </ul>
</div>
</body>

</body>
</html>
