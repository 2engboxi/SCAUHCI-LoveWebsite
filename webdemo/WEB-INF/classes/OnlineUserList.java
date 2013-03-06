package org.zbx.listenerdemo;
import java.util.Set;
import java.util.TreeSet;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
public class OnlineUserList implements HttpSessionAttributeListener,HttpSessionListener,ServletContextListener{
	private ServletContext app=null;
	@SuppressWarnings("unchecked")  
	public void contextInitialized(ServletContextEvent arg0){//��������ʱ����
		this.app=arg0.getServletContext();
		this.app.setAttribute("online",new TreeSet());
	}
	@SuppressWarnings("unchecked") 
	public void attributeAdded(HttpSessionBindingEvent event){//��������ʱ����
		Set all=(Set)this.app.getAttribute("online");	//Set���������ص��ǲ����������ظ�
		all.add(event.getValue());
		this.app.setAttribute("online",all);
	}
	@SuppressWarnings("unchecked") 
	public void attributeRemoved(HttpSessionBindingEvent event){//����ɾ��ʱ����
		Set all=(Set)this.app.getAttribute("online");
		all.remove(event.getValue());
		this.app.setAttribute("online",all);
	}
	@SuppressWarnings("unchecked") 
	public void sessionDestroyed(HttpSessionEvent se){
		Set all=(Set)this.app.getAttribute("online");
		all.remove(se.getSession().getAttribute("userid"));
		this.app.setAttribute("online",all);
	}
	@SuppressWarnings("unchecked") 
	public void sessionCreated(HttpSessionEvent se){
	}
	@SuppressWarnings("unchecked") 
	public void attributeReplaced(HttpSessionBindingEvent event){//�����滻ʱ����
	}
	@SuppressWarnings("unchecked") 
	public void contextDestroyed(ServletContextEvent sce){
	}
}