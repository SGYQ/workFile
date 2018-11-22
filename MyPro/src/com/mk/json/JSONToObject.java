package com.mk.json;

import org.junit.Test;

import com.alibaba.fastjson.JSON;

public class JSONToObject
{
	@Test
	public void test1()
	{
		//JSON串转化成Object
		//无法转化
		//String  data = "[{\"id\":\"9\",\"name\":\"张居正\",\"gender\":\"0\",\"email\":\"jk9@zte.com\",\"tel\":\"13853422191\",\"address\":\"泸州\"}]";
		//转化成功
		String  data1 = "{\"id\":\"9\",\"name\":\"张居正\",\"gender\":\"0\",\"email\":\"jk9@zte.com\",\"tel\":\"13853422191\",\"address\":\"泸州\"}";
		Employee emp = JSON.parseObject(data1, Employee.class);
		
		System.out.println(emp);
	}
}
