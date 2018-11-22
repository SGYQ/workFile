package com.mk.insertExcel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;


import org.junit.Test;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

public class AddToExcel
{
	String[] Month = {"1","2","3","4","5","6","7","8","9","10","11","12"};
	String[] recept_person = {"sjhy","mhhy","zbhy","admin","xhhy","fxhy","cmhy","qphy"};//8
	String[] m_name= {"宋洪洋","李刚","王刚","李敢","李偲", 
					  "霍光","桑弘羊","上官政","陈安","南宫域", "王宏","嬴疾","成蛟","嫪毐","田健"}; //15
	String[] f_name= {"梁红玉","霍飞燕","高慧玉","李楠","红安", 
					  "平成","合惠子","玉漱","上官婉儿","武樱", "刘淑玉","陈永萍"};//12
	String[] m_cetf_id= {"140105199403074194","140105199403076632","140105199403075170", 
			"140105199403074610","140105199403078056","140105199403074274", 
			"140105199403079753","140105199403079673","140105199403078777",
			"140105199403071735"};//10
	String[] f_cetf_id= {"220102199003078488", "220102199003072481","220102199003070806", 
			"220102199003070101","220102199003074161","220102199003073388", 
			"220102199003072246","220102199003078840","220102199003076861", 
			"220102199003072609"};//10
	String[] eduction = {"博士","硕士","本科","高中","大专","初中"};//6
	String[] job = {"医生","教师","研究员","分析师","司机", "运功员","士兵","农民","律师","工程师"};//10
	String[] tel= {"18752580012","18752580013","18752580014","18752580015",
			"18752580016","18752580017","18752580018","18752580019"}; //8
	int[] numOfKid = {1,2,3};//子女人数
	String[] interpose = {"接受","拒绝"};//调解意愿
	String[] interpose_result= {"成功","失败"};//调解结果
	String[] return_visit = {"是","否"}; //是否回访
	
	
	@Test
	public void test4()
	{
		for(int i=0; i<100; i++)
			System.out.println(i+"\t"+ (i%12==0?1:i%12) );
	}
	
	
	//success
	@Test
	public void test1()
	{
		try {  
            // 创建输入流，读取Excel  
            InputStream is = new FileInputStream("d://marryHelp.xls");  
            // jxl提供的Workbook类  
            Workbook wb = Workbook.getWorkbook(is);  
            // Excel的页签数量  
            int sheet_size = wb.getNumberOfSheets();  
            for (int index = 0; index < sheet_size; index++) {  
                // 每个页签创建一个Sheet对象  
                Sheet sheet = wb.getSheet(index);  
                // sheet.getRows()返回该页的总行数  
                for (int i = 2; i < sheet.getRows(); i++) {  
                    // sheet.getColumns()返回该页的总列数  
                    for (int j = 0; j < sheet.getColumns(); j++) {  
                        String cellinfo = sheet.getCell(j, i).getContents();  
                        System.out.print(cellinfo+"\t");  
                    }  
                    System.out.println();
                }  
            }  
        } catch (FileNotFoundException e) {  
            e.printStackTrace();  
        } catch (BiffException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
	}
	
	
	
	//success
	@Test
	public void test2() throws RowsExceededException, WriteException
	{
		try {  
            //工作簿？？
            WritableWorkbook workbook = Workbook.createWorkbook( new File("d:/marryHelp_pdb.xlsx") );
            //页签
            WritableSheet sheet = workbook.createSheet("marryHe", 0);
            
            //加100行
            for(int i=2; i<50; i++) {
            		//添加内容
            		/**
            		 * <p>接待时间、接待人、接待编号，（姓名、身份证、学历、职业、联系方式），
            		 * <p>子女人数、调解意愿、调解结果、是否回访
            		 */
            		int month = (i%12==0?1:i%12);
            		int day = (i%28==0?1:i%28);
            		//打印下
            		//System.out.println(i+"\t"+month+"\t"+day);
            		sheet.addCell( new Label(0, i, "2018/"+month+"/"+day) );
            		sheet.addCell( new Label(1, i, recept_person[i%8]) );
            		sheet.addCell( new Label(2, i, "000010251550"+(12150+i)) ); //11806
            		//男方
            		sheet.addCell( new Label(3, i, m_name[i%15]) );
            		sheet.addCell( new Label(4, i, m_cetf_id[i%10] ) );
            		sheet.addCell( new Label(5, i, eduction[i%6]) );
            		sheet.addCell( new Label(6, i, job[i%10]) );
            		sheet.addCell( new Label(7, i, tel[i%8]) );
            		//女方
            		sheet.addCell( new Label(8, i, f_name[i%12]) );
            		sheet.addCell( new Label(9, i, f_cetf_id[i%10] ) );
            		sheet.addCell( new Label(10, i, eduction[i%6]) );
            		sheet.addCell( new Label(11, i, job[i%10]) );
            		sheet.addCell( new Label(12, i, tel[i%8]) );
            		
            		sheet.addCell( new Label(13, i, i%4+"") );
            		sheet.addCell( new Label(14, i, interpose[i%2]) );
            		sheet.addCell( new Label(15, i, interpose_result[i%2]) );
            		sheet.addCell( new Label(16, i, return_visit[i%2]) );
            		
            }
            
            workbook.write();
            workbook.close();
            System.out.println("添加成功!");
        } catch (Exception e) {  
            e.printStackTrace();  
        } 
	}
	

	
}
