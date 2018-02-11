<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="DB.*" %>
<% 		
	//insert into as.con(UID,asnu,asnm,aste,spec,ascs,chge,plac,asty,usde,supp,numb,unpr,usda1,usda2,rema,adse,mana,cowa,unit,tapr,wape,bise) 		
	/*	String sql="insert into ascon
		(UID,asnu,asnm,aste,spec,ascs,chge,plac,asty,usde,supp,numb,unpr,usda1,usda2,rema,adse,mana,cowa,unit,tapr,wape,bise) "
		+"value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; * */
	java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyMMddHHmmss");    
	java.util.Date currentTime = new java.util.Date();    
   
	request.setCharacterEncoding("utf-8");
	String UID = simpleDateFormat.format(currentTime);
	
	String asnu=request.getParameter("asnu");
	String asnm=request.getParameter("asnm"); 
	String aste=request.getParameter("aste"); 
	String spec=request.getParameter("spec"); 
	String ascs=request.getParameter("ascs");
	String chge=request.getParameter("chge");
	String plac=request.getParameter("plac");
	String asty=request.getParameter("asty");
	String usde=request.getParameter("usde");
	String supp=request.getParameter("supp");
	String numb=request.getParameter("numb");
	String unpr=request.getParameter("unpr");
	String usda1=request.getParameter("usda1");
	String usda2=request.getParameter("usda2");
	String rema=request.getParameter("rema");
	String adse=request.getParameter("adse");
	String mana=request.getParameter("mana");
	String cowa=request.getParameter("cowa");
	String unit=request.getParameter("unit");
	String tapr=request.getParameter("tapr");
	String wape=request.getParameter("wape");
	String bise=request.getParameter("bilse");
	
	if(asnm!=null&&aste!=null){
		String sql="insert into ascon(UID,asnu,asnm,aste,spec,ascs,chge,plac,asty,usde,supp,numb,unpr,usda1,rema,adse,mana,cowa,unit,tapr,wape,bise)"+" values('"+UID+"','GT-"+UID+"','"+asnm+"','"+aste+"','"+spec+"','"+ascs+"','"+chge+"','"+plac+"','"+asty+"','"+usde+"','"+supp+"','"+numb+"','"+unpr+"','"+usda1+"','"+rema+"','"+adse+"','"+mana+"','"+cowa+"','"+unit+"','"+tapr+"','"+wape+"','"+bise+"')";
		DBHelper2 db2=new DBHelper2();
			if(db2.excuteUpdate(sql)>0){
				//设置session的login_uName对象
				//session.setAttribute("login_uName", asnu);
				//设置session的过期时间
				//session.setMaxInactiveInterval(10);
				%>
				<script>alert('成功');
				 window.document.location.href="Home1.1.jsp";
				</script>";
			<%}
			else{%>
				<script>alert('添加失败，请留意有无填写错误');
				 window.document.location.href="addpage.jsp";
				</script>";
			<%}
		}	
	else{
		System.out.println("bad");
	}
%>