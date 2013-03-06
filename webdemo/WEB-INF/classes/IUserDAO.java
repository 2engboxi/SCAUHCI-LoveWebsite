package org.zbx.mvcdemo.dao;
import org.zbx.mvcdemo.vo.User;
public interface IUserDAO{
	public boolean findLogin(User user)throws Exception;
}