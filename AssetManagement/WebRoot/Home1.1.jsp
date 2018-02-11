<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="Dao.*,Model.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Home1.1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="CSS/w3.css">
	<link rel="stylesheet" href="http://cdn.w3schools.wang/w3.css">
	<link rel="stylesheet" href="http://res.w3schools.wang/cate/w3css/w3-theme-black.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
	<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
	
	<style>
		html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
		.w3-sidenav a,.w3-sidenav h4{padding:12px;}
		.w3-navbar a{padding-top:12px !important;padding-bottom:12px !important;}
	</style>
  </head>
  
  <body>
	<ul class="w3-navbar w3-black"> 
	  <li><a href="#">资产管理系统</a></li> 
	  <li><a href="#">Link 1</a></li> 
	  <li><a href="#">Link 2</a></li> 
	  <li><a href="#">Link 3</a></li> 
	</ul>
	<nav class="w3-sidenav w3-white" style="width:12%"> 
	  <a href="Home1.1.jsp">资产管理</a> 
	  <a href="addpage.jsp">新增资产</a> 
	  <a href="#"></a> 
	  <a href="#">Link 4</a> 
	</nav>
	<div style="margin-left:12%">

	<header class="w3-container w3-teal">
	  <h1>资产管理</h1>
	</header>
	
	<div class="w3-container">
	
	<!--下面的表单是用于输入查询条件，输入完成后仍提交给自己这个页面处理-->
	<form id="form1" action="Home.jsp" method="post">
		<div style="width: 800px; margin: 0 auto;">
		<table class="w3-table w3-striped">
				<tr>
					<td class="tabtop" colspan="4"></td>
				</tr>
				<tr height="30px">
					<td colspan="4">查询条件： <select name="key">
							<option value="asnu">请选择</option>
							<option value="asnu">编号</option>
							<option value="asnm">名称</option>
					</select> <input type="text" name="key_value"> <input name="submit" type="submit" value="搜索" /></td>
				</tr>
				<tr>
					<td class="tabmain" style="text-align: right">
						<table border="1px" cellspacing="0" cellpadding="5">
							<tr>
								<td width="100px">编号</td>
								<td width="150px">资产名称</td>
								<td width="100px">类型</td>
								<td width="100px">管理部门</td>
								<td>操作</td>
							</tr>
							<% 
                String where; //查询条件
                String key; //查询的关键字，字段名
                String value;  //查询的关键字值
                
            //传过来的数据(也可以叫它们为请求参数)可能有中文,所以先设定请求所采用的字符编码 
			request.setCharacterEncoding("utf-8");

			//取出传递过来的各项数据 
			key = request.getParameter("key");
			value = request.getParameter("key_value"); 
             // 按条件查询，则生成相应的where 
			if ( key != null && value != null &&!key.equals("") && !value.equals("")) {
				if(key.equals("asnu")){ //按标题进行模糊查询
					where=" where asnu like '%" +value+"%' ";
				}
				else if (key.equals("asnm")){ //按发布用户进行模糊查询 (if(key.equals("userName")))
					where =" where asnm like '%"+value+"%' ";
				}	else{
					where =" where asnu like '%"+value+"%' ";
				}	
			}  
			else { //全部显示
					where ="";
				}
                IAsset ad=new AssetDao();
                List<AssetName> arts=ad.getList(where);
                for(int i=0;i<arts.size();i++){
                	AssetName art=arts.get(i);
               		%>
							<tr>
								<td><%= art.getAsnu()%></td>
								<td><%= art.getAsnm()%></td>
								<td><%= art.getUsde()%></td>
								<td><%= art.getMana()%></td>
								<td><input type="button" value="修改" onclick="location.href='Edit.jsp?aid=<%=art.getAsId()%>'" />
									<input type="button" value="删除" onclick="if (confirm('确定要删除吗?')) location.href='DeleteControl.jsp?aid=<%=art.getAsId()%>'" />
									<%-- <a href="userUpdate.jsp?uId=<%= art.getArticleId() %>">编辑</a>
               							 <a href="delete.jsp?uId=<%= art.getArticleId() %>">删除</a> --%>
								</td>
							</tr>
							<% } %>
						</table></td>
				</tr>
			</table>
		</div>
	</form>
	</div>
	
	<footer class="w3-container w3-teal">
	  <h5>Footer</h5>
	  <input name ="Button"  value="火狐谷歌打印" type="button" onclick="window.print()" />
	  <p>Footer information goes here</p>
	</footer>

</div> 
	
  </body>
</html>