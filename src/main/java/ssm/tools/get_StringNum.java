package ssm.tools;

public class get_StringNum {
    public static String getStringNum(String str){
        str=str.trim();//去掉字符串首尾空格
        String ss="";
        if(str != null && !"".equals(str)){
            for(int i=0;i<str.length();i++){
                if(str.charAt(i)>=48 && str.charAt(i)<=57){
                    ss+=str.charAt(i);

                }
            }
        }
        return ss;
    }
}
