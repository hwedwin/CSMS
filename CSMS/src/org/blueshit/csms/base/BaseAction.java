package org.blueshit.csms.base;

import java.lang.reflect.ParameterizedType;


import org.apache.struts2.ServletActionContext;


import org.blueshit.csms.entity.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("unchecked")
public class BaseAction<T> extends ActionSupport implements ModelDriven<T>{
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4891416074548081771L;
	//==============声明service====================

	
	//声明model
	protected T model;
	
	
	/** 
	 * 通过构造函数获取T.
	 */
	public BaseAction(){
		try{
			//通过反射获取T的真实类型.
			ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
			@SuppressWarnings("rawtypes")
			Class clazz = (Class<T>) pt.getActualTypeArguments()[0];
			model = (T) clazz.newInstance();
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}

	public T getModel() {
		return model;
	}
	
	//***********************常用方法****************************
	/**
	 * 获取当前用户
	 * @return
	 */
	public User getCurrentUser(){
		return (User)ActionContext.getContext().getSession().get("user");
	}
	
	/**
	 * 获取请求地址.
	 * @return
	 */
	public String getRequestIP(){
		return ServletActionContext.getRequest().getRemoteAddr();
	}
	
	
	
	
}
