<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="services.WeaponService" %>
<%@ page import="entity.Weapon" %>
<%@ page import="java.util.List"%>

<html>
<head>
    <meta name="viewport" content="width=device-width,user-scalable=0,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="./cssfile/sudyslide.css" type="text/css" rel="stylesheet">
    <link href="extends/extends.css" type="text/css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.sudyslide.min.js"></script>
    <script src="extends/extends.js"></script>
    <script src="js/self.js"></script>
    <script>
        <%!int number=0;%>
    </script>
    <script>
        <%
            if(application.getAttribute("number")==null){
                number=1;
            }
            else{
                number=Integer.parseInt(application.getAttribute("number").toString());
                number++;
            }
            application.setAttribute("number",number);
        %>
    </script>
    <style>
        * {
            margin:0px;
            padding:0px;
        }
        div{
            display:block;
        }
        a {
            text-decoration: none;
            color: #eee;
        }

        body, p {
            font: 16px/1.7 Microsoft YaHei, Helvetica, STHeiti STXihei, Microsoft JhengHei, Tohoma, Arial;
            color: #333;
        }

        .xiala-li-ul{
            background-color: #444;display: none;position: absolute;left: 0;top: 40px;z-index: 100;min-width: 175px;list-style:none;
        }
        .xiala-li{
            display: inline-block;float: left;width: 154px;text-align: center;position: relative;
        }
        .xiala-li-a{
            display: inline-block;padding: 0 45px;height: 40px;line-height: 40px;color: #eee;font-size: 16px;text-decoration: none;position: relative;
        }
        .xiala-li-ul-li{
            position: relative;white-space: nowrap;vertical-align: top;border-bottom: 0;color:#eee;
        }
        .xiala-li-ul-li-a{
            color: #eee;
            display: block;
            height: 26px;
            text-decoration: none;
            font-size: 14px;
            line-height: 26px;
            text-align: center;
        }
        .xiala-li-ul-li-a:hover{
            color: #FFC661;
        }
        .xiala-li:hover .xiala-li-ul{
            display: block;
        }

        .xiala-li:hover .xiala-li-a{
            color: #a61d37;
        }

        li{
            font-family: 微软雅黑;
        }
        .slide-slider .slider span {
            display: block; height: 4px; background: #C32C2C; margin-right: 1px; z-index: 10;
        }
        
        .wp-container {
            background: #444 url(./image/side01.jpg) repeat-x;height: 913px;
        }

        .wp-wrapper {
            width: 100%;
        }

        .wp-wrapper .wp-inner {
            width: auto;max-width: 1200px;margin: 0 auto;
        }

        .wp-container .wp-inner {
            background-color: #444;height: 510px;
        }

        .news {
            padding: 30px 27px;
        }

        .clearfix {
            display: block;
            *zoom: 1;
        }

        .headbar {
            width: 100%;
            height: 52px;
            border-bottom: 2px solid #eee;
            margin-bottom: 20px;
        }



        .none {
            display: none;
        }

        .headbar h3 {
            float: left;
            font-size: 20px;
            font-weight: normal;
            color: #eee;
            line-height: 50px;
        }

        .headbar .post-more, .headbar .post-more a {
            float: right;
            font-size: 12px;
            color: #eee;
            line-height: 50px;
        }

        .news .con1 {
            float: left;
            width: 39.5%;
        }

        .news .con1 .cunk {
            position: relative;
            overflow: hidden;
        }

        .news .con1 .thum, .news .con1 .thum img {
            width: 100%;
            height: 260px;
        }

        .news .con1 .cunk .title {
            position: absolute;
            left: 0;
            bottom: 0;
            background: url(./images/titb.png);
            padding-left: 15px;
            width: 100%;
        }
        .mainl {
            float: left;
            width: 54.5%;
            padding-left: 27px;
        }
        .modcon1 .bks {
            width: 100%;
            margin-right: 0;
        }

        .modcon .bks {
            float: left;

        }

        .modcon1 .bks .items .title {
            display: inline-block;
            width: 100%;
            margin-right: 80px;
        }

        .wp-focus {
            background-color: #ececec;
        }

        .fcous-panel {
            width: 100%;
        }
        .fcous-panel .focus-window {
            width: 100%;overflow: hidden;
        }

        
        .wapban {
            display: none;
        }

        .modcon2 .headbar {
            border: 0;margin-bottom: 0;
        }
        .modcon2 .headbar h3{
            font-size: 17px;font-weight: bold;line-height: 20px;
        }
        .mainr {
            float: right;width: 39%;padding-right: 28px;
        }

        .mod4, .mod5, .mod6, .mod7 {
            margin-bottom: 20px;
        }

        .mod4 .action {
            float: left;
            width: 20%;
            background: #f1f5f8 ;
        }
        .mod5 .action {
            float: left;width: 20%;background: #f1f5f8 ;
        }
        .mainr .action {
            padding-bottom: 40px;
        }
        .mainr .actcon {float: right;width: 80%;}
        .mainr .action .icont {
            font-size: 20px;
            color: #2c2c2c;
            width: 20px;
            line-height: 20px;
            margin: 62px auto 0 auto;
        }

        .focus-container .focus-item img {
            width: 100%;
            height: 100%;
            border: 0;
            vertical-align: top;
        }

        .navpic .newss .thum, .navpic .newss .thum img {width: 100%;height: 100%;}
        .navpic .newss .title {position: absolute;bottom: 0;left: 0;z-index: 90;width: 100%;text-align: center;background: url(../images/bgg.png);}
        .navpic .newss .title, .navpic .newss .title a {color: #fff;font-size: 16px;line-height: 36px;}
        .navpic1 .newss .thum, .navpic1 .newss .thum img {width: 100%;height: 100%;}
        .navpic2 .newss .thum, .navpic2 .newss .thum img {width: 100%;height: 100%;}
        .navpic3 .newss .thum, .navpic3 .newss .thum img {width: 100%;height: 100%;}
        .navpic4 .newss .thum, .navpic4 .newss .thum img {width: 100%;height: 100%;}
        .plist .listc img {width: 94%;}
        .wp_nav { display:block; margin: 0; padding: 0;display: block; *zoom:1;}
        .wp_nav * {margin: 0; padding: 0}
        .wp_nav:after {clear: both;content: ".";display: block;height: 0;visibility: hidden;}
        .wp_nav .nav-item { display:inline-block; float:left; position:relative; vertical-align:bottom;}
        .wp_nav .on { z-index:10;}
        .wp_nav .nav-item .mark {display:block; width:100%; height:100%; position:absolute; left:0;top:0; z-index:99; }
        .wp_nav .nav-item a{ font-family:"Microsoft Yahei"; display:block;text-align:center;position:relative; z-index:100;}

        .wp_nav .nav-item a span.item-name { display:inline-block; padding:5px 10px; line-height:22px;cursor:pointer;}
        .wp_nav .sub-nav .nav-item { white-space:nowrap; }
        .wp_nav .sub-nav .nav-item .mark { background:#fff;}
        .wp_nav .sub-nav .nav-item a {font-family:"Microsoft Yahei"; font-size:13px;font-weight:normal; color:#000;text-align:left;border-top:1px solid #D8E1CC;min-width: 80px;}
        .wp_nav .sub-nav .nav-item a span.item-name { padding:5px 10px; line-height:22px;}
        .wp_nav .nav-item a.parent:hover span.item-name{}
        .wp_nav .nav-item a.parent span.item-name{}
        .wp_nav .sub-nav .nav-item a.parent:hover span.item-name{}
        .wp_nav .sub-nav .nav-item a.parent span.item-name{}
        #wp_nav_w15 .wp_nav .nav-item a span.item-name {display: inline-block;padding: 17px 21px;line-height: 22px;cursor: pointer;font-size: 16px;color: #707070;background: url(images/redline.jpg) no-repeat left 50%;}
        #wp_nav_w15 .wp_nav .nav-item.i1 a span.item-name {background: none;}
        .wp-footer {background: url(image/footer.jpg) repeat-x;}
        .wp-footer .wp-inner {padding-top: 25px;}
        .wp-footer .wp-inner .footer span {margin: 0 5px;}
        .wp-footer .wp-inner .footer a {color: #eee;font-size: 14px;margin: 0 5px;}
        .wp-footer .wp-inner .footer a:hover {color: #ddd;text-decoration: underline;}
        .wp-footer .footl {float: left;width: 29%;border-left: 1px solid #eee;border-right: 1px solid #eee;}
        .wp-footer .footc {float: left;width: 41%;text-align: center;}
        .wp-footer .footr {float: left;width: 29%;border-left: 1px solid #eee;border-right: 1px solid #eee;}
        .wp-footer .footc img {margin-bottom: 12px;}
        .wp-footer .footc p {line-height: 22px;color: #eee;font-size: 12px;}
        .footr .icons img {margin: 0 11px;}
        .footr .icons {text-align: center;padding: 30px 0 20px;}
        .footr .icons span {cursor: pointer;}
        .footr .views {text-align: center;padding: 15px 0; line-height: 22px; color: #eee; font-size: 12px;}
        .footr .views span {text-align: center; padding: 0; line-height: 22px;color: #eee;font-size: 12px;background: none;border: 0;margin: 0;}
        #wp_nav_w14 .wp_nav .nav-item {width: 50%;}
        #wp_nav_w14 .wp_nav .nav-item a span.item-name {display: inline-block;padding: 5px 10px;line-height: 22px;cursor: pointer;color: #eee;font-size: 16px;}
    	.fileupload_form{position:relative ;left:50px;top:10px;color:#fff;background-color: #444;}
    
    </style>
    <title>G_WORLD</title>
</head>
<body>
	<% 	request.setCharacterEncoding("utf-8");
		response.setContentType("utf-8");
		response.setCharacterEncoding("utf-8"); 
		WeaponService ws = new WeaponService();
		
		//定义轻武器、重武器、冷兵器的页面大小
		int lpage_size=7,hpage_size=3,cpage_size=5;
		//分别定义轻武器、重武器、冷兵器的当前页面并相应赋值
		int lcurrentpage,hcurrentpage,ccurrentpage;
		
		//轻武器当前页面页数赋值
		if(request.getParameter("lcurrentpage")!=null){
			lcurrentpage = Integer.parseInt(request.getParameter("lcurrentpage"));
		}else{
			lcurrentpage = 1;
		}
		
		//重武器当前页面页数赋值
		if(request.getParameter("hcurrentpage")!=null){
			hcurrentpage = Integer.parseInt(request.getParameter("hcurrentpage"));
		}else{
			hcurrentpage = 1;
		}
		
		//冷兵器当前页面页数赋值
		if(request.getParameter("ccurrentpage")!=null){
			ccurrentpage = Integer.parseInt(request.getParameter("ccurrentpage"));
		}else{
			ccurrentpage = 1;
		}
		
		
		
		int lpage_num = 0,hpage_num = 0,cpage_num = 0;
		////获取轻武器的武器数据及计算出数据所占页数
		lpage_num = ws.loadLightWeaponNumber();
		List<Weapon> lightweaponList = ws.loadAllLightWeapon(lcurrentpage) ;
		if(lpage_num%lpage_size!=0){
			lpage_num = (lpage_num/lpage_size) + 1;
		}else{
			lpage_num = lpage_num/lpage_size;
		}
		
		
		//获取重武器的武器数据及计算出数据所占页数
		hpage_num = ws.loadHeavenWeaponNumber();
		List<Weapon> heavenweaponList = ws.loadAllHeavenWeapon(hcurrentpage) ;
		if(hpage_num%hpage_size!=0){
			hpage_num = hpage_num/hpage_size + 1;
		}else{
			hpage_num = hpage_num/hpage_size;
		}
		
		//获取冷兵器的武器数据及计算出数据所占页数
		cpage_num = ws.loadColdWeaponNumber();
		List<Weapon> coldweaponList = ws.loadAllColdWeapon(ccurrentpage);
		if(cpage_num%cpage_size!=0){
			cpage_num = cpage_num/cpage_size + 1;
		}else{
			cpage_num = cpage_num/cpage_size;
		}
		%>
    <!--头部开始-->
    <header style="padding: 8px 0;width:100%; height:120px;background:url(./image/headbar.jpg);">
        <div style="width:auto;max-width: 1200px;margin:0 auto;display:block;">
            <!--logo部分-->
            <div style="float:left;left:18.8%;width:384px;height:119px;position:absolute;margin-top: 24px;">
                    <a style="cursor:pointer; text-decoration:none;color:#FFF;" herf="index.jsp">
                        <span style="font-size: 50px">G</span>_W<span style="font-size: 50px">O</span>RLD
                    </a>
            </div>
            <!--Loga结束-->
            <!--语言转换部分-->
            <div style="float:right;right:18.9%;width:56px;height:20px;position:absolute;margin-top: 4px;">
                <a style="font-size: 12px;color: white;text-decoration: none;font-family: 微软雅黑" href="">English</a>
            </div>
            <!--语言转换结束-->
            <!--搜索部分-->
            <div style="float:right;clear:right;right:19%;width:270px;height:34px;position:absolute;margin-top: 52px;border-radius: 12px;background-color: #444">
                <form method="post" action="weapon_searchServlet" target="_blank" id="myform1">
                    <div style="margin-left: 10px;margin-right: 40px;">
                        <input style="margin-top: 8px;width: 100%;height: 20px;line-height: 20px;border: 0;outline: 0;background: none;color: #eee;font-size: 16px;padding: 7px 0;" name="keyword" type="text" placeholder="">
                    </div>
                    <div style="width: 40px;height: 34px;position: absolute;right: 0;top: 50%;margin-top: -17px;background-color: #444">
                       <a href="javascript:void(0)" onclick="myform1.submit();"><span style="color:#eee">搜索</span></a>
                    </div>
                </form>
            </div>
            <!--搜索部分结束-->
        </div>
    </header>
    <!--头部结束-->

    <!--导航部分-->
    <div style="background-color: #444;width: 100%;height: 40px">
        <div style="width:auto;max-width: 1200px;margin:0 auto;display:block;">
            <div style="float:left;left:18.8%;position:absolute;">
                <ul style="margin:0 auto;display: block;">
                    <li style="display: inline-block;float: left;width: 122px;text-align: center">
                        <a style="display: inline-block;padding: 0 45px;height: 40px;line-height: 40px;color: #eee;font-size: 16px;text-decoration: none;" href="index.jsp">首页</a>
                    </li>
                    <li class="xiala-li">
                        <a class="xiala-li-a" href="">轻武器</a>
                        <ul class="xiala-li-ul">
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">雷明登R4卡宾枪</a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">R11半自动步枪</a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">RE步枪</a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">ak47步枪</a>
                            </li>
                        </ul>
                    </li>
                    <li class="xiala-li">
                        <a class="xiala-li-a" href="">重武器</a>
                        <ul class="xiala-li-ul">
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">99式重装坦克</a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">89式轻型装甲车</a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">防空系统</a>
                            </li>
                        </ul>
                    </li>
                    <li class="xiala-li">
                        <a class="xiala-li-a" href="">空战武器</a>
                        <ul class="xiala-li-ul">
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">超音速</a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">隐形战斗机</a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">普通军用直升机</a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">武装直升机</a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">炮艇</a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">无人机</a>
                            </li>
                        </ul>
                    </li>
                    <li class="xiala-li">
                        <a class="xiala-li-a" href="">海战武器</a>
                        <ul class="xiala-li-ul">
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">航母</a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">战斗快艇</a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href="">巡洋舰</a>
                            </li>
                        </ul>
                    </li>
                    <li class="xiala-li">
                        <a class="xiala-li-a" href="">陆战武器</a>
                        <ul class="xiala-li-ul">
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                        </ul>
                    </li>
                    <li class="xiala-li">
                        <a class="xiala-li-a" href="">火炮系统</a>
                        <ul class="xiala-li-ul">
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                        </ul>
                    </li>
                    <li class="xiala-li">
                        <a class="xiala-li-a" href="">冷兵器</a>
                        <ul class="xiala-li-ul">
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                            <li class="xiala-li-ul-li">
                                <a class="xiala-li-ul-li-a" href=""></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--导航结束-->

    <!--大图部分-->
    <div class="wp-focus wp-wrapper" id="slide">
        <div class="carousel slide" id="carousel">
            <div class="wp-panel fcous-panel panel-6 cont-1">
                <div class="wp-window focus-window window-6">
                    <div id="wp_news_w5">

                        <script type="text/javascript">
                            var w77imgJsons = [

                                {
                                    title:" 1",
                                    url:"index.jsp",
                                    src:"./image/mk_17_dis.jpg"
                                },

                                {
                                    title:" 2",
                                    url:"index.jsp",
                                    src:"./image/m4_A3_dis.jpg"
                                },

                                {
                                    title:" 3",
                                    url:"index.jsp",
                                    src:"./image/ak_13.jpg"
                                },

                                {
                                    title:"4",
                                    url:"index.jsp",
                                    src:"./image/m4a1_01.jpg"
                                },

                                {
                                    title:" 5",
                                    url:"index.jsp",
                                    src:"./image/mp5_ka4.jpg"
                                },

                                {
                                    title:"6",
                                    url:"index.jsp",
                                    src:"./image/s_gunforpolice.jpg"
                                },

                                {
                                    title:"7",
                                    url:"index.jsp",
                                    src:"./image/shot_gun1.jpg"
                                },

                                {
                                    title:"8",
                                    url:"index.jsp",
                                    src:"./image/sight1.jpg"
                                },

                                {
                                    title:"9光学瞄具",
                                    url:"index.jsp",
                                    src:"./image/sight02.jpg"
                                },

                                {
                                    title:"10",
                                    url:"index.jsp",
                                    src:"./image/m16_00.jpg"
                                },

                                {}
                            ];
                            w77imgJsons.pop();
                        </script>
                        <div class="focus2"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="wp-wrapper">
        <div class="wp-inner clearfix">
            <div frag="窗口458" class="wapban">
                <div id="wp_news_w458">
                    <div class="focus" data-focus>

                        <img src="/image/mk_17_dis.jpg"
                             data-focus-title="<a href='http://www.shutcm.edu.cn/2018/0524/c221a15082/page.htm' target='_self' title=' '></a>"
                             data-focus-url="http://www.shutcm.edu.cn/2018/0524/c221a15082/page.htm">

                        <img src="/image/m4_A3_dis.jpg"
                             data-focus-title="<a href='http://www.shutcm.edu.cn/19th/main.htm' target='_self' title=' '></a>"
                             data-focus-url="http://www.shutcm.edu.cn/19th/main.htm">

                        <img src="/image/ak_13.jpg"
                             data-focus-title="<a href='/_redirect?siteId=2&columnId=253&articleId=16206' target='_blank' title=' '></a>"
                             data-focus-url="/_redirect?siteId=2&columnId=253&articleId=16206">

                        <img src="/image/m4a1_01.jpg"
                             data-focus-title="<a href=' ' target='_blank' title='服务进博会 我校学生团队研发英文版中医就诊指南“掌中宝”获媒体关注'>服务进博会 我校学生团队研发英...</a>"
                             data-focus-url="/_redirect?siteId=2&columnId=253&articleId=15401">

                        <img src="/image/mp5_ka4.jpg"
                             data-focus-title="<a href='/_redirect?siteId=2&columnId=253&articleId=16568' target='_blank' title=' '></a>"
                             data-focus-url="/_redirect?siteId=2&columnId=253&articleId=16568">

                        <img src="/image/s_gunforpolice.jpg"
                             data-focus-title="<a href='/_redirect?siteId=2&columnId=253&articleId=18429' target='_blank' title='我校两名研究员入选国家级人才培养计划'>我校两名研究员入选国家级人才培...</a>"
                             data-focus-url="/_redirect?siteId=2&columnId=253&articleId=18429">

                        <img src="/image/shot_gun1.jpg"
                             data-focus-title="<a href='/_redirect?siteId=2&columnId=253&articleId=18416' target='_blank' title='我校龙舟队在上海市第十六届运动会再创佳绩'>我校龙舟队在上海市第十六届运动...</a>"
                             data-focus-url="/_redirect?siteId=2&columnId=253&articleId=18416">

                        <img src="/image/sight1.jpg"
                             data-focus-title="<a href='http://www.shutcm.edu.cn/2018/1020/c221a18432/page.htm' target='_self' title='我校师生在第二届医药院校药学/中药学世界大学生创新创业暨实验教学改革大赛中取得突出成绩'>我校师生在第二届医药院校药学/...</a>"
                             data-focus-url="http://www.shutcm.edu.cn/2018/1020/c221a18432/page.htm">

                        <img src="/image/sight02.jpg"
                             data-focus-title="<a href='/_redirect?siteId=2&columnId=253&articleId=3835' target='_blank' title='2018年上海市研究生学术论坛在我校召开'>2018年上海市研究生学术论坛在我...</a>"
                             data-focus-url="/_redirect?siteId=2&columnId=253&articleId=3835">

                        <img src="/image/m16_00.jpg"
                             data-focus-title="<a href='/_redirect?siteId=2&columnId=253&articleId=16301' target='_blank' title='海外首家太极健康中心在希腊挂牌成立'>海外首家太极健康中心在希腊挂牌...</a>"
                             data-focus-url="/_redirect?siteId=2&columnId=253&articleId=16301">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--大图结束-->

    <!--主体部分-->
    <div class="wp-container">
        <!--轻武器部分-->
        <div class="wp-wrapper" style="height: 404px;">
            <div class="wp-inner clearfix" style="height: 404px;">
                <div class="news clearfix">
                    <div frag="轻武器窗口">
                        <div class="headbar clearfix">
                            <h3 class="post-title">
                                <span>轻武器</span>
                            </h3>
                            <form class="fileupload_form" action="file_uploadServlet" method="post" enctype="multipart/form-data">
                            	<input type="file" name="file">
                            	<input type="submit" value="确定上传">
                            </form>
                            <div class="post-more" style="top:-30px;position: relative;">
                                <a href="weapon/weapon_add.jsp" class="focus-more" style="color: #f00">
                                    <span>添加信息>></span>
                                </a>
                            </div>
                        </div>

                        <div class="none">
                            <div>
                                <ul class="con1 clearfix">
                                    <li class="cunk clearfix">
                                        <p class="thum">
                                            <a href="" target="_blank" title="更多最新武器信息尽在G_WORLD网"></a>
                                        </p>
                                        <p class="title">
                                            <a href="" target="_blank" title="更多最新武器信息尽在G_WORLD网">
                                                更多最新武器信息尽在G_WORLD网
                                            </a>
                                        </p>

                                    </li>
                                </ul>
                            </div>
                        </div>

                    </div>

                    <div frag="左侧图片模块(窗口61)">
                        <div>
                            <ul class="con1 clearfix">
                                <li class="cunk clearfix">
                                    <p class="thum">
                                        <a href="" target="_blank" title="更多最新武器信息尽在G_WORLD网">
                                            <img src="./image/leiMingDun_r4_00.jpg" width="452">
                                        </a>
                                    </p>
                                    <p class="title">
                                        <a style="color: #222" target="_blank" title="更多最新武器信息尽在G_WORLD网">
                                           更多最新武器信息尽在G_WORLD网...
                                        </a>
                                    </p>
                                </li>

                            </ul>
                        </div>
                    </div>

                    <div frag="右侧文字模块" style="position: relative;">
                        <div style="color: #eee;text-align: center;">
                            <div style="width: 10.5%;float: left;">型号</div>
                            <div style="width: 10.5%;float: left;">名称</div>
                            <div style="width: 10.5%;float: left;">口径</div>
                            <div style="width: 10.5%;float: left;">类型</div>
                            <div style="float: left;width: 5.5%;">|</div>
                            <div style="width: 10.5%;float: left;">操作</div>
                        </div><br>
                        <% if(lightweaponList != null){ %>
			                <% for(Weapon weapon:lightweaponList){%>
				                <%if("轻武器".equals(weapon.getType())){ %>
				                    <div style="width:100%; color: #eee;text-align: center;">
				                        <div  style="height:25px; display:inline-block; width: 10.5%;float: left;overflow: hidden;"><%=weapon.getModel() %></div>
				                        <div  style="height:25px; display:inline-block; width: 10.5%;float: left;overflow: hidden;"><%=weapon.getName() %></div>
				                        <div  style="height:25px; display:inline-block; width: 10.5%;float: left;overflow: hidden;"><%=weapon.getCaliber() %></div>
				                        <div  style="height:25px; display:inline-block; width: 10.5%;float: left;overflow: hidden;"><%=weapon.getType() %></div>
				                        <div  style="display:inline-block; float: left;width: 5.5%;">|</div>		                        
				                        <div  style="display:inline-block; width: 10.5%;float: left;overflow: hidden;">
				                        	
				                        	<div style="float:left;width: 45%">
				                        		<a style="color:#a00;" href="weapon_detail_servlet?model=<%=weapon.getModel() %>">详情</a>
				                        	</div>
				                            <div style="float:left;width: 50%">
				                            	<a style="color:#a00;" href=" " onclick="window.confirm('确定删除吗？')?this.href='weapon_deleteServlet?model=<%=weapon.getModel()%>':this.href='index.jsp';">
				                            		删除
				                            	</a>
				                            </div>
				                            
				                        </div>
				                    </div>
				                    <br>
			                    <%}%>			                    
			                <%}%>
            			<%}%>
            			<!-- 动态生成页面跳转标签 -->
            			<div style="left:67%; color: #eee;text-align: center;top:218px;position: absolute;">
            				<a href="index.jsp?lcurrentpage=<%=lcurrentpage>1 ? lcurrentpage-1:1%>"><%="< "%></a>
            				<%for(int i=1;i<=lpage_num;i++){ %>
            					<%if (i == lcurrentpage){ %>
            						<a style="color:#a00" href="index.jsp?lcurrentpage=<%=i%>"><%=" "+i+" "%></a>
            					<%}else{ %>
	            					<a href="index.jsp?lcurrentpage=<%=i%>"><%=" "+i+" "%></a>
                      			<%}%>
                      		<%}%>
                      		<a href="index.jsp?lcurrentpage=<%=lcurrentpage<lpage_num ? lcurrentpage+1:lpage_num%>"><%=" >"%></a>
            			</div>
            			
                    </div>
                </div>
            </div>
        </div>
        <!--轻武器部分结束-->

        <!--中间大模块部分开始-->
        <div class="wp-wrapper">
            <div class="wp-inner clearfix">

                <!--左侧模块-->
                <div class="mainl clearfix">
                    <!--重武器模块-->
                    <div>
                        <div class="headbar clearfix">
                            <h3 class="post-title">重武器</h3>
                            <div class="post-more">
                                <a href="weapon/weapon_add.jsp" class="focus-more" style="color: #f00">
                                    <span>添加信息>></span>
                                </a>
                            </div>
                        </div>
                        <div class="modcon modcon1 clearfix" style="height:124px; width: 654px;position: relative;">
                            <div class="bks">
                                <div style="color: #eee;text-align: center;">
                            		<div style="width: 15.5%;float: left;">型号</div>
	                            	<div style="width: 15.5%;float: left;">名称</div>
	                            	<div style="width: 15.5%;float: left;">口径</div>
	                            	<div style="width: 15.5%;float: left;">类型</div>
	                            	<div style="float: left;width: 15.5%;">|</div>
	                            	<div style="width: 18.5%;float: left;">操作</div>
                        		</div>
                        		<% if(heavenweaponList != null){ %>
					                <% for(Weapon weapon:heavenweaponList){%>
						                <%if("重武器".equals(weapon.getType())){ %>
						                    <div style="width:100%; color: #eee;text-align: center;">
						                        <div  style="height:25px; display:inline-block; width: 15.5%;float: left;overflow: hidden;"><%=weapon.getModel() %></div>
						                        <div  style="height:25px; display:inline-block; width: 15.5%;float: left;overflow: hidden;"><%=weapon.getName() %></div>
						                        <div  style="height:25px; display:inline-block; width: 15.5%;float: left;overflow: hidden;"><%=weapon.getCaliber() %></div>
						                        <div  style="height:25px; display:inline-block; width: 15.5%;float: left;overflow: hidden;"><%=weapon.getType() %></div>
						                        <div  style="display:inline-block; float: left;width: 15.5%;">|</div>		                        
						                        <div  style="display:inline-block; width: 18.5%;float: left;overflow: hidden;">
						                        	
						                        	<div style="float:left;width: 45%">
						                        		<a style="color:#a00;" href="weapon_detail_servlet?model=<%=weapon.getModel() %>">详情</a>
						                        	</div>
						                            <div style="float:left;width: 50%">
						                            	<a style="color:#a00;" href=" " onclick="window.confirm('确定删除吗？')?this.href='weapon_deleteServlet?model=<%=weapon.getModel()%>':this.href='index.jsp';">
						                            		删除
						                            	</a>
						                            </div>
						                            
						                        </div>
						                    </div>
						                <%}%>			                    
					                <%}%>
            					<%}%>
            					<!-- 动态生成页面跳转标签 -->
		            			<div style="left:46%; color: #eee;text-align: center;top:110px;position: absolute;">
		            				<a href="index.jsp?hcurrentpage=<%=hcurrentpage>1 ? hcurrentpage-1:1%>"><%="< "%></a>
		            				<%for(int i=1;i<=hpage_num;i++){ %>
		            					<%if (i == hcurrentpage){ %>
		            						<a style="color:#a00" href="index.jsp?hcurrentpage=<%=i%>"><%=" "+i+" "%></a>
		            					<%}else{ %>
			            					<a href="index.jsp?hcurrentpage=<%=i%>"><%=" "+i+" "%></a>
		                      			<%}%>
		                      		<%}%>
		                      		<a href="index.jsp?hcurrentpage=<%=hcurrentpage<hpage_num ? hcurrentpage+1:hpage_num%>"><%=" >"%></a>
		            			</div>
                            </div>
                        </div>                       
                    </div>
                    <!--重武器部分结束-->

                    <!--冷兵器部分-->
                    <div>
                        <div class="headbar clearfix">
                            <h3 class="post-title">冷兵器</h3>
                            <div class="post-more">
                                <a href="weapon/weapon_add.jsp" class="focus-more" style="color: #f00">
                                    <span>添加信息>></span>
                                </a>
                            </div>
                        </div>
                        <div class="modcon clearfix" style="height: 184px;width: 654px;position: absolute;">
                       		<div style="color: #eee;text-align: center;">
                            		<div style="width: 15.5%;float: left;">型号</div>
	                            	<div style="width: 15.5%;float: left;">名称</div>
	                            	<div style="width: 15.5%;float: left;">口径</div>
	                            	<div style="width: 15.5%;float: left;">类型</div>
	                            	<div style="float: left;width: 15.5%;">|</div>
	                            	<div style="width: 18.5%;float: left;">操作</div>
                        	</div>
                        	<% if(coldweaponList != null){ %>
					                <% for(Weapon weapon:coldweaponList){%>
						                <%if("冷兵器".equals(weapon.getType())){ %>
						                    <div style="width:100%; color: #eee;text-align: center;">
						                        <div  style="height:25px; display:inline-block; width: 15.5%;float: left;overflow: hidden;"><%=weapon.getModel() %></div>
						                        <div  style="height:25px; display:inline-block; width: 15.5%;float: left;overflow: hidden;"><%=weapon.getName() %></div>
						                        <div  style="height:25px; display:inline-block; width: 15.5%;float: left;overflow: hidden;"><%=weapon.getCaliber() %></div>
						                        <div  style="height:25px; display:inline-block; width: 15.5%;float: left;overflow: hidden;"><%=weapon.getType() %></div>
						                        <div  style="display:inline-block; float: left;width: 15.5%;">|</div>		                        
						                        <div  style="display:inline-block; width: 18.5%;float: left;overflow: hidden;">
						                        	
						                        	<div style="float:left;width: 45%">
						                        		<a style="color:#a00;" href="weapon_detail_servlet?model=<%=weapon.getModel() %>">详情</a>
						                        	</div>
						                            <div style="float:left;width: 50%">
						                            	<a style="color:#a00;" href=" " onclick="window.confirm('确定删除吗？')?this.href='weapon_deleteServlet?model=<%=weapon.getModel()%>':this.href='index.jsp';">
						                            		删除
						                            	</a>
						                            </div>
						                            
						                        </div>
						                    </div>
						                <%} %>			                    
					                <%}%>
            					<%}%>
            					<!-- 动态生成页面跳转标签 -->
		            			<div style="left:46%; color: #eee;text-align: center;top:170px;position: absolute;">
		            				<a href="index.jsp?ccurrentpage=<%=ccurrentpage>1 ? ccurrentpage-1:1%>"><%="< "%></a>
		            				<%for(int i=1;i<=cpage_num;i++){ %>
		            					<%if (i == ccurrentpage){ %>
		            						<a style="color:#a00" href="index.jsp?ccurrentpage=<%=i%>"><%=" "+i+" "%></a>
		            					<%}else{ %>
			            					<a href="index.jsp?ccurrentpage=<%=i%>"><%=" "+i+" "%></a>
		                      			<%}%>
		                      		<%}%>
		                      		<a href="index.jsp?ccurrentpage=<%=ccurrentpage<cpage_num ? ccurrentpage+1:cpage_num%>"><%=" >"%></a>
		            			</div>
                    	</div>
                    </div>
                    <!--冷兵器部分结束-->

                </div>
                <!--左侧模块结束-->

                <!--右侧模块-->
                <div class="mainr">
                
                    <div class="mod4 clearfix" style="height: 203px;">
                        <div class="action">
                            <p class="icont">
                                <a style="color: #222" href="" target="_blank">重武器热点</a>
                            </p>
                        </div>
                        <div class="actcon">
                            <div id="wp_news_w10">
                                <script type="text/javascript">
                                    var w55imgJsons = [
                                        {
                                            title:"重武器热点",
                                            src:"<a href='' target='_blank' title='重武器热点'><img src='image/vf_1_wolf01.jpg' width='640'></a>",
                                            text:"<a href='' target='_blank' title='重武器热点'></a>"
                                        },
                                        {}
                                    ];
                                    w55imgJsons.pop();
                                </script>
                                <div id="focus"></div>
                            </div>
                        </div>
                    </div>
                    <div class="mod5 clearfix" style="height: 203px;">
                        <div class="action">
                            <p class="icont">
                                <a style="color: #222" target="_blank">冷兵器热点</a>
                            </p>
                        </div>
                        <div class="actcon">
                            <div id="wp_news_w11">
                                <script type="text/javascript">
                                    var w56imgJsons = [
                                        {
                                            title:" ",
                                            src:"<a href=' ' target='_blank' title=' '><img src='image/knife_01.jpg' width='640'></a>",
                                            text:"<a href=' ' target='_blank' title=' '></a>"
                                        },

                                        {
                                            title:" ",
                                            src:"<a href='index.jsp' target='_blank' title=' '><img src='image/knife_02.jpeg' width='640'></a>",
                                            text:"<a href='index.jsp ' target='_blank' title=' '> </a>"
                                        },

                                        {
                                            title:"",
                                            src:"<a href=' ' target='_blank' title=' '><img src='image/knife_03.jpg' width='640'></a>",
                                            text:"<a href=' ' target='_blank' title=' '></a>"
                                        },

                                        {
                                        	title:"",
                                            src:"<a href=' ' target='_blank' title=' '><img src='image/knife_04.jpeg' width='640'></a>",
                                            text:"<a href=' ' target='_blank' title=' '></a>"
                                        },

                                        {}
                                    ];
                                    w56imgJsons.pop();
                                </script>
                                <div id="focus2"></div>
                            </div>
                        </div>
                    </div>
                               
                </div>
                <!--右侧模块结束-->
            </div>
        </div>
        <!--中间大模块部分结束-->

    </div>
    <!--主体结束-->

    <!--footer部分-->
    <div class="wp-wrapper wp-footer" style="height: 198px;">
        <div class="wp-inner clearfix">
            <div class="footl">
                <div id="wp_nav_w14">
                    <ul class="wp_nav" data-nav-config="{drop_v: 'down', drop_w: 'right', dir: 'y', opacity_main: '-1', opacity_sub: '-1', dWidth: '0'}">

                        <li class="nav-item i1 ">
                            <a href="" title="轻武器" target="_self">
                                <span class="item-name">轻武器</span>
                            </a>
                            <i class="mark"></i>
                        </li>

                        <li class="nav-item i2 ">
                            <a href="" title="重武器" target="_self">
                                <span class="item-name">重武器</span>
                            </a>
                            <i class="mark"></i>
                        </li>

                        <li class="nav-item i3 ">
                            <a href="" title="空战武器" target="_self">
                                <span class="item-name">空战武器</span>
                            </a>
                            <i class="mark"></i>
                        </li>

                        <li class="nav-item i4 ">
                            <a href="" title="海战武器" target="_self">
                                <span class="item-name">海战武器</span>
                            </a>
                            <i class="mark"></i>
                        </li>

                        <li class="nav-item i5 ">
                            <a href="" title="陆战武器" target="_self">
                                <span class="item-name">陆战武器</span>
                            </a>
                            <i class="mark"></i>
                        </li>

                        <li class="nav-item i6 ">
                            <a href="" title="火炮系统" target="_self"><span class="item-name">火炮系统</span>
                            </a>
                            <i class="mark"></i>
                        </li>

                        <li class="nav-item i7 ">
                            <a href="" title="冷兵器" target="_self">
                                <span class="item-name">冷兵器</span>
                            </a>
                            <i class="mark"></i>
                        </li>

                        <li class="nav-item i8 ">
                            <a href="" title="搜索" target="_blank">
                                <span class="item-name">搜索</span>
                            </a>
                            <i class="mark"></i>
                        </li>

                    </ul>

                </div>
            </div>
            <div class="footc"> 
            	<a style="cursor:pointer; text-decoration:none;color:#FFF;" herf="index.jsp">
                   	<span style="font-size: 50px">G</span>_W<span style="font-size: 50px">O</span>RL<span style="font-size: 50px">D</span>
            	</a>
                <p>Copyright @ 2018 G_WORLD版权所有</p>

                <p>地址：南昌市航空大学-162015班-黄凯</p>
                <p style="margin-bottom:20px;">投诉电话：13361645545</p>
            </div>
            <div class="footr">
                <div class="icons">
                    <span style="color:#FFC661">
                        <a href="http://pewpewpew.work/" target="_blank">
                            友情链接：枪炮世界
                        </a>
                    </span>
                </div>
                <div class="views">
                    <span>G_WORLD第</span>
                    <span frag="窗口110">
                        <span><%=number%></span>
                    </span>
                    <span>位访客</span>
                </div>
            </div>

        </div>
    </div>
    <!--footer部分结束-->
</body>
</html>
