package org.zbx.chatRoom;
public class StringUtils
{
	public String toGBK(String strvalue) {
      try {
            if (strvalue == null) {             //当变量strvalue为null时
                  return "";                      //将返回空的字符串
            } else {
                  //将字符串转换为GBK编码
                  strvalue = new String(strvalue.getBytes("ISO-8859-1"), "GBK");
                  return strvalue;             //返回转换后的输入变量strvalue
            }
      } catch (Exception e) {
            return "";
      }
	}

	public String toUTF8(String strvalue) {
            try {
                  if (strvalue == null) {                     //当变量strvalue为null时
                        return "";                         //将返回空的字符串
                  } else {
                        //将字符串转换为UTF8编码
                        strvalue = new String(strvalue.getBytes("ISO-8859-1"), "UTF-8"); 
                        return strvalue;                //返回转换后的输入变量strvalue
                  }
            } catch (Exception e) {
                  return "";
            }
      }

}