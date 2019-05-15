<%--
  Created by IntelliJ IDEA.
  User: 98673
  Date: 2019/4/16
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>校园回忆录用户注册</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="../css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="../css/style.css" rel="stylesheet">
    <style>
        body {
            background: #FFF url(../images/background.png) repeat-y center top;
        }
    </style>
</head>

<body>

<!-- Start your project here-->
<div style="height: 100vh">
    <div class="flex-center flex-column">
        <p>${message}</p>
        <form onsubmit="return check()" method="post" action = "${pageContext.request.contextPath}/Register">
            <div class="md-form">
                <input type="text" name="username" id="username" class="form-control" onchange="judgeName()">
                <label for="username">输入您的昵称</label>
            </div>
            <div style="height:6px">
                <label type="text" id="errorName" style="font-size:12px;color: red;" hidden>
                    昵称不能为空
                </label>
            </div>
            <div class="md-form">
                <input type="text" name="telphone" id="telphone" class="form-control" onchange="judgePhone()">
                <label for="telphone">输入您的手机号码</label>
            </div>
            <div style="height:6px">
                <label type="text" id="errorPho" style="font-size:12px;color: red;" hidden>
                    请输入合法的手机号
                </label>
            </div>
            <div class="md-form">
                <input type="password" name="password" id="password" class="form-control" onchange="judgePass()">
                <label for="password">输入您的密码</label>
            </div>
            <div style="height:6px">
                <label type="text" id="errorPas" style="font-size:12px;color: red;" hidden>
                    请输入至少六位的密码
                </label>
            </div>
            <div class="md-form">
                <input type="password" id="password1" class="form-control" onchange="judgeCon()">
                <label for="password1">确认您的密码</label>
            </div>
            <div style="height:15px">
                <label type="text" id="errorCon" style="font-size:12px;color: red;" hidden>
                    两次密码不一致
                </label>
            </div>
            <div>
                <button type="submit" id="logup" class="btn btn-primary" >注册</button>
                <a id="login" href = ../Form/login.jsp>    已有账户?点此登录</a>
            </div>
        </form>
    </div>
</div>
<!-- /Start your project here-->
<script>
    function judgeName()
    {
        if(document.getElementById('username').value==="")
        {
            document.getElementById('errorName').hidden = false;
            return false;
        }
        document.getElementById('errorName').hidden = true;
        return true;
    }
    function judgePhone()
    {
        var phone = document.getElementById('telphone').value;
        if (phone.length !== 11 || !(/^1([34578])\d{9}$/.test(phone)))
        {
            document.getElementById('errorPho').hidden = false;
            return false;
        }
        else
        {
            document.getElementById('errorPho').hidden = true;
            return true;
        }
    }
    function judgePass()
    {
        if(document.getElementById('password').value.length < 6)
        {
            document.getElementById('errorPas').hidden = false;
            return false;
        }
        else
        {
            document.getElementById('errorPas').hidden = true;
            return true;
        }
    }
    function judgeCon()
    {

        if(document.getElementById('password').value !== document.getElementById('password1').value)
        {
            document.getElementById('errorCon').hidden = false;
            return false;
        }
        else
        {
            document.getElementById('errorCon').hidden = true;
            return true;
        }
    }
    function check()
    {
        return (judgeName()&&judgePhone()&&judgePass()&&judgeCon());
    }
</script>

<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="../js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="../js/mdb.min.js"></script>
</body>

</html>
