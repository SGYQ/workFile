package com.mk.DateAndString;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.junit.Test;

public class GetDaysOfDate
{
	static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	
	/**
	 * <p>��ȡ���µ�һ��
	 * @return
	 */
	public String getPreFirstDay()
	{
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, -1); //����
		c.set(Calendar.DAY_OF_MONTH, 1); //����1��
		
		String resultTime = df.format( c.getTime() );
		return resultTime;
	}
	/**
	 * <p>��ȡ�������һ��
	 * @return
	 */
	public String getPreLastDay()
	{
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, -1); //����
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH) ); 
		
		String resultTime = df.format( c.getTime() );
		return resultTime;
	}
	
	/**
	 * <p>��ȡ���µ�һ��
	 * @return
	 */
	public String getCurFirstDay()
	{
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, 0); //����
		//����Ϊ 1��
		c.set(Calendar.DAY_OF_MONTH, 1);
		//������ȡ���
		String resultTime = df.format( c.getTime() );
		
		return resultTime;
	}
	
	/**
	 * <p>��ȡ�������һ��
	 * @return
	 */
	public String getCurLastDay() 
	{
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, 0); //����
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH) );
		
		String resultTime = df.format( c.getTime() );
		return resultTime;
	}

	/**
	 * <p>��ȡ���µ�һ��
	 * @return
	 */
	public String getNextFirstDay()
	{
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, 1); //����
		c.set(Calendar.DAY_OF_MONTH, 1);
		
		String resultTime = df.format( c.getTime() );
		return resultTime;
	}
	
	/**
	 * <p>��ȡ�������һ��
	 */
	public String getNextLastDay()
	{
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, 1); //����
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH) );
		
		String resultTime = df.format( c.getTime() );
		return resultTime;
	}
	
	
	@Test
	public void test1()
	{
		System.out.println("���µ�һ��: "+ getPreFirstDay() );
		System.out.println("�������һ��: "+ getPreLastDay() );
		System.out.println();
		System.out.println("���µ�һ��: "+ getCurFirstDay() );
		System.out.println("�������һ��: "+ getCurLastDay() );
		System.out.println();
		System.out.println("���µ�һ��:"+getNextFirstDay() );
		System.out.println("�������һ��: "+getNextLastDay() );
	}
	
}
