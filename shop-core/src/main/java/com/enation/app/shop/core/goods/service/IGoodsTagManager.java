package com.enation.app.shop.core.goods.service;

import java.util.List;

import com.enation.app.base.core.model.Adv;
import com.enation.app.shop.core.goods.model.Goods;
import com.enation.framework.database.Page;

public interface IGoodsTagManager {

	/**
	 * 获取标签商品
	 * @param ids id列表
	 * @return 已经被使用返回真，否则返回假
	 */
	public List<Goods> listgoodstag() ;
	/**
	 * 根据tagID取出商品列表
	 * @param tagid
	 * @return
	 */
	
	public Page getGoodsList(int tagid, int page, int pageSize);
	/**
	 * 根据标签Id获取标签商品列表
	 * @param tagid
	 * @return List
	 */
	public List getGoodsList(int tagid);
	
	/**
	 * 根据tagid和分类ID取出商品列表
	 * @param tagid
	 * @param catid
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public Page getGoodsList(int tagid,int catid, int page, int pageSize);
	
	/**
	 * 添加商品的tag
	 * @param tagId
	 * @param goodsId
	 */
	public void addTag(int tagId, int goodsId);
	
	/**
	 * 移除商品的tag
	 * @param tagId
	 * @param goodsId
	 */
	public void removeTag(int tagId, int goodsId);
	
	/**
	 * 批量更新商品显示排序
	 * @param goodsId
	 * @param tagids
	 * @param ordernum
	 */
	public void updateOrderNum(Integer[] goodsId,Integer[] tagids, Integer[] ordernum);
}
