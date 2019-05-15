<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/16
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ssm.entity.Users" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>校园回忆录</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="../css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="../css/style.min.css" rel="stylesheet">
    <!-- Bootstrap DatePicker -->
    <link href="../bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/viewer.min.css">
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="../js/bootstrap-select.min.js"></script>
    <script src="../js/viewer.min.js"></script>
</head>

<body class="sidebar-collapse" style="background-image: url('../images/01.jpg');">
${message}
<%
    Users users = (Users) session.getAttribute("currentuser");
    if (users == null) response.sendRedirect("login.jsp");
    String userimage = users.getUserimage();
    if (userimage==null)userimage = "../img/img.jpg";
    else userimage ="http://129.211.26.231:8080/upload/userimages/"+ users.getUserimage();
%>
<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-dark default-color ">

    <!-- Navbar brand -->
    <a class="navbar-brand" href="#">School Memory</a>

    <!-- Collapse button -->
    <input type="hidden" name="ExPws" id="username0" value=<%=users.getUserName()%>>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
            aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Collapsible content -->
    <div class="collapse navbar-collapse " id="basicExampleNav">

        <!-- Links -->
        <ul class="navbar-nav mr-auto">
        </ul>
        <form class="form-inline my-2 my-lg-0 ml-auto z-top" method="post">
            <input class="form-control" id="search1" type="search" placeholder="Region/Name/ID" aria-label="Search">
            <button onclick="searchClass2()" class="btn btn-outline-white btn-md my-2 my-sm-0 ml-3" type="button">Search</button>
            <script>
                function searchClass2() {
                    var value = document.getElementById("search1").value;
                    searchClass(value)
                }
            </script>
        </form>
    </div>
    <!-- Collapsible content -->

</nav>
<!--/.Navbar-->
<!--SideBar-->
<div class="container-fluid" >
    <div class="row">
        <!-- 侧边栏 -->
        <div class="sidebar">
            <div class="cover">
                <h2><img class="withripple rounded-circle" id="avatarShow" src=<%=userimage%> data-toggle="modal" data-target="#ModifyHead" /></h2>
                <b id="username1"><%=users.getUserName()%></b>
            </div>
            <ul class="sidenav animated fadeInUp">
                <li>
                    <a class="withripple" href="../Form/Loginsecc.jsp">
                        <i class="icon icon-home"></i>
                        <span class="sidespan">首页</span>
                    </a>
                </li>
                <li>
                    <a class="withripple hover" href="javascript:;">
                        <i class="icon icon-article"></i>
                        <span class="sidespan">班级管理</span>
                        <i class="iright pull-right">&gt;</i>
                    </a>
                    <ul class="sidebar-dropdown">
                        <li>
                            <a href="#" onclick="getCreateClass()" class="withripple" >我创建的班级
                            </a>
                        </li>
                        <li>
                            <a href="#" onclick="getAddClass()" class="withripple" >我加入的班级
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="withripple " data-toggle="modal" href="#JoinClass">
                        <i class="icon icon-ui"></i>
                        <span class="sidespan"> 加入班级 </span>
                    </a>
                </li>
                <li>
                    <a class="withripple" data-toggle="modal" href="#CreateClass">
                        <i class="fas fa-plus" ></i>
                        <span class="sidespan"> 创建班级 </span>
                    </a>
                </li>
                <li>
                    <a class="withripple" href="javascript:;">
                        <i class="icon icon-php"></i>
                        <span class="sidespan">个人信息管理</span>
                        <i class="iright pull-right">&gt;</i>
                    </a>
                    <ul class="sidebar-dropdown">
                        <li>
                            <a data-toggle="modal" href="#ModifyInfo" class="withripple">资料修改
                            </a>
                        </li>
                        <li>
                            <a data-toggle="modal" href="#ModifyPwd" class="withripple">密码修改
                            </a>
                        </li>
                        <li>
                            <a href="../Form/login.jsp" class="withripple">注销登录
                            </a>

                        </li>
                    </ul>
                </li>
                <li>
                    <div>
                        <a class="withripple" href="javascript:;">
                            <i class="fas fa-arrows-alt-h"></i>
                            <span class="sidespan"> 展开/收缩 </span>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
        <!-- 侧边栏 完-->

    </div>
</div>
<!--/SideBar-->

