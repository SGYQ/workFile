package com.mk.excel;

import java.io.File;
import java.io.FileInputStream;
import org.junit.Test;

import jxl.Workbook;
/**
 * jxl读取Excel .xls格式
 * @author admin
 *
 */
public class ReadExcel
{
	//无结果
	@Test
	public void test1()
	{
		String str = "zz.dd.mm.xls";
		
		String[] spilt  = str.split(".");
		
		for(String o: spilt)
			System.out.print(o+"\t");
	}
	
	//结果正常
	@Test
	public void test2()
	{
		String str = "zz.dd.mm.xls";
		String[] split = str.split("\\.");
		
		for(String o: split)
			System.out.print(o+"\t");
	}
	
	//测试读取Excel文件 xlsx格式
	@Test
	public void test3() throws Exception 
	{
		FileInputStream input = new FileInputStream( new File("E:\\marryHelp1.xlsx") );
		
		Workbook workbook = Workbook.getWorkbook(input);
		// Excel的页签数量  
        int sheet_size = workbook.getNumberOfSheets();
		//jxl读取不了.xlsx格式
        System.out.println( sheet_size );
	}
	
	
	
}
