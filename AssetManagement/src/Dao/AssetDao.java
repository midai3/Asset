package Dao;

import java.sql.*;
import java.util.*;

import DB.DBHelper;
import Model.AssetName;

public class AssetDao implements IAsset {

	public int add(AssetName assetname) {
		int result=0;
		//	23���ֶ�
		//insert into as.con(UID,asnu,asnm,bdate,spec,ascs,chge,plac,asty,usde,supp,numb,unpr,usda1,usda2,rema,adse,mana,cowa,unit,tapr,wape,bise) 	
		//UID,asnu,asnm,aste,spec,ascs,chge,plac,asty,usde,supp,numb,unpr,usda1,rema,adse,mana,cowa,unit,tapr,wape,bise
		/*	Asset.getUid()+"", Asset.getAsnu(),   Asset.getSanm(),    Asset.getBdate()+"",
			Asset.getSpec(),   Asset.getAscs(),   Asset.getChge(),    Asset.getPlac(),
			Asset.getPlac(),   Asset.getAsty(),   Asset.getUsde(),    Asset.getSupp(),
			Asset.getNumb()+"",Asset.getUnpr()+"",Asset.getUsda1()+"",Asset.getUsda2()+"",
			Asset.getRema(),   Asset.getAdse(),   Asset.getMana(),    Asset.getCowa(),
			Asset.getUnit(),   Asset.getTapr()+"",Asset.getWape()+"", Asset.getBise()
		 * */
		String sql="insert into ascon(UID,asnu,asnm,aste,spec,ascs,chge,plac,asty,usde,supp,numb,unpr,usda1,rema,adse,mana,cowa,unit,tapr,wape,bise) "
		+"value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		DBHelper help=new DBHelper();
		String[] params={
				assetname.getUID()+"", assetname.getAsnu(),   assetname.getAsnm(),    assetname.getAste()+"",
				assetname.getSpec(),   assetname.getAscs(),   assetname.getChge(),    assetname.getPlac(),
				assetname.getPlac(),   assetname.getAsty(),   assetname.getUsde(),    assetname.getSupp(),
				assetname.getNumb()+"",assetname.getUnpr()+"",assetname.getUsda1()+"",assetname.getUsda2()+"",
				assetname.getRema(),   assetname.getAdse(),   assetname.getMana(),    assetname.getCowa(),
				assetname.getUnit(),   assetname.getTapr()+"",assetname.getWape()+"", assetname.getBise()
		};
		result=help.excuteUpdate(sql, params);
		return result;
	}
	
	@Override
	/*assetname.getUID(),assetname.getAsnu(),assetname.getAsnm(),assetname.getAste(),assetname.getSpec(),assetname.getAscs(),assetname.getChge(),assetname.getPlac(),assetname.getAsty(),assetname.getUsde(),assetname.getSupp(),assetname.getNumb(),assetname.getUnpr(),assetname.getUsda1(),assetname.getUsda2(),assetname.getRema(),assetname.getAdse(),assetname.getMana(),assetname.getCowa(),assetname.getUnit(),assetname.getTapr(),assetname.getWape(),assetname.getBise(),assetname.getId()+""
	 * 		String sql="update ascon set UID=?,asnu=?,asnm=?,aste=?,spec=?,ascs=?,chge=?,plac=?,asty=?,usde=?,supp=?,numb=?,unpr=?,usda1=?,rema=?,adse=?,mana=?,cowa=?,unit=?,tapr=?,wape=?,bise=? where Id=?";
	 * */
	public int update(AssetName assetname) {
		int result=0;
		String sql="update ascon set UID=?,asnu=?,asnm=?,aste=?,spec=?,ascs=?,chge=?,plac=?,asty=?,usde=?,supp=?,numb=?,unpr=?,usda1=?,rema=?,adse=?,mana=?,cowa=?,unit=?,tapr=?,wape=?,bise=? where asId=?";
		DBHelper help=new DBHelper();
		String[] params={
				assetname.getUID(),assetname.getAsnu(),assetname.getAsnm(),assetname.getAste(),assetname.getSpec(),assetname.getAscs(),assetname.getChge(),assetname.getPlac(),assetname.getAsty(),assetname.getUsde(),assetname.getSupp(),assetname.getNumb(),assetname.getUnpr(),assetname.getUsda1(),assetname.getRema(),assetname.getAdse(),assetname.getMana(),assetname.getCowa(),assetname.getUnit(),assetname.getTapr(),assetname.getWape(),assetname.getBise(),assetname.getAsId()+""
		};
		result=help.excuteUpdate(sql, params);
		return result;
	}
	
