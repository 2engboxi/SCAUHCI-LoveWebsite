package org.zbx.mvcdemo.vo;
public class User{
	private String userid;
	private String name;
	private String password;
	public String getUserid(){
		return userid;
	}
	public String getName(){
		return name;
	}
	public String getPassword(){
		return password;
	}
	public void setUserid(String userid){
		this.userid=userid;
	}
	public void setName(String name){
		this.name=name;
	}
	public void setPassword(String password){
		this.password=password;
	}
}