<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="Dao.*,Model.AssetName"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  </head>
  
  <body>
  <%    request.setCharacterEncoding("utf-8");
		AssetName art=new AssetName();
		art.setAsId(Integer.parseInt(request.getParameter("id")));
		art.setUID(request.getParameter("UID"));
		art.setAsnu(request.getParameter("asnu"));
		art.setAsnm(request.getParameter("asnm"));
		art.setAste(request.getParameter("aste"));
		art.setSpec(request.getParameter("spec"));
		art.setAscs(request.getParameter("ascs"));
		art.setChge(request.getParameter("chge"));
		art.setPlac(request.getParameter("plac"));
		art.setAsty(request.getParameter("asty"));
		art.setUsde(request.getParameter("usde"));
		art.setSupp(request.getParameter("supp"));
		art.setNumb(request.getParameter("numb"));
		art.setUnpr(request.getParameter("unpr"));
		art.setUsda1(request.getParameter("usda1"));
		art.setUsda2(request.getParameter("usda2"));
		art.setRema(request.getParameter("rema"));
		art.setAdse(request.getParameter("adse"));
		art.setMana(request.getParameter("mana"));
		art.setCowa(request.getParameter("cowa"));
		art.setUnit(request.getParameter("unit"));
		art.setTapr(request.getParameter("tapr"));
		art.setWape(request.getParameter("wape"));
		art.setBise(request.getParameter("bise"));
		IAsset ad=new AssetDao();
		if(ad.update(art)>0) 
            response.sendRedirect("Home.jsp");
            else{
            	out.println("<script>alert('修改失败');location='Edit.jsp' </script>");
            }
        
		%>
  </body>
</html>