	@Override
	public int del(int aId) {
		int result=0;
		String sql="delete from ascon where asId="+aId;
		DBHelper help=new DBHelper();
		result=help.excuteUpdate(sql);
		return result;
	}
	
	@Override
	public List<AssetName> getList(String where) {
		List<AssetName> list=new ArrayList<AssetName>();
		String sql="select * from ascon "+where;
		DBHelper help=new DBHelper();
		ResultSet rs=help.excuteQuery(sql); 
		try {
			if(rs !=null){
				while(rs.next()){
					AssetName art=new AssetName();
					art.setAsId(rs.getInt("asId"));
					art.setUID(rs.getString("UID"));
					art.setAsnu(rs.getString("asnu"));
					art.setAsnm(rs.getString("asnm"));
					art.setAste(rs.getString("aste"));
					art.setSpec(rs.getString("spec"));
					art.setAscs(rs.getString("ascs"));
					art.setChge(rs.getString("chge"));
					art.setPlac(rs.getString("plac"));
					art.setAsty(rs.getString("asty"));
					art.setUsde(rs.getString("usde"));
					art.setSupp(rs.getString("supp"));
					art.setNumb(rs.getString("numb"));
					art.setUnpr(rs.getString("unpr"));
					art.setUsda1(rs.getString("usda1"));
					art.setUsda2(rs.getString("usda2"));
					art.setRema(rs.getString("rema"));
					art.setAdse(rs.getString("adse"));
					art.setMana(rs.getString("mana"));
					art.setCowa(rs.getString("cowa"));
					art.setUnit(rs.getString("unit"));
					art.setTapr(rs.getString("tapr"));
					art.setWape(rs.getString("wape"));
					art.setBise(rs.getString("bise"));
					list.add(art);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public AssetName getInfo(int aId) {
		AssetName art=new AssetName();
		String sql="select * from ascon where asId="+aId;
		DBHelper help=new DBHelper();
		ResultSet rs=help.excuteQuery(sql);
		try {
			if(rs != null && rs.next()){
					art.setAsId(rs.getInt("asId"));
					art.setUID(rs.getString("UID"));
					art.setAsnu(rs.getString("asnu"));
					art.setAsnm(rs.getString("asnm"));
					art.setAste(rs.getString("aste"));
					art.setSpec(rs.getString("spec"));
					art.setAscs(rs.getString("ascs"));
					art.setChge(rs.getString("chge"));
					art.setPlac(rs.getString("plac"));
					art.setAsty(rs.getString("asty"));
					art.setUsde(rs.getString("usde"));
					art.setSupp(rs.getString("supp"));
					art.setNumb(rs.getString("numb"));
					art.setUnpr(rs.getString("unpr"));
					art.setUsda1(rs.getString("usda1"));
					art.setUsda2(rs.getString("usda2"));
					art.setRema(rs.getString("rema"));
					art.setAdse(rs.getString("adse"));
					art.setMana(rs.getString("mana"));
					art.setCowa(rs.getString("cowa"));
					art.setUnit(rs.getString("unit"));
					art.setTapr(rs.getString("tapr"));
					art.setWape(rs.getString("wape"));
					art.setBise(rs.getString("bise"));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return art;
	}

}
