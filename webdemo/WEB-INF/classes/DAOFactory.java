package org.zbx.mvcdemo.factory;
import org.zbx.mvcdemo.dao.IUserDAO;
import org.zbx.mvcdemo.dao.proxy.UserDAOProxy;
public class DAOFactory{
	public static IUserDAO getIUserDAOInstance(){
		return new UserDAOProxy();
	}
}