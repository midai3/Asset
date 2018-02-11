<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
*{	
	margin:0px;
	padding:0px;}
#div{
	height:1000px;
	float:inherit;
    background:url(joinus.jpg);
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	border: #000 solid 5px;
	margin-left:0px;
	margin-right:0px;}
#registered{ background: #000;
	text-align:center;
	}
#butten{ background: #000;
	text-align:center;
	}
p{
	font-family:"微软雅黑", "宋体";
	color:#FFF;
}
p{color:#FFF}
</style>


<body>
<form id="form1" action="loginCtrl.jsp" method="post" onsubmit="return check()">
  <center>
<div id="div" > </div>
<div id="divbig"> 
<div id="registered">
<p>帐号 <input name="usern" type="text" size="15" maxlength="30" id="name"/></p>
<p>密码 <input name="passw" type="password" size="15" maxlength="30" id="psw"/></p>
</div>


<div id="butten">
  <a href="thanks.html"><input type="submit" name="papa" value="Join in" /></a>
</div>
</div>
</center>
</form>
</body>
</html>
