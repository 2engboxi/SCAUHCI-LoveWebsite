package org.zbx.mvcdemo.dao.proxy;
import org.zbx.mvcdemo.dao.IUserDAO;
import org.zbx.mvcdemo.vo.User;
import org.zbx.mvcdemo.dao.impl.UserDAOImpl;
import org.zbx.mvcdemo.dbc.DatabaseConnection;
public class UserDAOProxy implements IUserDAO{
	private DatabaseConnection dbc=null;
	private IUserDAO dao=null;
	public UserDAOProxy(){
		try{
			this.dbc=new DatabaseConnection();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		this.dao=new UserDAOImpl(this.dbc.getConnection());
	}
	public boolean findLogin(User user)throws Exception{
		boolean flag=false;
		try{
			flag=this.dao.findLogin(user);
		}
		catch(Exception e){
			throw e;
		}
		finally{
			this.dbc.close();
		}
		return flag;
	}
}