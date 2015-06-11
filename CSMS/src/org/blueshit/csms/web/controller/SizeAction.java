package org.blueshit.csms.web.controller;

import org.blueshit.csms.base.BaseAction;
import org.blueshit.csms.entity.Size;
import org.blueshit.csms.utils.QueryHelper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class SizeAction extends BaseAction<Size>{
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -255572815746850918L;
	
	private int pageNum = 1;

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	
	/**
	 * 分页列表.
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception{
		new QueryHelper(Size.class, "s")
			.preparePageBean(sizeService, pageNum);
		return "list";
	}
	/**
	 * 添加.
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception{
		sizeService.save(model);
		ActionContext.getContext().put("pageNum", pageNum);
		return "toList";
	}
	
	/**
	 * 删除.
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception{
		sizeService.delete(model.getId());
		ActionContext.getContext().put("pageNum", pageNum);
		return "toList";
	}
	
	/**
	 * 修改.
	 * @return
	 * @throws Exception
	 */
	public String edit() throws Exception{
		//先找出原来数据
		Size size = sizeService.findById(model.getId());
		//设置要修改的属性
		size.setNum(model.getNum());
		//更新到数据库
		sizeService.save(size);
		ActionContext.getContext().put("pageNum", pageNum);
		return "toList";
	}
	

}
