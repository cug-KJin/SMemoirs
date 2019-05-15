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
    <title>Title</title>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
</head>
<body>
${message}
<%
    Users users = (Users) session.getAttribute("currentuser");
    if (users == null) response.sendRedirect("login.jsp");
    String userimage = users.getUserimage();
    if (userimage==null)userimage = "../images/userimage.png";
    else userimage ="http://localhost:8080/upload/userimages/"+ users.getUserimage();
%>
<!--private String realname;
    private String sex;
    private String userQQ;
    private String email;
    private String userwechat;
    private String birthday;
    private String userimage;
    -->
<div style="width: 100px;height: 100px">
    <form method="post" enctype="multipart/form-data">
        <img id="avatarShow" src=<%=userimage%>>
        <br>
        <br>
        <br>
        <input type="file" id="userimage" name="userimage">
        <input type="button" value="提交" onclick="upload()">
    </form>
</div>
<br>
<br>
<br>
<br>
<form method="post">
    ${errormessage}
    真实姓名：<input type="text" id="realname" name="realname" value=<%=users.getRealname()%>>
    用户姓名：<input type="text" id="username" name="username" value=<%=users.getUserName()%>>
    性别：<input type="text" id="sex" name="sex" value=<%=users.getSex()%>>
    邮箱<input type="text" id="email" name="email" value=<%=users.getEmail()%>>
    QQ：<input type="text" id="userQQ" name="userQQ" value=<%=users.getUserQQ()%>>
    微信：<input type="text" id="userwechat" name="userwechat" value=<%=users.getUserwechat()%>>
    生日：<input type="text" id="birthday" name="birthday" value=<%=users.getBirthday()%>>
    <input type="button" value="提交" onclick="Edit()">
</form>
<br>
<br>
<br>
<br>

<div id="createform">

</div>

<form method="post">
    ${message}
        <input type="button" value="我创建的班级" onclick="getCreateClass()">

        <input type="button" value="我加入的班级" onclick="getAddClass()">

</form>
<div>
    <ul id = "createclass">
    </ul>
</div>
<div>
    <ul id = "addclass">
    </ul>
</div>

<form method="post" action="${pageContext.request.contextPath}/Article/enterIntoClass" id="classmessage">
    <input type="text" id="sid_mess" value="">
    <input type="text" id="classname_mess" value="">
    <input type="text" id="address_mess" value="">
    <input type="text" id="year_mess" value="">
    <input type="text" id="description_mess" value="">
    <input type="text" id="createtime_mess" value="">
    <input type="button" value="进入班级">
</form>
<form method="post">
    <input type="text" id="sid_mess2" value="">
    <input type="text" id="classname_mess2" value="">
    <input type="text" id="address_mess2" value="">
    <input type="text" id="year_mess2" value="">
    <input type="text" id="description_mess2" value="">
    <input type="text" id="createtime_mess2" value="">
    <input type="text" id="password2" value="">
    <input type="button" value="加入班级" onclick="AddClass()">
</form>

<div>
    <form method="post">
        address:<input type="text" id="address" name="address">
        year:<input type="text" id="year" name="year">
        classname:<input type="text" id="classname" name="classname">
        password:<input type="text" id="password" name="password">
        description:<input type="text" id="description" name="description">
        <input type="button" value="创建" onclick="createClass()">
    </form>
</div>


<div>
    <form method="get">
        搜索：<input type="text" name="search" id="search">
        <input type="button" value="搜索" onclick="searchClass()">
    </form>
    <div>
        <ul id = "searchResult">
        </ul>
    </div>
</div>



<script>
    function upload() {
        var filename = document.getElementById("userimage").value;
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
                    },
                    error: function (data, status, e) {
            }
        });
    }
    function Edit() {
        var realname = document.getElementById("realname").value;
        var username = document.getElementById("username").value;
        var sex = document.getElementById("sex").value;
        var userQQ = document.getElementById("userQQ").value;
        var email = document.getElementById("email").value;
        var userwechat = document.getElementById("userwechat").value;
        var birthday = document.getElementById("birthday").value;
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
                alert(data.success)
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

                    var newhtml = "<li>\n" +
                        "                    <button value="+data[i].sid+" onclick = \"getClassMessage(this.value)\">"+data[i].classname+"</button>\n" +
                        "                </li>";
                    html += newhtml;
                }
                document.getElementById("createclass").innerHTML = html;
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

                    var newhtml = "<li>\n" +
                        "                    <button value="+data[i].sid+"  onclick = \"getClassMessage(this.value)\">"+data[i].classname+"</button>\n" +
                        "                </li>";
                    html += newhtml;
                }
                document.getElementById("addclass").innerHTML = html;
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        });
    }
    function createClass() {
        var address = document.getElementById("address").value;
        var year = document.getElementById("year").value;
        var classname = document.getElementById("classname").value;
        var password = document.getElementById("password").value;
        var description = document.getElementById("description").value;
        $.ajaxFileUpload({
            url: '${pageContext.request.contextPath}/SchoolClass/CreateClass',  //这里是服务器处理的代码
            type: 'post',
            secureuri: false, //一般设置为false
            dataType: 'json',   //json，与后台对应，text和json
            data: {
                address: address,
                year: year,
                classname:classname,
                password:password,
                description:description
            }, 						//传递参数到服务器
            success: function (data, status) {
                console.log(data);
                alert(data.success)
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })
    }
    function searchClass() {
        var value = document.getElementById("search").value;
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
                html += "<li><p>我创建的班级</p></li>";
                for (var i = 0;i<data[0].length;i++){
                    var newhtml = "<li>\n" +
                        "                    <button value="+data[0][i].sid+"  onclick = \"getClassMessage(this.value)\">"+data[0][i].classname+"</button>\n" +
                        "                </li>";
                    html += newhtml;
                }
                html += "<li><p>我加入的班级</p></li>";
                for (var i = 0;i<data[1].length;i++){
                    var newhtml = "<li>\n" +
                        "                    <button value="+data[1][i].sid+"  onclick = \"getClassMessage(this.value)\">"+data[1][i].classname+"</button>\n" +
                        "                </li>";
                    html += newhtml;
                }

                html += "<li><p>未加入的班级</p></li>";
                for (var i = 0;i<data[2].length;i++){

                    var newhtml = "<li>\n" +
                        "                    <button value="+data[2][i].sid+"  onclick = \"getAddClassMessage(this.value)\">"+data[2][i].classname+"</button>\n" +
                        "                </li>";
                    html += newhtml;
                }
                document.getElementById("searchResult").innerHTML = html;
            },
            error: function (data, status, e) {
                alert(e.value)
            }
        })

    }

    function AddClass() {
        var sid = document.getElementById("sid_mess2").value;
        var password = document.getElementById("password2").value;
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
                alert(data.message)
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
</script>

</body>

</html>
