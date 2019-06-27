<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="services.WeaponService" %>
<%@ page import="entity.Weapon" %>
<%@ page import="java.util.*"%>

<html>
<head>
    <meta name="viewport" content="width=device-width,user-scalable=0,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="./cssfile/sudyslide.css" type="text/css" rel="stylesheet">
    <link href="extends/extends.css" type="text/css" rel="stylesheet">
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
            background: #444 url(../image/side01.jpg) repeat-x;height: 913px;
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
        
        .font{
        	width:1200;
        	margin:0 auto;
        	text-align:center;
        	opacity: 1;
        	position:absolute;
        	top: 300px;
        }

        .headbar h3 {
            float: left;
            font-size: 20px;
            font-weight: normal;
            color: #eee;
            line-height: 50px;
        }

        .headbar .post-more a {
            float: right;
            font-size: 12px;
            color: #eee;
            line-height: 50px;
        }

        .news .con1 .thum img {
            width: 100%;
            height: 260px;
        }

        .modcon2 .headbar h3{
            font-size: 17px;font-weight: bold;line-height: 20px;
        }

        .focus-container .focus-item img {
            width: 100%;
            height: 100%;
            border: 0;
            vertical-align: top;
        }

        .navpic .newss .thum img {width: 100%;height: 100%;}

        .navpic .newss .title a {color: #fff;font-size: 16px;line-height: 36px;}
        .navpic1 .newss .thum img {width: 100%;height: 100%;}
        .navpic2 .newss .thum img {width: 100%;height: 100%;}
        .navpic3 .newss .thum img {width: 100%;height: 100%;}
        .navpic4 .newss .thum img {width: 100%;height: 100%;}
        .plist .listc img {width: 94%;}
        .wp_nav { display:block; margin: 0; padding: 0;display: block; *zoom:1;}
        .wp_nav * {margin: 0; padding: 0}
        .wp_nav:after {clear: both;content: ".";display: block;height: 0;visibility: hidden;}
        .wp_nav .nav-item { display:inline-block; float:left; position:relative; vertical-align:bottom;}
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
        #wp_nav_w15 .wp_nav .nav-item a span.item-name {display: inline-block;padding: 17px 21px;line-height: 22px;cursor: pointer;font-size: 16px;color: #707070;background: url(../images/redline.jpg) no-repeat left 50%;}
        #wp_nav_w15 .wp_nav .nav-item.i1 a span.item-name {background: none;}
        .wp-footer {background: url(../image/footer.jpg) repeat-x;}
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
    </style>
    <title>G_WORLD</title>
</head>
<body>
	<% 	request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("utf-8");
		Weapon weapon = (Weapon)request.getSession().getAttribute("weapon");%>
    <!--头部开始-->
    <header style="padding: 8px 0;width:100%; height:120px;background:url(../image/headbar.jpg);">
        <div style="width:auto;max-width: 1200px;margin:0 auto;display:block;">
            <!--logo部分-->
            <div style="float:left;left:18.8%;width:384px;height:119px;position:absolute;margin-top: 24px;">
                    <a style="cursor:pointer; text-decoration:none;color:#FFF;" herf="../index.jsp">
                        <span style="font-size: 50px">G</span>_W<span style="font-size: 50px">O</span>RLD
                    </a>
            </div>
            <!--Logo结束-->
            <!--语言转换部分-->
            <div style="float:right;right:18.9%;width:56px;height:20px;position:absolute;margin-top: 4px;">
                <a style="font-size: 12px;color: white;text-decoration: none;font-family: 微软雅黑" href="../index.jsp">English</a>
            </div>
            <!--语言转换结束-->
            <!--搜索部分-->
            <div style="float:right;clear:right;right:19%;width:270px;height:34px;position:absolute;margin-top: 52px;border-radius: 12px;background-color: #444">
                <form method="post" action="../weapon_searchServlet" target="_blank" id="myform1">
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
                        <a style="display: inline-block;padding: 0 45px;height: 40px;line-height: 40px;color: #eee;font-size: 16px;text-decoration: none;" href="../index.jsp">首页</a>
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

    <!--主体内容部分-->
    <div class="wp-container">
        <!--详情部分-->
        <div class="wp-wrapper" style="height: 920px;">
            <div class="wp-inner clearfix" style="height: 920px;">
                <img alt="" src="../image/multi_01.jpg" style="opacity: 0.2;z-index: -200;width:1200px;height: 920px;">
                <div class="news clearfix" style="z-index: 100">
                    <div frag="详情模块" class="font">
                        <% if(weapon != null){%> 
			                    <div style="width:100%; color: #fff;text-align: center;opacity: 1;">
			                    	<a style="color:#ff0000; opacity: 1;" href="../index.jsp">返回</a><br>
			                    	<a style="color:#ff0000; opacity: 1;" href="update_weapon.jsp?model=<%=weapon.getModel()%>">修改信息</a><br>
			                       	 型号:<div  style="height:25px; display:inline-block;">
			                       	 	<%=weapon.getModel() %>
			                       	 </div><br>
									名称:<div style="height:25px; display:inline-block;">
										<%=weapon.getName() %>
									</div><br>
			                  		口径:<div style="height:25px; display:inline-block;">
			                  			<%=weapon.getCaliber() %>
			                  		</div><br>
			                     	类型:<div style="height:25px; display:inline-block;">
			                     		<%=weapon.getType() %>
			                     	</div><br>
			                     	种类:<div  style="height:25px; display:inline-block;">
			                     		<%=weapon.getVariety() %>
			                     	</div><br>
			                     	详情:<div  style="height:25px; display:inline-block;">
			                     		<%=weapon.getDetail() %>
			                     	</div><br>
			                     	路径:<div style="height: 25px;display:inline-block;">
			                     		<%=weapon.getRoute() %>
			                     	</div><br>	                        
			                    </div>	
			                    <br>		                    
            			<%}%>
                      
                    </div>
                </div>
            </div>
        </div>
        <!--轻武器部分结束-->

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
