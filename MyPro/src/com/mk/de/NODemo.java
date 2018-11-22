package com.mk.de;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NODemo
{
    /**
     * 生成时间戳
     */
    public static String getDateTime() {
        DateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        return sdf.format(new Date());
    }
    
    public static void main(String[] args)
	{
    	String str = getDateTime();
		System.out.println( str+" : " +str.length() ); //20181024 095543 138
	}
    
}
