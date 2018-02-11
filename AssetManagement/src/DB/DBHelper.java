package DB;
/*
 * 数据库通用类，处理数据库的基本操作（增删查改）
 */
import java.sql.*; //导入包文件
public class DBHelper {
	//定义数据库操作变量和对象
	//定义链接字符串，指定服务器，数据库
	String url="jdbc:mysql://localhost:3306/Asset?useUnicode=true&&characterEncoding=utf-8";
	String user="root";//登录服务器的用户名
	String password="123456";//登录服务器的密码:换成自己的密码
	String driver="com.mysql.jdbc.Driver";//驱动器字符串
	
	Connection con=null;
	Statement stmt=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;	
	//获取连接对象
	public Connection getCon(){		
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return con;
	}
	//关闭数据库对象
	public void conClose(){
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		con=null;
	}
	public void stmtClose(){
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		stmt=null;
	}
	public void pstmtClose(){
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		pstmt=null;
	}
	public void rsClose(){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		rs=null;
	}
	
	//执行查询操作---不带参数
	public ResultSet excuteQuery(String sql){
		rs = null;
		try {
			stmt = getCon().createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return rs;
	}
	//执行查询操作---带参数
	public ResultSet excuteQuery(String sql,String[] params){
		rs=null;
		try {
			pstmt=getCon().prepareStatement(sql);
			for(int i=0;i<params.length;i++){
				pstmt.setString(i+1, params[i]);
			}
			rs=pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	//执行更新操作----不带参数
	public int excuteUpdate(String sql){
		int result = 0;
		try {
			stmt = getCon().createStatement();
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			stmtClose();
			conClose();
		}
		return result;
	}
	//执行更新操作----带预编译参数
	public int excuteUpdate(String sql,String[] params){
		int result=0;
		try {
			pstmt=getCon().prepareStatement(sql);
			for(int i=0;i<params.length;i++){
				pstmt.setString(i+1, params[i]);
			}
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			pstmtClose();
			conClose();
		}	
		return result;
	}
}

