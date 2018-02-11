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
    
    <title>My JSP 'Edit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
  </head>
  
  <body>
 <%
        	//功能：根据上一页面传递的帖子编号查询数据库，获取帖子所有详细信息

                //提取上一页面传递过来的请求参数aid
                String aid = request.getParameter("aid");
				out.print(aid);
				
                if (aid == null) 
                     response.sendRedirect("Home.jsp");
               else {
               		  IAsset ad=new AssetDao();
                      AssetName art=ad.getInfo(Integer.parseInt(aid));  
                      out.print(aid);                  
%>

	

	<form id="form1" action="EditControl.jsp" method="post">
	<div style="width: 800px; margin: 0 auto; background-color: #CCCCCC;">
		<table style="width: 100%;color:#000000">
			<td>text</td>
			<input type="text" name="id" readonly value="<%=art.getAsId() %>"><br>
			UID:
			<input type="text" name="UID" readonly value="<%=art.getUID() %>"><br>
			资产编号：
			<input type="text" name="asnu" readonly value="<%=art.getAsnu() %>"><br>
			资产名称：
			<input type="text" name="asnm" value="<%=art.getAsnm()%>"><br>
			购进日期：<input class="Wdate" name="aste" type="text" onclick="WdatePicker({isShowClear:false,readOnly:true})" value="<%=art.getAste() %>"><br>
			规格型号：<input type="text" name="spec" value="<%=art.getSpec() %>"><br>
			变动方式：<input type="text" name="chge" value="<%=art.getChge() %>"><br>
			存放地点：<input type="text" name="plac" value="<%=art.getPlac() %>"><br>
			资产类型：<select name="asty">
					<option value="<%=art.getAsty() %>"><%=art.getAsty()%></option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					</select>
			使用部门:
			<select name="usde">
					<option value="<%=art.getUsde() %>"><%=art.getUsde()%></option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					</select></td>
			资产类别：<select name="ascs">
			<option value="<%=art.getAscs() %>"><%=art.getAscs()%></option>
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
					<option value="D">D</option>
					</select><br>
			供应商：<input type="text" name="supp" value="<%=art.getSupp() %>"><br>
			数量：	<input onkeyup="jisuan(),this.value=this.value.replace(/\D/g,'')" name="numb" onafterpaste="this.value=this.value.replace(/\D/g,'')" id="text1" value="<%=art.getNumb() %>"><br>
			单价：<input onkeyup="jisuan();if(isNaN(value))execCommand('undo')" name="unpr" onafterpaste="if(isNaN(value))execCommand('undo')" id="text2"value="<%=art.getUnpr() %>"><br>
			使用年限：	<input onkeyup="this.value=this.value.replace(/\D/g,'')" name="usda1" onafterpaste="this.value=this.value.replace(/\D/g,'')" size="2" value="<%=art.getUsda1() %>">
			<!--  至<input onkeyup="this.value=this.value.replace(/\D/g,'')" name="usda2" onafterpaste="this.value=this.value.replace(/\D/g,'')" size="2"><br>-->
			备注：<input type="text" name="rema" value="<%=art.getRema() %>"><br>
			管理部门：<select name="adse">
			<option value="<%=art.getAdse() %>"><%=art.getAdse()%></option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					</select>
			使用情况：<select name="bise" value="<%=art.getBise() %>">
			<option value=<%=art.getBise()%>><%=art.getBise()%></option>
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
					<option value="D">D</option>
					</select><br>
			资产负责人：<input type="text" name="mana" value="<%=art.getMana() %>"><br>
			联系方式：<input type="text" name="cowa" value="<%=art.getCowa() %>"><br>
			计量单位：<input type="text" name="unit" size="4" value="<%=art.getUnit() %>"><br>
				<!--  用于哪年到哪年的！
				<input id="d4311" class="Wdate" type="text" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')}'})"/> 
				<input id="d4312" class="Wdate" type="text" onclick="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}'})"/>
				<script type="text/javascript">
				function jisuan(){
				var text1=document.getElementById("text1").value;
				var text2=document.getElementById("text2").value;
				document.getElementById("text3").value=parseFloat(text1)*parseFloat(text2)}
				</script>-->
			资产总价:<input type="text" id="text3" name="tapr" value="<%=art.getTapr() %>" readonly><br>
			<script type="text/javascript">
			function jisuan(){
			var text1=document.getElementById("text1").value;
			var text2=document.getElementById("text2").value;
			document.getElementById("text3").value=parseFloat(text1)*parseFloat(text2);
			}
			</script>
				保修年限：<input type="text" name="wape" value="<%=art.getWape() %>">
			 <img style="vertical-align:middle;" src="<%=request.getContextPath()%>/BarCodeServlet?msg=<%=art.getUID() %>&barH=12.2&barXD=0.4&codeType=code128"/>  
			<input type="submit" value="Re."></td>

		</table>	
		</div>
	</form>   
	  <%
  }
   %>
  </body>
</html>
