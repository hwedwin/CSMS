package org.blueshit.csms.web.controller;

import java.util.HashSet;
import java.util.List;

import org.blueshit.csms.base.BaseAction;
import org.blueshit.csms.entity.Role;
import org.blueshit.csms.entity.User;
import org.blueshit.csms.utils.QueryHelper;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

@Controller
public class UserAction extends BaseAction<User>{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 2446962003494716876L;
	
	/**
	 * 角色ID
	 */
	private Long[] roleIds;
	
	public Long[] getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(Long[] roleIds) {
		this.roleIds = roleIds;
	}

	/**
	 * 当前页.
	 */
	private int pageNum = 1;
	
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	/**
	 * 用户列表.
	 * @return
	 */
	public String list() throws Exception{
		//准备分页数据.
		new QueryHelper(User.class, "u")
			.preparePageBean(userService, pageNum);
		//准备角色数据
		List<Role> roleList = roleService.findAll();
		ActionContext.getContext().put("roleList", roleList);
		return "list";
	}
	
	/**
	 * 添加用户.
	 * @return
	 */
	public String add() throws Exception{
		List<Role> roleList = roleService.findByIds(roleIds);
		model.setRoles(new HashSet<Role>(roleList));
		userService.save(model);
		return "toList";
	}
	
	/**
	 * 修改用户.
	 * @return
	 */
	public String edit() throws Exception{
		//找出原来的用户
		User user = userService.findById(model.getId());
		//设置新的属性
		List<Role> roleList = roleService.findByIds(roleIds);
		user.setRoles(new HashSet<Role>(roleList));
		user.setIntro(model.getIntro());
		user.setLoginName(model.getLoginName());
		user.setUserName(model.getUserName());
		//更新到数据库
		userService.save(user);
		return "toList";
	}
	
	/**
	 * 删除用户.
	 * @return
	 */
	public String delete() throws Exception{
		userService.delete(model.getId());
		return "toList";
	}
	
	/**
	 * 重置密码.
	 * @return
	 */
	public String resetPwd() throws Exception{
		User user = userService.findById(model.getId());
		userService.resetPwd(user);
		return "toList";
	}
	
	/**
	 * 模糊查询.
	 * @return
	 * @throws Exception
	 */
	public String query() throws Exception{
		//准备分页数据,模糊查询.
		new QueryHelper(User.class, "u")
			.addWhereCondition(model.getUserName()!=null||"".equals(model.getUserName()),"u.userName like ?", "%"+model.getUserName()+"%")
			.addWhereCondition(model.getLoginName()!=null||"".equals(model.getLoginName()),"u.loginName like ?", "%"+model.getLoginName()+"%")
			.preparePageBean(userService, pageNum);
		//准备角色数据
		List<Role> roleList = roleService.findAll();
		ActionContext.getContext().put("roleList", roleList);
		return "list";
	}
	

}