package com.mk.MapBL;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

public class MapDemo
{
	static Map<String,Integer> map= new HashMap<String,Integer>();
	
	static {
		map.put("�Ϻ���",2);
		map.put("�Ϻ���������",5);
		map.put("�Ϻ��������",7);
		map.put("�Ϻ���բ����",0);
	}
	
	@Test
	public void test1() 
	{
		// entrySet ��ȡkey and value
	    for (Map.Entry<String, Integer> entry : map.entrySet()) {
	      System.out.println(entry.getKey() + ":" + entry.getValue());
	    }

	}
	
	
	
}
