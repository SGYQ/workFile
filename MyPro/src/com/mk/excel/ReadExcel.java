package com.mk.excel;

import java.io.File;
import java.io.FileInputStream;
import org.junit.Test;

import jxl.Workbook;
/**
 * jxl��ȡExcel .xls��ʽ
 * @author admin
 *
 */
public class ReadExcel
{
	//�޽��
	@Test
	public void test1()
	{
		String str = "zz.dd.mm.xls";
		
		String[] spilt  = str.split(".");
		
		for(String o: spilt)
			System.out.print(o+"\t");
	}
	
	//�������
	@Test
	public void test2()
	{
		String str = "zz.dd.mm.xls";
		String[] split = str.split("\\.");
		
		for(String o: split)
			System.out.print(o+"\t");
	}
	
	//���Զ�ȡExcel�ļ� xlsx��ʽ
	@Test
	public void test3() throws Exception 
	{
		FileInputStream input = new FileInputStream( new File("E:\\marryHelp1.xlsx") );
		
		Workbook workbook = Workbook.getWorkbook(input);
		// Excel��ҳǩ����  
        int sheet_size = workbook.getNumberOfSheets();
		//jxl��ȡ����.xlsx��ʽ
        System.out.println( sheet_size );
	}
	
	
	
}
