package com.mk.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.junit.Test;

/**
 * poi读取 Excel格式
 * @author admin
 *
 */
public class ReadExcelWith
{
	//读取xls格式
	@Test
	public void test1() throws Exception
	{
		String path = "E:\\marryHelp1.xls";
		try {
			FileInputStream input = new FileInputStream( new File(path) );
			Workbook w_book = null;
			
			if(path.endsWith(".xls"))
				w_book = new HSSFWorkbook(input);
			int sheetNum = w_book.getNumberOfSheets();
			
			System.out.println(sheetNum);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}
