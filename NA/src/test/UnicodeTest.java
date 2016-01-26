package test;

import com.na.tools.UnicodeAndStringTools;

public class UnicodeTest {

	public static void main(String[] args) {
		String stringString = "哈哈我是String类型的字符串";
		String unicodesString = UnicodeAndStringTools.stringToUnicode(stringString);
		System.out.println(unicodesString);
		String string2String = UnicodeAndStringTools.unicodeToString(unicodesString);
		System.out.println(string2String);
	}
}
