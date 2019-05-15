<%@ page import="ssm.entity.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="ssm.entity.Users" %>
<%@ page import="ssm.entity.SchoolClass" %>
<%@ page import="ssm.entity.UserAndSchoolClass" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/2
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>当前班级</title>
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
<%
    Users users = (Users) session.getAttribute("currentuser");
    SchoolClass schoolClass = (SchoolClass) session.getAttribute("SchoolClass");
    UserAndSchoolClass userAndSchoolClass = (UserAndSchoolClass) session.getAttribute("UserAndSchoolClass");
    if (users == null) response.sendRedirect("login.jsp");
    String userimage = users.getUserimage();
    if (userimage==null)userimage = "../img/img.jpg";
    else userimage ="http://129.211.26.231:8080/upload/userimages/"+ users.getUserimage();
%>
<%--<c:forEach items="${CompleteArticle}" var="completeArticle" varStatus="vs">--%>
<%--<tr>--%>
<%--<c:if test="${completeArticle.users.userimage == null}">--%>
<%--<td align = "center"><img src="../images/userimage.png"></td>--%>
<%--</c:if>--%>
<%--<c:if test="${completeArticle.users.userimage != null}">--%>
<%--<td align = "center"><img src="http://localhost:8080/upload/userimages/${completeArticle.users.userimage}"></td>--%>
<%--</c:if>--%>
<%--<td align = "center">${completeArticle.users.userName}</td>--%>
<%--<td align = "center">${completeArticle.article.createdate}</td>--%>
<%--<td align = "center">${completeArticle.article.description}</td>--%>
<%--<td>--%>
<%--<c:forEach items="${completeArticle.list}" var="Articleimage" varStatus="vs">--%>
<%--<tr>--%>
<%--<td><img src="http://localhost:8080/upload/userimages/${Articleimage.articleimage}"></td>--%>
<%--</tr>--%>
<%--</c:forEach>--%>
<%--</td>--%>
<%--</tr>--%>
<%--</c:forEach>--%>
${message}
<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-dark default-color ">

    <!-- Navbar brand -->
    <a class="navbar-brand" href="#">Current Class</a>

    <!-- Collapse button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
            aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Collapsible content -->
    <div class="collapse navbar-collapse " id="basicExampleNav">

        <%--<!-- Links -->--%>
        <%--<ul class="navbar-nav mr-auto">--%>
        <%--</ul>--%>
        <%--<form class="form-inline my-2 my-lg-0 ml-auto z-top" method="post">--%>
        <%--<input class="form-control" id="search1" type="search" placeholder="ID" aria-label="Search">--%>
        <%--<button onclick="searchClass2()" class="btn btn-outline-white btn-md my-2 my-sm-0 ml-3" type="button">Search</button>--%>
        <%--<script>--%>
        <%--function searchClass2() {--%>
        <%--var value = document.getElementById("search1").value;--%>
        <%--searchClass(value)--%>
        <%--}--%>
        <%--</script>--%>
        <%--</form>--%>
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
                <h2><img class="withripple rounded-circle" id="avatarShow" src="../images/Classs.png" height="80px" width="80px"/></h2>
                <b id="username1"><%=schoolClass.getClassname()%></b>
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
                            <a data-toggle="modal" href="#ClassInfo" class="withripple">班级信息
                            </a>
                        </li>
                        <li>
                            <a data-toggle="modal" href="#" onclick="getUserList()" class="withripple">班级用户
                            </a>
                        </li>
                        <li>
                            <a data-toggle="modal" href="#AddArticle" class="withripple">发布动态
                            </a>
                        </li>
                    </ul>
                </li>
                <c:set var="status" scope="session" value="<%=userAndSchoolClass.getStatus()%>"/>
                <c:set var="userid" scope="session" value="<%=users.getUid()%>"/>
                <c:if test="${status == 2}">
                    <li>
                        <a class="withripple" href="javascript:;">
                            <i class="icon icon-php"></i>
                            <span class="sidespan">管理员权限</span>
                            <i class="iright pull-right">&gt;</i>
                        </a>
                        <ul class="sidebar-dropdown">
                            <li>
                                <a data-toggle="modal" href="#ModifyInfo" class="withripple">资料修改
                                </a>
                            </li>
                            <li>
                                <a data-toggle="modal" href="#ModifyDeleteUser" class="withripple">移除用户
                                </a>
                            </li>
                            <li>
                                <a data-toggle="modal" href="#ModifyDeleteArticle" class="withripple">删除内容
                                </a>
                            </li>
                            <li>
                                <a data-toggle="modal" href="#ModifyDeleteClass" class="withripple">注销班级
                                </a>
                            </li>
                        </ul>
                    </li>
                </c:if>

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
<input type="hidden" id="sid" class="form-control" value=<%=schoolClass.getPassword()%>>
<!--/SideBar-->

