package org.blueshit.csms.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.blueshit.csms.base.BaseAction;
import org.blueshit.csms.entity.Color;
import org.blueshit.csms.entity.Item;
import org.blueshit.csms.entity.Size;
import org.blueshit.csms.entity.Storage;
import org.blueshit.csms.utils.QueryHelper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class ItemAction extends BaseAction<Item>{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6633260811007754086L;
	
	private int pageNum=1;
	
	public Map<String, Object> jsonMap;
	
	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}

	public void setJsonMap(Map<String, Object> jsonMap) {
		this.jsonMap = jsonMap;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	/**
	 * 列表.
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		new QueryHelper(Item.class, "i")
			.preparePageBean(itemService, pageNum);
		return "list";
	}
	/**
	 * 添加.
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception{
		itemService.save(model);
		ActionContext.getContext().put("pageNum", pageNum);//维持页码.
		return "toList";
	}
	/**
	 * 删除.
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception{
		itemService.delete(model.getId());
		ActionContext.getContext().put("pageNum", pageNum);//维持页码.
		return "toList";
	}
	/**
	 * 修改.
	 * @return
	 * @throws Exception
	 */
	public String edit() throws Exception{
		//找出原来的数据
		Item item = itemService.findById(model.getId());
		//设置新数据
		item.setBrand(model.getBrand());
		item.setColor_number(model.getColor_number());
		item.setFactory_price(model.getFactory_price());
		item.setItem_number(model.getItem_number());
		item.setLining(model.getLining());
		item.setRetail_price(model.getRetail_price());
		item.setShell(model.getShell());
		item.setSize(model.getSize());
		//更新到数据库
		itemService.save(item);
		ActionContext.getContext().put("pageNum", pageNum);//维持页码.
		return "toList";
	}
	/**
	 * 模糊查询.
	 * @return
	 * @throws Exception
	 */
	public String query() throws Exception{
		//准备分页数据,模糊查询.
		new QueryHelper(Item.class, "i")
			.addWhereCondition(model.getItem_number()!=null&&!"".equals(model.getItem_number()),"i.item_number like ?", "%"+model.getItem_number()+"%")
			.addWhereCondition(model.getBrand()!=null&&!"".equals(model.getBrand()),"i.brand like ?", "%"+model.getBrand()+"%")
			.addWhereCondition(model.getColor_number()!=null&&!"".equals(model.getColor_number()),"i.color_number like ?", "%"+model.getColor_number()+"%")
			.addWhereCondition(model.getSize()!=0,"i.size =", model.getSize())
			.preparePageBean(itemService, pageNum);
		//参数重传，解决分页链接问题.
		ActionContext.getContext().put("querystatue", "querystatue");
		ActionContext.getContext().put("item_number", model.getItem_number());
		ActionContext.getContext().put("brand", model.getBrand());
		ActionContext.getContext().put("color_number", model.getColor_number());
		ActionContext.getContext().put("size", model.getSize());
		return "list";
	}
	
	/**
	 * 修改的时候回显数据.
	 * @return
	 * @throws Exception
	 */
	public String getItemById() throws Exception{
		//获取数据
		Item item = itemService.findById(model.getId());
		List<Color> colorList = colorService.findAll();
		List<Size> sizeList = sizeService.findAll();
		//封装到map
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("item", item);
		map.put("colors", colorList);
		map.put("sizes", sizeList);
		this.setJsonMap(map);
		return "getItemById";
	}
}