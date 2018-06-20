package com.skycat.admin.exception;

import org.apache.shiro.authc.AuthenticationException;

/**
 * admin不是店铺管理员异常，若果admin没有被分配管理的店铺，抛出异常，在shiro中拦截，禁止登
 * note:若果想要shiro可以捕捉到你在realm里抛的自定义异常，异常要是shiro异常体系的，继承他
 * @author Administrator
 * 
 */
public class NotStoreManagerException extends AuthenticationException {

}
