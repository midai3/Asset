<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> <!-- 1.导入数据库包文件 -->
<%
	//解决中文乱码问题，设置字符集为utf-8
	request.setCharacterEncoding("utf-8");
	String usern=request.getParameter("usern");
	String passw=request.getParameter("passw");
	if(usern!=null && passw!=null){
		//2.定义跟数据库相关的系列的变量
		//2.1 定义连接数据库的url,指定通信协议和数据库
		String url="jdbc:mysql://localhost:3306/asset?encoding=utf-8";
		String user="root";  //2.2 登录数据库的用户名
		String password="123456";  //2.3 登录数据库的密码
		String Driver="com.mysql.jdbc.Driver"; // //2.4 定义驱动字符串
		//2.5 定义链接字符串
		Connection con=null;
		//2.6 定陈述对象
		Statement stmt=null;
		//2.7 定义结果集对象
		ResultSet rs=null;
		
		try{
			//3.加载驱动程序
			Class.forName(Driver);
			//4.创建Connection对象
			con=DriverManager.getConnection(url,user,password);
			//5.创建Statement对象，用来执行SQL语句
			String sql="select * from user where usern='"
			+usern+"' and passw='"+passw+"'";
			stmt=con.createStatement();
			//6.创建Resulst对象：执行查询操作
			rs=stmt.executeQuery(sql);
			//7.判断结果集中是否有数据
			if(rs!=null && rs.next()){
			//设置session的login_uName对象
				session.setAttribute("login_username", usern);
				//设置session的过期时间
				session.setMaxInactiveInterval(10);
				response.sendRedirect("Home.jsp");
			}
			else{%>
				<script>alert('要不是账号密码错了就是没有这账号');
				 window.document.location.href="loginpage.jsp";
				</script>";<%
			}
		}
		catch(Exception ex){
			out.println(ex.getMessage());
		}
		finally{
			//关闭数据库操作对象
			try{
				//关闭rs对象
				rs.close();
			}
			catch(Exception ex){
			out.println(ex.getMessage());
			}
			try{
				//关闭陈述对象
				stmt.close();
			}
			catch(Exception ex){
			out.println(ex.getMessage());
			}
			try{
				//关闭连接对象
				con.close();
			}
			catch(Exception ex){
			out.println(ex.getMessage());
			}
		}				
	}	
	else{
	}
	
%>