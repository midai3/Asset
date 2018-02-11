<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="Dao.*,Model.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>SELECT 操作</title>
</head>
<body>
	<!--下面的表单是用于输入查询条件，输入完成后仍提交给自己这个页面处理-->
	<form id="form1" action="Home.jsp" method="post">
		<div style="width: 800px; margin: 0 auto; background-color: #CCCCCC;">
			<table style="width: 100%;color: #000000;">
				<tr>
					<td class="tabtop" colspan="4">帖子管理</td>
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
								<td width="150px">明层</td>
								<td width="100px">类型</td>
								<td width="100px">发布用户</td>
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
</body>
</html>
