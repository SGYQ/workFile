package com.mk.MapBL;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

public class MapDemo
{
	static Map<String,Integer> map= new HashMap<String,Integer>();
	
	static {
		map.put("上海市",2);
		map.put("上海市闵行区",5);
		map.put("上海市徐汇区",7);
		map.put("上海市闸北区",0);
	}
	
	@Test
	public void test1() 
	{
		// entrySet 获取key and value
	    for (Map.Entry<String, Integer> entry : map.entrySet()) {
	      System.out.println(entry.getKey() + ":" + entry.getValue());
	    }

	}
	
	
	
}
