package test;

import java.util.HashMap;
import java.util.Map;

import com.na.tools.JsonTools;

public class JsonTest {

	public static void main(String[] args) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", 10011);
		map.put("name", "root");
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("a", "aa");
		map2.put("b", "bb");
		map2.put("c", "cc");
		map.put("property", map2);
		String jsonString = JsonTools.mapToJson(map);
		System.out.println(jsonString);
		Map<String, Object> map3 = (Map<String,Object>)JsonTools.jsonToMap(jsonString).get("property");
		System.out.println(map3.get("c"));
	}

}