<!-- Card -->
<%--<div>--%>
<%--<div class="card">--%>
<%--<!-- Card image -->--%>
<%--<img class="card-img-top" src="../img/05.jpg" alt="Card image cap">--%>
<%--<!-- Card content -->--%>
<%--<div class="card-body">--%>
<%--<!-- Title -->--%>
<%--<h4 class="card-title"><a>Youth</a></h4>--%>
<%--<!-- Text -->--%>
<%--<p class="card-text" > 青春，就是时间给予我们最好的礼物; 而学校，恰好承载着这一切。</p>--%>
<%--<p class="card-text" > 校园给予了我们太多太多，以至于我们永远也不曾忘记。</p>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<!-- 侧边栏外-->
<div style="margin-top: 2%" id="main">
   
</div>
<script>
    var viewer = new Viewer(document.getElementById('main'), {
        url: 'data-original'
    });
</script>
<!-- Card -->

<!-- Central Modal -->
<div class="modal fade" id="ModifyHead" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="ModifyHeadLabel">修改头像</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" enctype="multipart/form-data">
                    <img class="rounded-circle" id="avatarShow2" src=<%=userimage%> height="75" width="75" />
                    <div class="btn btn-default" id="UploadHeadImg">
                        <span></span>
                        <input type="file" id="userimage" name="userimage">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                        <button type="button" onclick="upload()" class="btn btn-primary btn-sm">Save changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Central Modal -->

<!-- Central Modal -->
<div class="modal fade" id="ModifyInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="ModifyInfoLabel">个人信息修改</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div>
                    <form method="post">
                        <div class="md-form">
                            <input type="text" id="username" class="form-control" name="username" value=<%=users.getUserName()%>>
                            <label for="username">输入用户名</label>
                        </div>
                        <div class="md-form">
                            <input type="text" id="realname" class="form-control" name="realname" value=<%=users.getRealname()%>>
                            <label for="realname">输入姓名</label>
                        </div>
                        <div class="md-form">
                            <div class="form-group">
                                <select name="sex" id="sex" class="form-control" title=<%=users.getSex()%>>
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="md-form">
                            <div class="row">
                                <div class="col-md-5" id="sandbox-container">
                                    <input type="text" class="form-control" id="birthday" name="birthday" value=<%=users.getBirthday()%>>
                                    <label for="birthday">
                                        &nbsp;&nbsp;&nbsp;&nbsp;生日
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="md-form">
                            <input type="text" id="userQQ" class="form-control" name="userQQ" value=<%=users.getUserQQ()%>>
                            <label for="userQQ">输入QQ号码</label>
                        </div>
                        <div class="md-form">
                            <input type="text" id="userwechat" class="form-control" name="userwechat" value=<%=users.getUserwechat()%>>
                            <label for="userwechat">输入微信号码</label>
                        </div>
                        <div class="md-form">
                            <input type="text" id="email" class="form-control" name="email" value=<%=users.getEmail()%>>
                            <label for="email">输入电子邮箱</label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                            <button type="button" onclick="Edit()" class="btn btn-primary btn-sm">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Central Modal -->

<!-- Central Modal -->
<div class="modal fade" id="ModifyPwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="ModifyPwdLabel">修改密码</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="md-form">
                        <input type="password" id="oldPwd" class="form-control">
                        <label for="oldPwd">输入原密码</label>
                    </div>
                    <div class="md-form">
                        <input type="password" id="newPwd" class="form-control">
                        <label for="newPwd">输入新密码</label>
                    </div>
                    <div class="md-form">
                        <input type="password" id="confirmPwd" class="form-control">
                        <label for="confirmPwd">确认密码</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                        <button type="button" onclick="editPass()" class="btn btn-primary btn-sm">Save changes</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- Central Modal -->

<!-- Central Modal -->
<div class="modal fade" id="AddClass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="ModifyADDLabel">加入班级</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post">
                    <div class="md-form">
                        <input type="text" id="sid" class="cid form-control" readonly>
                    </div>
                    <div class="md-form">
                        <input type="password" id="pwd" class="form-control">
                        <label for="pwd">输入新密码</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                        <button type="button" onclick="AddClass()" class="btn btn-primary btn-sm">ADD</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- Central Modal -->

