package test;

import com.na.tools.AESTools;

public class AESTest {

    public static void main(String[] args) throws Exception {
        /*
         * 此处使用AES-128-ECB加密模式，key需要为16位。
         */
        String cKey = "1234567891011121";
        // 需要加密的字串
        String cSrc = "www.nihaoma.com";
        System.out.println(cSrc);
        // 加密
        String enString = AESTools.Encrypt(cSrc, cKey);
        System.out.println("加密后的字串是：" + enString);
 
        // 解密
        String DeString = AESTools.Decrypt(enString, cKey);
        System.out.println("解密后的字串是：" + DeString);
    }
}