<!-- 侧边栏外-->
<div style="margin-top: 2%" id="main">
    <c:forEach items="${CompleteArticle}" var="completeArticle" varStatus="vs">
        <div class="card" style="width: 18rem;float: left">
            <div class="card-body">
                <c:if test="${completeArticle.users.userimage == null}">
                    <img align="center" style="height: 200px;width: 200px;border-radius:50%;" src="../images/userimage.png">
                </c:if>
                <c:if test="${completeArticle.users.userimage != null}">
                    <img align="center" style="height: 200px;width: 200px;border-radius:50%;" src="http://129.211.26.231:8080/upload/userimages/${completeArticle.users.userimage}">
                </c:if>
                <h5 class="card-title">发布者：${completeArticle.users.userName}</h5>
                <c:if test="${status == 2}">
                    <p class="card-text">发布者ID：${completeArticle.article.aid}</p>
                </c:if>
                <p class="card-text">发布时间：${completeArticle.article.createdate}</p>
                <p class="card-text">描述：${completeArticle.article.description}</p>
                <c:if test="${completeArticle.users.uid == userid || status==2}">
                    <button data-target="#DeAr" style="width: 235px" data-toggle="modal" data-whatever="${completeArticle.article.aid}" class="btn btn-primary">删除</button>
                    <br>
                </c:if>
                <c:forEach items="${completeArticle.list}" var="Articleimage" varStatus="vs">
                    <img class="card-img-top img-thumbnail" data-original=${Articleimage.articleimage} src=${Articleimage.articleimage} alt="Card image cap">
                </c:forEach>
            </div>
        </div>
    </c:forEach>
    <%--<div class="card" style="width: 18rem;float: left">--%>
    <%--<div class="card-body">--%>
    <%--<h5 class="card-title">Card title</h5>--%>
    <%--<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>--%>
    <%--<button class="btn btn-primary">Go somewhere</button>--%>
    <%--<br>--%>
    <%--<img class="img-thumbnail" data-original="../img/08.jpg" src="../img/08.jpg" alt="...">--%>
    <%--<img class="img-thumbnail" data-original="../img/9.png" src="../img/9.png" alt="...">--%>
    <%--<img class="card-img-top img-thumbnail" data-original="../img/9.png" src="../img/9.png" alt="Card image cap">--%>
    <%--</div>--%>
    <%--</div>--%>
</div>
<script>
    var viewer = new Viewer(document.getElementById('main'), {
        url: 'data-original'
    });
</script>
<!-- Card -->

<!-- ClassInfo -->
<div class="modal fade" id="ClassInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="ModifyPwdLabel">班级信息</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="md-form">
                        <input type="text" id="s_id" class="form-control" value=<%=schoolClass.getSid()%>>
                        <label for="s_id">班级ID</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="address" class="form-control" value=<%=schoolClass.getAddress()%>>
                        <label for="address">班级地址</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="year" class="form-control" value=<%=schoolClass.getYear()%>>
                        <label for="year">入学年份</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="classname" class="form-control" value=<%=schoolClass.getClassname()%>>
                        <label for="classname">班级名称</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="u_id" class="form-control" value=<%=schoolClass.getUid()%>>
                        <label for="u_id">创建者ID</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="description" class="form-control" value=<%=schoolClass.getDescription()%>>
                        <label for="description">班级描述</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="createtime" class="form-control" value=<%=schoolClass.getCreatetime()%>>
                        <label for="createtime">创建时间</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- Central Modal -->

<!-- ClassUsers -->
<div class="modal fade" id="ClassUsers" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="ModifyADDLabel">用户信息</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- Central Modal -->