<!-- Central Modal -->
<div class="modal fade" id="enterintoClass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="ModifyenterintoLabel">是否进入班级？</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="${pageContext.request.contextPath}/Article/enterIntoClass">
                    <div class="md-form">
                        <input type="text" id="Label" class="form-control" readonly value="班级ID">
                    </div>
                    <div class="md-form">
                        <input type="text" id="s_id" name="s_id" class="cid form-control" readonly>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary btn-sm">ENTER</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- Central Modal -->

<!-- Central Modal -->
<div class="modal fade" id="CreateClass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="CreateClassLabel">创建班级</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post">
                    <div class="md-form">
                        <input type="text" id="CreateAddress" class="form-control" onchange="">
                        <label for="CreateAddress">输入地址</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="CreateYear" class="form-control" onchange="">
                        <label for="CreateYear">输入入学年份</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="CreateClassNo" class="form-control" onchange="">
                        <label for="CreateClassNo">输入班级名称</label>
                    </div>
                    <div class="md-form">
                        <%--<input type="text" id="CreateClassDes" class="form-control" onchange="">--%>
                        <%--<label for="CreateClassDes">输入班级描述</label>--%>
                        <textarea id="CreateClassDes" class="md-textarea form-control" rows="3"></textarea>
                        <label for="CreateClassDes">输入班级描述</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                        <button type="button" onclick="createClass()" class="btn btn-primary btn-sm">Save changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Central Modal -->

<!-- Central Modal -->
<div class="modal fade" id="JoinClass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="JoinClassLabel">加入班级</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post">
                    <div class="md-form">
                        <input type="text" id="search" class="form-control" onchange="">
                        <label for="search">输入地址、名称、ID</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" onclick="searchClass1()" class="btn btn-primary btn-sm">Search</button>
                        <script>
                            function searchClass1() {
                                var value = document.getElementById("search").value;
                                searchClass(value)
                            }
                        </script>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Central Modal -->

<%--
<div class="docs-methods">
            <form class="form-inline">
                <div id="distpicker">
                    <div class="form-group">
                        <div style="position: relative;">
                            <input id="city-picker3" class="form-control" readonly type="text" value="江苏省/常州市/溧阳市" data-toggle="city-picker">
                        </div>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-warning" id="reset" type="button">重置</button>
                        <button class="btn btn-danger" id="destroy" type="button">确定</button>
                    </div>
                </div>
            </form>
        </div>
--%>

