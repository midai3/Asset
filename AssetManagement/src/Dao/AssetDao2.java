package Dao;

import java.sql.ResultSet;
import java.util.List;

import DB.DBHelper;
import Model.AssetName;

public class AssetDao2 implements IAsset {

	@Override
	public int add(AssetName Asset) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(AssetName Asset) {
		int result=0;
		String sql="update ascon set asnm=?,aste=?,spec=?";
		DBHelper help=new DBHelper();
		String [] params={
				Asset.getAsnm()+"",Asset.getAste()+"",Asset.getSpec()+""
		};
		result=help.excuteUpdate(sql, params);
		return 0;
	}

	@Override
	public int del(int aId) {
		int result=0;
		String sql="delete from ascon where asId="+aId;
		DBHelper help=new DBHelper();
		result=help.excuteUpdate(sql,null);
		return result;
	}

	@Override
	public List<AssetName> getList(String where) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AssetName getInfo(int aId) {
		AssetName art=new AssetName();
		String sql="select * from asocn where asId="+aId;
		DBHelper help=new DBHelper();
		ResultSet rs=help.excuteQuery(sql);
		try{
			if(rs!=null&&rs.next()){
				
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return art;
	}

}
