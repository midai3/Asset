package Dao;

import java.util.List;
import Model.AssetName;

public interface IAsset {
	//接口，定义新增 修改 删除  列出查询,本文件一般不需要修改。
	/**	
		已知一条新记录，将其添加到表中
		修改一条记录，将修改后的各字段的值保存到表中（编号字段cno不允许修改）
		修改记录时，还需要根据商品编号得到整个记录所有字段的值，以便在修改时将该记录原来的值先显示出来
		删除一条记录，已知该商品记录的编号cno即可
		需要根据指定的条件查询符合条件的记录的集合*/

	public int add(AssetName assetname);
	public int update(AssetName assetname);
	public int del(int aId);
	public List<AssetName> getList(String where);
	public AssetName getInfo(int aId);
}
