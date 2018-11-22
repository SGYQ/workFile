package com.mk.conn;

import java.sql.Connection;
import java.sql.DriverManager;

import com.mysql.jdbc.PreparedStatement;

public class InsertData
{
	public static void main(String[] args) throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost:3306/demo";
		String username = "mk";
		String password = "02141872";
		
		Connection con = DriverManager.getConnection(url, username, password);
		
		String sql = "insert into suiyi(name,password) values(?,?) ";
		PreparedStatement pmt = (PreparedStatement) con.prepareStatement(sql);
		
		for(int i=0; i<1000; i++) {
			pmt.setString(1, "hk"+i);
			pmt.setString(2, 995+i+"");
			
			pmt.execute();
		}
		
		pmt.close();
		con.close();
	}
}
