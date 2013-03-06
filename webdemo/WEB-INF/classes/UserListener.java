package org.zbx.chatRoom.listener;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionBindingEvent;
import org.zbx.chatRoom.*;
public class UserListener implements HttpSessionBindingListener {
      private String user;
      private UserInfo container = UserInfo.getInstance();          //���UserInfo��Ķ���
      public UserListener() {
            user = "";
      }
      // �������߼�����Ա
      public void setUser(String user) {
            this.user = user;
      }
      // ��ȡ���߼���
      public String getUser() {
            return this.user;
      }
      // ��Session�ж������ʱִ�еķ���
      public void valueBound(HttpSessionBindingEvent arg0) {
            System.out.println("�����û���" + this.user);
      }
      // ��Session�ж����Ƴ�ʱִ�еķ���
      public void valueUnbound(HttpSessionBindingEvent arg0) {
            System.out.println("�����û���" + this.user);
            if (user != "") {
                  container.removeUser(user);
            }
      }
}