<!-- AddArticle -->
<div class="modal fade" id="AddArticle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100">发布动态</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form" method="post" enctype="multipart/form-data">
                    <div class="md-form">
                        <input type="text" id="des" class="form-control" name="des">
                        <label for="des">输入描述</label>
                    </div>
                    <div class="md-form">
                        <input id="file" name="file" type="file" multiple="multiple" class="form-control">
                    </div>
                    <button type="button" onclick="ArticleUpload()" class="btn btn-primary btn-sm">Save changes</button>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- Central Modal -->

<!-- ModifyInfo -->
<div class="modal fade" id="ModifyInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="CreateClassLabel">修改资料</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post">
                    <div class="md-form">
                        <input type="text" id="address1" class="form-control" value=<%=schoolClass.getAddress()%>>
                        <label for="address1">班级地址</label>
                        <input type="hidden" id="s_id1" class="form-control" value=<%=schoolClass.getSid()%>>
                    </div>
                    <div class="md-form">
                        <input type="text" id="year1" class="form-control" value=<%=schoolClass.getYear()%>>
                        <label for="year1">入学年份</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="classname1" class="form-control" value=<%=schoolClass.getClassname()%>>
                        <label for="classname1">班级名称</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="description1" class="form-control" value=<%=schoolClass.getDescription()%>>
                        <label for="description1">班级描述</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="pwd1" class="form-control" value=<%=schoolClass.getPassword()%>>
                        <label for="pwd1">班级密码</label>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                        <button type="button" onclick="EditClassInfo()" class="btn btn-primary btn-sm">Save changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Central Modal -->

<!-- ModifyDeleteUser -->
<div class="modal fade" id="ModifyDeleteUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="JoinClassLabel">移除用户</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post">
                    <div class="md-form">
                        <input type="text" id="search" class="form-control" onchange="">
                        <label for="search">输入待移除用户ID</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" onclick="deleteUser()" class="btn btn-primary btn-sm">Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Central Modal -->
<!-- ModifyDeleteArticle -->
<div class="modal fade" id="ModifyDeleteArticle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="DeleteArticle">删除内容</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post">
                    <div class="md-form">
                        <input type="text" id="deleteAid" class="form-control" onchange="">
                        <label for="deleteAid">输入待移除内容ID</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" onclick="deleteArticle()" class="btn btn-primary btn-sm">Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Central Modal -->
<!-- ModifyDeleteClass -->
<div class="modal fade" id="ModifyDeleteClass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="DeleteClass">是否确认要注销班级？</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post">
                    <div class="md-form">
                        <input type="text" id="deleteAid2" class="form-control" value=<%=schoolClass.getSid()%>>
                        <label for="deleteAid">待注销班级ID</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" onclick="deleteArticle2()" class="btn btn-primary btn-sm">Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- DeleteArticle -->
