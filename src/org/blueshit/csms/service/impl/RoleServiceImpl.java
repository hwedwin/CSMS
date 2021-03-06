package org.blueshit.csms.service.impl;


import org.blueshit.csms.base.DaoSupportImpl;
import org.blueshit.csms.entity.Role;
import org.blueshit.csms.service.RoleService;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl extends DaoSupportImpl<Role> implements RoleService {

	public Role getRoleByName(String name){
		return (Role)getSession()
				.createQuery("from Role r where r.name = ?")
				.setParameter(0, name)
				.uniqueResult();
	}

}
