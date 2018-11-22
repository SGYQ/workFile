package com.mk.de;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateManager
{
    /**
     *<p> 获取当前日期的下一天
     * @return
     * @throws ParseException 
     */
    public String getNextDay(String currDate) throws ParseException
    {
    	//1、String转化成Date
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	Date curr = sdf.parse(currDate);
    	
    	//2、获取当前日期的第二天
    	Calendar c = Calendar.getInstance();
    	c.setTime( curr );
    	int day = c.get( Calendar.DATE );
    	c.set(Calendar.DATE, day+1);
    	
    	//3、Date转成字符串
    	String nextDay = sdf.format( c.getTime() );
    	
    	return nextDay;
    }	
    
    public static void main(String[] args) throws ParseException
	{
		String result = new DateManager().getNextDay("2018-10-26");
		System.out.println( result );
	}
    
}
