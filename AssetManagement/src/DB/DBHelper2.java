package DB;
import java.sql.*; //1.导入包文件

//数据库的通用类，实现数据库的操作
public class DBHelper2 {
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
	//创建数据库的连接
	public Connection getCon(){
		try {
			//3.加载驱动程序
			Class.forName(Driver);
			//4.创建Connection对象
			con=DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	//关闭数据库对象
	public void rsClose(){
		try {
			if(rs!=null){
				rs.close();
				rs=null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	public void stmtClose(){
		try {
			if(stmt!=null){
				stmt.close();
				stmt=null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	public void conClose(){
		try {
			if(con!=null){
				con.close();
				con=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	//执行更新（增、改、删）操作
	public int excuteUpdate(String sql){
		int result=0;
		try {
			stmt=getCon().createStatement();		
			result=stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		stmtClose();
		conClose();
		return result;
	}
}
