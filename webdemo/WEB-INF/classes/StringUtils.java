package org.zbx.chatRoom;
public class StringUtils
{
	public String toGBK(String strvalue) {
      try {
            if (strvalue == null) {             //������strvalueΪnullʱ
                  return "";                      //�����ؿյ��ַ���
            } else {
                  //���ַ���ת��ΪGBK����
                  strvalue = new String(strvalue.getBytes("ISO-8859-1"), "GBK");
                  return strvalue;             //����ת������������strvalue
            }
      } catch (Exception e) {
            return "";
      }
	}

	public String toUTF8(String strvalue) {
            try {
                  if (strvalue == null) {                     //������strvalueΪnullʱ
                        return "";                         //�����ؿյ��ַ���
                  } else {
                        //���ַ���ת��ΪUTF8����
                        strvalue = new String(strvalue.getBytes("ISO-8859-1"), "UTF-8"); 
                        return strvalue;                //����ת������������strvalue
                  }
            } catch (Exception e) {
                  return "";
            }
      }

}