package com.mk.de;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateManager
{
    /**
     *<p> ��ȡ��ǰ���ڵ���һ��
     * @return
     * @throws ParseException 
     */
    public String getNextDay(String currDate) throws ParseException
    {
    	//1��Stringת����Date
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	Date curr = sdf.parse(currDate);
    	
    	//2����ȡ��ǰ���ڵĵڶ���
    	Calendar c = Calendar.getInstance();
    	c.setTime( curr );
    	int day = c.get( Calendar.DATE );
    	c.set(Calendar.DATE, day+1);
    	
    	//3��Dateת���ַ���
    	String nextDay = sdf.format( c.getTime() );
    	
    	return nextDay;
    }	
    
    public static void main(String[] args) throws ParseException
	{
		String result = new DateManager().getNextDay("2018-10-26");
		System.out.println( result );
	}
    
}
