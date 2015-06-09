package org.blueshit.csms.web.controller;

import java.util.HashSet;
import java.util.List;




import org.blueshit.csms.base.BaseAction;
import org.blueshit.csms.entity.Privilege;
import org.blueshit.csms.entity.Role;
import org.blueshit.csms.utils.QueryHelper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class RoleAction extends BaseAction<Role>{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -7980188526772815220L;
	/**
	 * 当前页.
	 */
	private int pageNum = 1;
	private Long[] privilegeIds;



	public Long[] getPrivilegeIds() {
		return privilegeIds;
	}

	public void setPrivilegeIds(Long[] privilegeIds) {
		this.privilegeIds = privilegeIds;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	
	/**
	 * 列出所有的角色.
	 * @return
	 * @throws Exception
	 */
	public String list(){
		try{
			
			//准备分页数据
			new QueryHelper(Role.class, "r")
			.preparePageBean(roleService, pageNum);
			
			return "list";
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException(e); 
		}
	}
	
	/**
	 * 添加角色.
	 * @throws Exception
	 */
	public String add() throws Exception{
		roleService.save(model);
		return "toList";
	}
	
	/**
	 * 修改角色.
	 * @return
	 * @throws Exception
	 */
	public String edit() throws Exception{
		Role role = roleService.findById(model.getId());
		//修改
		role.setName(model.getName());
		role.setDescription(model.getDescription());
		
		roleService.update(role);
		return "toList";
	}
	
	
	/**
	 * 删除角色.
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception{
		roleService.delete(model.getId());
		return "toList";
	}
	
	/**
	 * 显示设置权限的界面.
	 * @return
	 * @throws Exception
	 */
	public String setPrivilegeUI() throws Exception{
		//权限数据
		List<Privilege> topPrivilegeList = privilegeService.getTopPrivilege();
		ActionContext.getContext().put("topPrivilegeList", topPrivilegeList);
		//准备回显数据.
		Role role = roleService.findById(model.getId());
		ActionContext.getContext().getValueStack().push(role);
		//准备回显的权限数据
		privilegeIds = new Long[role.getPrivileges().size()];
		int index = 0;
		for(Privilege  privilege : role.getPrivileges()){
			privilegeIds[index++] = privilege.getId();
		}
		ActionContext.getContext().put("privilegeIds", privilegeIds);
		return "setPrivilegeUI";
	}
	
	/**
	 * 设置权限
	 * @return
	 * @throws Exception
	 */
	public String setPrivilege() throws Exception{
		//1.从数据库中找出要修改的对象
		Role role = roleService.findById(model.getId());
		//2.更新要修改的属性.
		List<Privilege> privilegeList = privilegeService.findByIds(privilegeIds);
		role.setPrivileges(new HashSet<Privilege>(privilegeList));
		//3.更新数据库.
		roleService.update(role);
		return "toList";
	}
	
	
}