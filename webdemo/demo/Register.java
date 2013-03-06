package cn.mldn.lxh.demo;
import java.util.HashMap;
import java.util.Map;
public class Register{
	private String name;
	private String age;
	private String email;
	private Map<String,String> errors=null;
	public Register(){
		this.name="";
		this.email="";
		this.age="";
		this.errors=new HashMap<String,String>();
	}
	public boolean isValidate(){
		boolean flag=true;
		if(!this.name.matches("\\w{6,15}")){
			flag=false;
			this.name="";
			errors.put("errorname","用户名是6~15位的字母或数字");
		}
		if(!this.email.matches("\\w+\\w+\\.?\\w*")){
			flag=false;
			this.name="";
			errors.put("erremail","输入的email地址不合法");
		}
		if(!this.age.matches("\\d+")){
			flag=false;
			this.age="";
			errors.put("errage","年龄只能是数字");
		}
		return flag;
	}
    public String getErrorMsg(String key){
		String value=this.errors.get(key);
		return value==null?"":value;
	}
	public String getName(){
		return name;
	}
	public void setName(String name){
		this.name=name;
	}
	public String getAge(){
		return age;
	}
	public void setAge(String age){
		this.age=age;
	}
	public String getEmail(){
		return email;
	}
	public void setEmail(String email){
		this.email=email;
	}
}