<div class="modal fade" id="DeAr" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="DeleteArticle2">删除内容</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post">
                    <div class="md-form">
                        <input type="text" id="Lable" class="form-control" value="待删除内容id">
                        <input type="text" id="deAid" class="cid form-control">
                    </div>
                    <div class="modal-footer">
                        <button type="button" onclick="deleteArticle1()" class="btn btn-primary btn-sm">Delete</button>
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
    .img-thumbnail{
        width: 120px;
        height: 100px;
    }
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
    function ArticleUpload() {
        var formData = new FormData();

        for (var i = 0;i<$('#file')[0].files.length;i++){
            console.log($('#file')[0].files[i]);
            formData.append(i,$('#file')[0].files[i],$('#file')[0].files[i].name)
        }
        var des = document.getElementById("des").value;
        console.log(des);
        $.ajaxFileUpload({
            url: '${pageContext.request.contextPath}/Article/AddArticle',  //这里是服务器处理的代码
            type: 'post',
            secureuri: false, //一般设置为false
            fileElementId: 'file', // 上传文件的id、name属性名
            dataType: 'json',   //json，与后台对应，text和json
            data:{
                des:des,
                formData:formData
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                if (data==null){
                    alert("上传失败！");
                }
                else {
                    alert("上传成功！");
                }
            },
            error: function (data, status, e) {
            }
        });

    }
    function EditClassInfo() {
        var sid = document.getElementById("s_id1").value;
        var address = document.getElementById("address1").value;
        var year = document.getElementById("year1").value;
        var classname = document.getElementById("classname1").value;
        var password = document.getElementById("pwd1").value;
        var description = document.getElementById(description1);
        $.ajaxFileUpload({
            url: '${pageContext.request.contextPath}/SchoolClass/EditClass',  //这里是服务器处理的代码
            type: 'post',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                sid:sid,
                address:address,
                year:year,
                classname:classname,
                password:password,
                description:description
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                $("#address1").attr("value",data.address);
                $("#year1").attr("value",data.year);
                $("#classname1").attr("value",data.classname);
                $("#description1").attr("value",data.description);
                $("#pwd1").attr("value",data.pwd);
                alert(data.editmessage)
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })
    }
    function deleteUser() {
        var value = document.getElementById("search").value;
        var sid = document.getElementById("sid").value;
        $.ajaxFileUpload({
            url: '${pageContext.request.contextPath}/SchoolClass/DeleteUser',  //这里是服务器处理的代码
            type: 'post',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                sid:sid,
                value:value
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                alert(data.editmessage)
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })
    }
    function deleteArticle() {
        var aid = document.getElementById("deleteAid").value;
        $.ajaxFileUpload({
            url: '${pageContext.request.contextPath}/Article/DeleteArticle',  //这里是服务器处理的代码
            type: 'post',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                aid:aid
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                alert(data.editmessage)
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })
    }
    function deleteArticle2() {
        var sid = document.getElementById("deleteAid2").value;
        console.log(sid)
        $.ajaxFileUpload({
            url: '${pageContext.request.contextPath}/SchoolClass/DeleteClass',  //这里是服务器处理的代码
            type: 'post',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                sid:sid
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                alert(data.deletemessage);
                window.location.href="../Form/Loginsecc.jsp"
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })
    }
    function deleteArticle1() {
        var aid = document.getElementById("deAid").value;
        $.ajaxFileUpload({
            url: '${pageContext.request.contextPath}/Article/DeleteArticle',  //这里是服务器处理的代码
            type: 'post',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                aid:aid
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                alert(data.editmessage)
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })
    }
    function getUserList() {
        var sid = document.getElementById("s_id").value;
        $.ajax({
            url: '${pageContext.request.contextPath}/SchoolClass/GetUserList',  //这里是服务器处理的代码
            type: 'get',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                sid:sid
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                var html = '';
                for (var i = 0; i<data.length;i++){
                    var newhtml = "<div class=\"card\" style=\"width: 18rem;float: left\">\n" +
                        "        <img style='border-radius:50%;' class=\"card-img-top\" src='http://localhost:8080/upload/userimages/"+data[i].userimage+"'  alt=\"Card image cap\">\n" +
                        "        <div class=\"card-body\">\n" +
                        "            <h5 class=\"card-title\">用户名："+data[i].userName+"</h5>\n" +
                        "            <p class=\"card-text\">用户ID："+data[i].uid+"</p>\n" +
                        "            <p class=\"card-text\">用户真实姓名："+data[i].realname+"</p>\n" +
                        "            <p class=\"card-text\">用户性别："+data[i].sex+"</p>\n" +
                        "            <p class=\"card-text\">用户电话："+data[i].telphone+"</p>\n" +
                        "            <p class=\"card-text\">用户QQ："+data[i].userQQ+"</p>\n" +
                        "            <p class=\"card-text\">用户邮箱："+data[i].email+"</p>\n" +
                        "            <p class=\"card-text\">用户微信："+data[i].userwechat+"</p>\n" +
                        "            <p class=\"card-text\">用户生日："+data[i].birthday+"</p>\n" +
                        "            <button value='"+data[i].sid+"' class=\"btn btn-primary\">Go somewhere</button>\n" +
                        "        </div>\n" +
                        "    </div>";
                    html += newhtml;
                    document.getElementById("main").innerHTML = html;
                }
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })
    }
    $('#DeAr').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // 触发事件的按钮  
        var recipient = button.data('whatever'); // 解析出whatever内容  
        var modal = $(this);  //获得模态框本身
        modal.find('.modal-body .cid').val(recipient);
    });
</script>
</body>
</html>