<style>
    /* 只是针对bootstrap-2.2.1 */
    body {
        display: block;
    }
    [class*="span"]{
        float:none; min-width:auto; margin-left:0;text-align: center;
    }

    @font-face {
        font-family: 'iconfont';
        src: url('//at.alicdn.com/t/font_1474372709_4341202.eot'); /* IE9*/
        src: url('//at.alicdn.com/t/font_1474372709_4341202.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
        url('//at.alicdn.com/t/font_1474372709_4341202.woff') format('woff'), /* chrome、firefox */
        url('//at.alicdn.com/t/font_1474372709_4341202.ttf') format('truetype'), /* chrome、firefox、opera、Safari, Android, iOS 4.2+*/
        url('//at.alicdn.com/t/font_1474372709_4341202.svg#iconfont') format('svg'); /* iOS 4.1- */
    }
    .icon{
        font-family:"iconfont" !important;
        font-size:16px;
        font-style:normal;
        -webkit-font-smoothing: antialiased;
        /*-webkit-text-stroke-width: 0.2px;*/
        -moz-osx-font-smoothing: grayscale;
    }


    .icon-home:before{content: "\e605";}
    .icon-article:before{content: "\e604";}
    .icon-ui:before{content: "\e601";}
    .icon-web:before{content: "\e606";}
    .icon-php:before{content: "\e603";}
    .icon-menu:before{content: "\e608";}
    .icon-setting:before{content: "\e600";}
    /* sidebar
     ---------------------------------------- */
    .sidebar{
        position: fixed;
        width: 215px;
        top: 8%;
        height: 92%;
        background: #262930;
        transition: all .3s ease;
        z-index: 1;
    }
    .cover{
        padding-top:40px; padding-bottom: 10px;
        text-align: center;  background: #20242c;
    }
    .cover > h2{
        position: relative;
        margin: 0 auto; max-height: 80px; max-width: 80px;
        background: #3d4147; border: 1px solid #1ab394; border-radius: 50%;
    }
    .cover > h2 img{
        position: relative; z-index: 100;
        width: 100%; margin-left: -5px;
        border: 1px solid #1ab394;
    }
    .cover > h2:after{
        content:'';
        position: absolute; left: -12px; top: -8px;
        height: 96px; width: 96px;
        background: #3d4147; border-radius: 50%;
    }
    .cover > b{
        display: block;
        margin-top: 20px;
        color: #f3f3f4; font-size: 13px;
    }
    .cover > p{ margin-top: 4px;color: #acb0b8; font-size: 12px;}
    /*sidenav*/
    .sidenav,.sidebar-dropdown{margin:0; padding: 0;}
    .sidenav i, a{color: #9d9d9d; text-decoration: none;}
    .sidenav > li > a{
        display: block; padding: 10px;
        font-size: 14px; border-left: 2px solid transparent;
        transition: .3s linear;
    }
    .sidenav > li > div > a{
        display: block; padding: 10px;
        font-size: 14px; border-left: 2px solid transparent;
        transition: .3s linear;
    }
    .sidenav > li > a > i{margin-right: 10px;}
    .sidenav > li > div > a > i{margin-right: 10px;}
    .sidenav > li > a.hover,
    .sidenav > li > a:hover{
        border-left: 2px solid #21b496; background: #20242c; text-decoration: none;
    }
    .iright{margin-top: 4px; font-family:"宋体"; font-style: normal; }
    .sidebar-dropdown{
        display: none;
        font-size: 14px; background: #20242c; border-left: 2px solid #21b496; }
    .sidebar-dropdown > li > a{display: block; padding: 10px 0 10px 36px;}
    /*伸缩侧边css代码*/
    /*.sidebar-collapse .card{margin-left: 80px; }*/
    .sidebar-collapse .BackGround{margin-left: 60px;}
    .sidebar-collapse .sidebar{width: 60px;}
    .sidebar-collapse .sidenav > li{position: relative; z-index: 9999; text-align: center;}
    .sidebar-collapse .sidenav > li:hover > a{border-left: 2px solid #21b496; background: #20242c; text-decoration: none;}
    .sidebar-collapse .sidenav > li:hover .sidebar-dropdown{display: block!important;}
    .sidebar-collapse .cover > b{font-size: 12px;}
    .sidebar-collapse .cover > p,
    .sidebar-collapse .sidespan,
    .sidebar-collapse .iright,
    .sidebar-collapse .cover > h2:after{
        display: none;
    }
    .sidebar-collapse .cover{padding-top: 30px;}
    .sidebar-collapse .cover > h2{margin: 6px;}
    .sidebar-collapse .sidebar-dropdown{
        position: absolute; top: 0; left: 60px; z-index: 9999;
        display: none!important;
        width: 150px; border-left: none; list-style: none;
    }
    .sidebar-collapse .sidebar-dropdown > li > a{padding-left: 0; }
    .sidebar-collapse .sidebar-dropdown > li > a:hover{background: #191e26; text-decoration: none; color: #fff;}
    .sidebar-collapse .cover > h2 img{margin-left: 0; border: none;}
    .navbar{
        position: fixed;
        top: 0;
        height: auto;
        width: 100%;
        z-index: 2;
    }
    .navbar-brand {
        font-family: "Lucida Handwriting";
        font-size: 25px;
    }
    .card{
        /*!*top: 8%;*!*/
        /*position: fixed;*/
        /*margin-left: 235px;*/
        margin-left: 80px;
        margin-top: 20px;
        transition: .3s linear;
        /*z-index: 0;*/
    }
    /*.card-title{*/
    /*font-family: "Lucida Handwriting";*/
    /*font-size: 20px;*/
    /*}*/
    .card-text{
        font-family: "华文行楷";
    }
    .carousel{
        position: fixed;
        overflow: hidden;
        transition: all .3s ease;
        width: 500px;
        height: 340px;
        margin-left: 620px;
        /*margin-left: 450px;*/
    }
    .carousel-item{
        width: 500px;
        height:340px;
        transition: all .3s ease;
    }
    .carousel-inner img {
        width:100%;
    }
    .nav {
        margin-bottom: 20px;
        margin-left: 0;
        list-style: none;
    }
    .navbar-left{float:left; margin:15px 0 0 15px;}
    .navbar-side>li>a{color: #666;}
    .navbar-side>li>a:hover,.navbar-side>li>a:focus,.navbar-side>li>a:active{background: none;}


</style>

<%--<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>--%>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="../js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="../js/mdb.min.js"></script>
<!-- Bootstrap DatePicker -->
<script type="text/javascript" src="../bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap DatePicker Locole-->
<script type="text/javascript" src="../bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>



<script>
    $('#sandbox-container input').datepicker({
        language: "zh-CN"
    });

    /* 侧边栏切换形态 */
    $(".sidenav > li > div > a").click(function(){
        $("body").toggleClass("sidebar-collapse");
        if($("body").hasClass("sidebar-collapse")){
        }else{}
        return false;
    });

    $(".sidenav>li>a").click(function(){
        $(this).addClass("hover");
        $(this).next().slideToggle();
        $(this).parent().siblings().children("a").removeClass("hover").next().slideUp();
    });


</script>
<script>
    var log;
    function upload() {
        var filename = document.getElementById("userimage").value;
        console.log(filename);
        if (filename == "") { alert("请选择要上传的文件"); return; }
        var result_msg = "";
        $.ajaxFileUpload({
            url: '${pageContext.request.contextPath}/UploadUserImage',  //这里是服务器处理的代码
            type: 'post',
            secureuri: false, //一般设置为false
            fileElementId: 'userimage', // 上传文件的id、name属性名
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                filename: filename
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                $("#avatarShow").attr("src",data.url);
                $("#avatarShow2").attr("src",data.url);
            },
            error: function (data, status, e) {
            }
        });
    }
    function Edit(separator, limit) {
        var realname = document.getElementById("realname").value;
        var username = document.getElementById("username").value;
        var  myselect=document.getElementById("sex");
        var sex = myselect.options[myselect.selectedIndex].value;
        var userQQ = document.getElementById("userQQ").value;
        var email = document.getElementById("email").value;
        var userwechat = document.getElementById("userwechat").value;
        var birthday = document.getElementById("birthday").value.replace(/[^0-9]/ig,"");
        console.log(birthday.replace(/[^0-9]/ig,""));
        $.ajaxFileUpload({
            url: '${pageContext.request.contextPath}/Edit',  //这里是服务器处理的代码
            type: 'post',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                realname: realname,
                username: username,
                sex:sex,
                userQQ:userQQ,
                email:email,
                userwechat:userwechat,
                birthday:birthday
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                $("#realname").attr("value",data.realname);
                $("#sex").attr("value",data.sex);
                $("#userQQ").attr("value",data.userQQ);
                $("#email").attr("value",data.email);
                $("#userwechat").attr("value",data.userwechat);
                $("#birthday").attr("value",data.birthday);
                document.getElementById("username1").innerHTML = data.username;
                alert(data.editmessage)
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        });
    }
    function getCreateClass() {
        $.ajaxFileUpload({
            url: '${pageContext.request.contextPath}/SchoolClass/getCreateClass',  //这里是服务器处理的代码
            type: 'post',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                var html = "";
                for (var i = 0 ;i<data.length;i++){
                    console.log(data[i].sid);

                    var newhtml = "<div class=\"card\" style=\"width: 18rem;float: left\">\n" +
                        "        <img class=\"card-img-top\" src=\"../img/05.jpg\" alt=\"Card image cap\">\n" +
                        "        <div class=\"card-body\">\n" +
                        "            <h5 class=\"card-title\">"+data[i].classname+"</h5>\n" +
                        "            <p class=\"card-text\">"+data[i].sid+"</p>\n" +
                        "            <p class=\"card-text\">"+data[i].year+"</p>\n" +
                        "            <p class=\"card-text\">"+data[i].address+"</p>\n" +
                        "            <p class=\"card-text\">"+data[i].description+"</p>\n" +
                        "            <button data-target='#enterintoClass' data-toggle='modal' data-whatever='"+data[i].sid+"' class=\"btn btn-primary\">进入班级</button>\n" +
                        "        </div>\n" +
                        "    </div>";
                    html += newhtml;
                }
                document.getElementById("main").innerHTML = html;
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        });
    }
    function getAddClass() {
        $.ajaxFileUpload({
            url: '${pageContext.request.contextPath}/SchoolClass/getAddClass',  //这里是服务器处理的代码
            type: 'post',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                var html = "";
                for (var i = 0 ;i<data.length;i++){
                    console.log(data[i].sid);

                    var newhtml = "<div class=\"card\" style=\"width: 18rem;float: left\">\n" +
                        "        <img class=\"card-img-top\" src=\"../img/05.jpg\" alt=\"Card image cap\">\n" +
                        "        <div class=\"card-body\">\n" +
                        "            <h5 class=\"card-title\">"+data[i].classname+"</h5>\n" +
                        "            <p class=\"card-text\">"+data[i].sid+"</p>\n" +
                        "            <p class=\"card-text\">"+data[i].year+"</p>\n" +
                        "            <p class=\"card-text\">"+data[i].address+"</p>\n" +
                        "            <p class=\"card-text\">"+data[i].description+"</p>\n" +
                        "            <button data-target='#enterintoClass' data-toggle='modal' data-whatever='"+data[i].sid+"' class=\"btn btn-primary\">进入班级</button>\n" +
                        "        </div>\n" +
                        "    </div>";
                    html += newhtml;
                }
                document.getElementById("main").innerHTML = html;
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        });
    }
    function createClass() {
        var address = document.getElementById("CreateAddress").value;
        var year = document.getElementById("CreateYear").value;
        var classname = document.getElementById("CreateClassNo").value;
        var description = document.getElementById("CreateClassDes").value;
        $.ajaxFileUpload({
            url: '${pageContext.request.contextPath}/SchoolClass/CreateClass',  //这里是服务器处理的代码
            type: 'post',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                address: address,
                year: year,
                classname:classname,
                description:description
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                alert("创建成功，班级密码为："+data.Pwd)
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })
    }
    function searchClass(e) {
        var value = e;
        log = e;
        $.ajax({
            url: '${pageContext.request.contextPath}/SchoolClass/SearchClass',  //这里是服务器处理的代码
            type: 'get',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                value:value
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                var html = "";
                html += "<div style=\"clear:both;margin-left: 100px;margin-top: 20px;padding-top: 20px\"><h3>我创建的</h3></div>\n" +
                    "    ";
                for (var i = 0;i<data[0].length;i++){
                    if (data[0][i] == null)continue;
                    var newhtml = "<div class=\"card\" style=\"width: 18rem;float: left\">\n" +
                        "        <img class=\"card-img-top\" src=\"../img/05.jpg\" alt=\"Card image cap\">\n" +
                        "        <div class=\"card-body\">\n" +
                        "            <h5 class=\"card-title\">"+data[0][i].classname+"</h5>\n" +
                        "            <p class=\"card-text\">"+data[0][i].sid+"</p>\n" +
                        "            <p class=\"card-text\">"+data[0][i].year+"</p>\n" +
                        "            <p class=\"card-text\">"+data[0][i].address+"</p>\n" +
                        "            <p class=\"card-text\">"+data[0][i].description+"</p>\n" +
                        "            <button data-target='#enterintoClass' data-toggle='modal' data-whatever='"+data[0][i].sid+"' class=\"btn btn-primary\">进入班级</button>\n" +

                        "        </div>\n" +
                        "    </div>";
                    html += newhtml;
                }
                html += "<div style=\"clear:both;margin-left: 100px;margin-top: 20px;padding-top: 20px\"><h3>我加入的</h3></div>\n" +
                    "    ";
                for (var i = 0;i<data[1].length;i++){
                    if (data[1][i] == null)continue;
                    var newhtml = "<div class=\"card\" style=\"width: 18rem;float: left\">\n" +
                        "        <img class=\"card-img-top\" src=\"../img/05.jpg\" alt=\"Card image cap\">\n" +
                        "        <div class=\"card-body\">\n" +
                        "            <h5 class=\"card-title\">"+data[1][i].classname+"</h5>\n" +
                        "            <p class=\"card-text\">"+data[1][i].sid+"</p>\n" +
                        "            <p class=\"card-text\">"+data[1][i].year+"</p>\n" +
                        "            <p class=\"card-text\">"+data[1][i].address+"</p>\n" +
                        "            <p class=\"card-text\">"+data[1][i].description+"</p>\n" +
                        "            <button data-target='#enterintoClass' data-toggle='modal' data-whatever='"+data[1][i].sid+"' class=\"btn btn-primary\">进入班级</button>\n" +

                        "        </div>\n" +
                        "    </div>";
                    html += newhtml;
                }

                html += "<div style=\"clear:both;margin-left: 100px;margin-top: 20px;padding-top: 20px\"><h3>我未加入的</h3></div>\n" +
                    "    ";
                for (var i = 0;i<data[2].length;i++){
                    if (data[2][i] == null)continue;
                    var newhtml = "<div class=\"card\" style=\"width: 18rem;float: left\">\n" +
                        "        <img class=\"card-img-top\" src=\"../img/05.jpg\" alt=\"Card image cap\">\n" +
                        "        <div class=\"card-body\">\n" +
                        "            <h5 class=\"card-title\">"+data[2][i].classname+"</h5>\n" +
                        "            <p class=\"card-text\">"+data[2][i].sid+"</p>\n" +
                        "            <p class=\"card-text\">"+data[2][i].year+"</p>\n" +
                        "            <p class=\"card-text\">"+data[2][i].address+"</p>\n" +
                        "            <p class=\"card-text\">"+data[2][i].description+"</p>\n" +
                        "            <button data-target='#AddClass' data-toggle='modal' data-whatever='"+data[2][i].sid+"' class=\"btn btn-primary\">加入班级</button>\n" +
                        "        </div>\n" +
                        "    </div>";
                    html += newhtml;
                }
                document.getElementById("main").innerHTML = html;
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })

    }

    function AddClass() {
        var sid = document.getElementById("sid").value;
        var password = document.getElementById("pwd").value;
        console.log(sid);
        $.ajaxFileUpload({
            url: '${pageContext.request.contextPath}/SchoolClass/AddClass',  //这里是服务器处理的代码
            type: 'post',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                sid:sid,
                password:password
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                alert(data.message);
                searchClass(log)
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })
    }

    function getAddClassMessage(e) {
        console.log(e);
        var sid = e;
        $.ajax({
            url: '${pageContext.request.contextPath}/SchoolClass/getClassMessage',  //这里是服务器处理的代码
            type: 'get',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                sid:sid
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                var date = new Date(data[0].createtime);
                console.log(date);
                $("#sid_mess2").attr("value",data[0].sid);
                $("#classname_mess2").attr("value",data[0].classname);
                $("#address_mess2").attr("value",data[0].address);
                $("#year_mess2").attr("value",data[0].year);
                $("#createtime_mess2").attr("value",date);
                $("#description_mess2").attr("value",data[0].description)
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })
    }
    function getClassMessage(e) {
        console.log(e);
        var sid = e;
        $.ajax({
            url: '${pageContext.request.contextPath}/SchoolClass/getClassMessage',  //这里是服务器处理的代码
            type: 'get',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                sid:sid
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                var date = new Date(data[0].createtime);
                console.log(date);
                $("#sid_mess").attr("value",data[0].sid);
                $("#classname_mess").attr("value",data[0].classname);
                $("#address_mess").attr("value",data[0].address);
                $("#year_mess").attr("value",data[0].year);
                $("#createtime_mess").attr("value",date);
                $("#description_mess").attr("value",data[0].description)
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })
    }

    $('#AddClass').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // 触发事件的按钮  
        var recipient = button.data('whatever'); // 解析出whatever内容  
        var modal = $(this);  //获得模态框本身
        modal.find('.modal-body .cid').val(recipient);
    });

    $('#enterintoClass').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // 触发事件的按钮  
        var recipient = button.data('whatever'); // 解析出whatever内容  
        var modal = $(this);  //获得模态框本身
        modal.find('.modal-body .cid').val(recipient);
    })


    function editPass() {
        var oldPwd = document.getElementById("oldPwd").value;
        var newPwd = document.getElementById("newPwd").value;
        var confirmPwd = document.getElementById("confirmPwd").value;
        if (newPwd!=confirmPwd){
            alert("请确认密码!");
            return;
        }
        $.ajaxFileUpload({
            url: '${pageContext.request.contextPath}/EditPass',  //这里是服务器处理的代码
            type: 'post',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                oldPwd:oldPwd,
                newPwd:newPwd
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                alert(data.editmessage)
                if(data.editmessage!=null){
                    window.location.href="../Form/login.jsp";
                }
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })
    }
    function loginOut() {
        $.ajax({
            url: '${pageContext.request.contextPath}/LoginOut',  //这里是服务器处理的代码
            type: 'get',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data:{},
            success: function (data, status) {
                console.log(data.loginout);
                if (data.loginout == 1){
                    window.location.href = "../Form/login.jsp";
                }
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })
    }
</script>
</body>
</html>
