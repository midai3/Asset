<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MixTest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
<body>	
	<script> 
	//-----  下面是打印控制语句  ---------- 
	window.onbeforeprint=beforePrint; 
	window.onafterprint=afterPrint; 
	//打印之前隐藏不想打印出来的信息 
	function beforePrint() 
	{ 
	span2.style.display='none'; 
	} 
	//打印之后将隐藏掉的信息再显示出来 
	function afterPrint() 
	{ 
	span2.style.display=''; 
	} 
	</script> 
	<!-- 调用火狐谷歌的打印，亲测可用 -->
	<span id="span1"> 
		Test！
	</span> 
	<span id="span2"> 
		<input name ="Button"  value="火狐谷歌打印" type="button" onclick="window.print()" />
	</span> 
</body>
</html>
