package com.jk.demo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.Test;

public class TestExcel
{
	//能读取xls格式
	@Test
	public void test1() throws IOException
	{
		String path = "E:\\marryHelp1.xls";
		try {
			FileInputStream input = new FileInputStream( new File(path) );
			HSSFWorkbook w_book = null;
			
			w_book = new HSSFWorkbook(input);
			//获取页签数量
			int sheet_numbers = w_book.getNumberOfSheets();
			
			System.out.println(sheet_numbers);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	@Test
	public void test2() throws IOException
	{
		String path = "E:\\marryHelp1.xls";
		try {
			FileInputStream input = new FileInputStream( new File(path) );
			Workbook w_book = null;
			
			if( path.endsWith(".xls") )
				w_book = new HSSFWorkbook(input);
			else if( path.endsWith(".xlsx") )
				w_book = new XSSFWorkbook(input);
			
			//获取页签数量
			int sheet_numbers = w_book.getNumberOfSheets();
			//页签对象
			Sheet sheet = w_book.getSheetAt(0);
			//行数
			int rows = sheet.getLastRowNum();
			
			//获取一行
			/*Row row = sheet.getRow(2);
			System.out.println(row);*/
			
			System.out.println("页签："+sheet_numbers);
			System.out.println("行："+rows);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@Test
	public void test3() throws IOException 
	{
		String path = "E:\\marryHelp1.xlsx";
		try {
			FileInputStream input = new FileInputStream( new File(path) );
			Workbook w_book = null;
			
			if( path.endsWith(".xls") )
				w_book = new HSSFWorkbook(input);
			else if( path.endsWith(".xlsx") )
				w_book = new XSSFWorkbook(input);
			
			//获取页签数量
			int sheet_numbers = w_book.getNumberOfSheets();
			for(int i=0; i<sheet_numbers; i++)
			{
				Sheet sheet_ = w_book.getSheetAt(i);
				int rows = sheet_.getLastRowNum()+1;
				//读取每一行
				for(int j=2; j<rows; j++) {
					Row row = sheet_.getRow(j);
					
					int start = row.getFirstCellNum();
					int end = row.getLastCellNum();
					for(int temp = start; temp<end; temp++)
					{
						Cell cell = row.getCell(temp); //注意空指针
						if( cell==null )
						{
							//cell = new Cell();
							continue;
						}
						System.out.print( cell.toString()+" " );
					}
					System.out.println();
				}
				
			}
				
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test4()
	{
		TestExcel t  = null;
		System.out.println(t.toString());
	}
	
}
