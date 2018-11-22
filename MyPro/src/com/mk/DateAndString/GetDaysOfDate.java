package com.mk.DateAndString;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.junit.Test;

public class GetDaysOfDate
{
	static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	
	/**
	 * <p>获取上月第一天
	 * @return
	 */
	public String getPreFirstDay()
	{
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, -1); //上月
		c.set(Calendar.DAY_OF_MONTH, 1); //设置1号
		
		String resultTime = df.format( c.getTime() );
		return resultTime;
	}
	/**
	 * <p>获取上月最后一天
	 * @return
	 */
	public String getPreLastDay()
	{
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, -1); //上月
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH) ); 
		
		String resultTime = df.format( c.getTime() );
		return resultTime;
	}
	
	/**
	 * <p>获取本月第一天
	 * @return
	 */
	public String getCurFirstDay()
	{
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, 0); //本月
		//设置为 1号
		c.set(Calendar.DAY_OF_MONTH, 1);
		//处理，获取结果
		String resultTime = df.format( c.getTime() );
		
		return resultTime;
	}
	
	/**
	 * <p>获取本月最后一天
	 * @return
	 */
	public String getCurLastDay() 
	{
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, 0); //本月
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH) );
		
		String resultTime = df.format( c.getTime() );
		return resultTime;
	}

	/**
	 * <p>获取下月第一天
	 * @return
	 */
	public String getNextFirstDay()
	{
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, 1); //下月
		c.set(Calendar.DAY_OF_MONTH, 1);
		
		String resultTime = df.format( c.getTime() );
		return resultTime;
	}
	
	/**
	 * <p>获取下月最后一天
	 */
	public String getNextLastDay()
	{
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, 1); //下月
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH) );
		
		String resultTime = df.format( c.getTime() );
		return resultTime;
	}
	
	
	@Test
	public void test1()
	{
		System.out.println("上月第一天: "+ getPreFirstDay() );
		System.out.println("上月最后一天: "+ getPreLastDay() );
		System.out.println();
		System.out.println("本月第一天: "+ getCurFirstDay() );
		System.out.println("本月最后一天: "+ getCurLastDay() );
		System.out.println();
		System.out.println("下月第一天:"+getNextFirstDay() );
		System.out.println("下月最后一天: "+getNextLastDay() );
	}
	
}
