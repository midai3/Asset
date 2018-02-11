<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addpage.jsp' starting page</title>
    
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
  
  <body style="text-align: ">

	<form id="form1" action="addcontrol.jsp" method="post">
		<table style="width: 100%;color:#000000">
			
			UID:<input type="text" name="UID" readonly><br>
			资产编号：<input type="text" name="asnu" readonly><br>
			资产名称：<input type="text" name="asnm"><br>
			购进日期：<input class="Wdate" name="aste" type="text" onclick="WdatePicker({isShowClear:false,readOnly:true})"/><br>
			规格型号：<input type="text" name="spec"><br>

			变动方式：<input type="text" name="chge"><br>
			存放地点：<input type="text" name="plac"><br>
			资产类型：<select name="asty">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					</select>
			使用部门：<select name="usde">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					</select>
			资产类别：<select name="ascs">
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
					<option value="D">D</option>
					</select><br>
			供应商：<input type="text" name="supp"><br>
			数量：	<input onkeyup="jisuan(),this.value=this.value.replace(/\D/g,'')" name="numb" onafterpaste="this.value=this.value.replace(/\D/g,'')" id="text1"><br>
			单价：<input onkeyup="jisuan();if(isNaN(value))execCommand('undo')" name="unpr" onafterpaste="if(isNaN(value))execCommand('undo')" id="text2"><br>
			使用年限：	<input onkeyup="this.value=this.value.replace(/\D/g,'')" name="usda1" onafterpaste="this.value=this.value.replace(/\D/g,'')" size="2"/>
			<!--  至<input onkeyup="this.value=this.value.replace(/\D/g,'')" name="usda2" onafterpaste="this.value=this.value.replace(/\D/g,'')" size="2"><br>-->
			备注：<input type="text" name="rema"><br>
			使用部门：<select name="adse">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					</select>
			资产类别：<select name="bise">
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
					<option value="D">D</option>
					</select><br>
			资产负责人：<input type="text" name="mana"><br>
			联系方式：<input type="text" name="cowa"><br>
			计量单位：<input type="text" name="unit" size="4"><br>
				<!--  用于哪年到哪年的！
				
				
				<input id="d4311" class="Wdate" type="text" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')}'})"/> 
				<input id="d4312" class="Wdate" type="text" onclick="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}'})"/>
				<script type="text/javascript">
				function jisuan(){
				var text1=document.getElementById("text1").value;
				var text2=document.getElementById("text2").value;
				document.getElementById("text3").value=parseFloat(text1)*parseFloat(text2);
				}
				</script>-->
			资产总价:<input type="text" id="text3" name="tapr" readonly><br>
			<script type="text/javascript">
			function jisuan(){
			var text1=document.getElementById("text1").value;
			var text2=document.getElementById("text2").value;
			document.getElementById("text3").value=parseFloat(text1)*parseFloat(text2);
			}
			</script>
			保修年限：<input type="text" name="wape"><br>
			
		<input type="submit" value="add"><br>

		</table>	
	</form>    
  </body>
</html>
