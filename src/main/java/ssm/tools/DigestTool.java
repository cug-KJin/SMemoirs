package ssm.tools;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
public class DigestTool {

    public static String MD5(String str){
        // 1、MD5加密(不可逆)
        String md5Str = DigestUtils.md5Hex(str);
        return md5Str.substring(16);
    }
    public static String Base64Str(String str){
        // Base64加密
        String base64Str = Base64.encodeBase64String(str.getBytes());
        return base64Str;
    }
    public static String base64DecodeStr(String str){
        // Base64解密
        String base64DecodeStr = new String(Base64.decodeBase64(str));
        return base64DecodeStr;
    }

    public static void main(String[] args){
        String str = "123456";
        System.out.println(DigestTool.MD5(str));
        String base = DigestTool.Base64Str(str);
        System.out.println(base);
        System.out.println(DigestTool.base64DecodeStr(base));
    }
}
