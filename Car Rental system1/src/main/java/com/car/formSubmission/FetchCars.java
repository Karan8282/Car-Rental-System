package com.car.formSubmission;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.car.beans.Car;

public class FetchCars {
	public static List fetch() {
		List l = new ArrayList();
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
    		String url = "jdbc:oracle:thin:@localhost:1521:xe";
    		String dbuser = "system";
    		String dbpwd = "system";
    		
    		
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		
    	Connection con = DriverManager.getConnection(url,dbuser,dbpwd);
	
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT  * FROM CAR");	
	
		
		while(rs.next())
		{
			Car c = new Car();
			c.setCarId(rs.getInt(1));
			c.setCarName(rs.getString(2));
			c.setCarNumber(rs.getString(3));
			c.setNoOfSeats(rs.getInt(4));
			c.setCarColor(rs.getString(5));
			c.setModelYear(rs.getInt(6));
			c.setFuelType(rs.getString(7));
			c.setCarRent(rs.getString(8));
			c.setBCarDocument(rs.getBinaryStream(9));
			c.setBImage1( rs.getBinaryStream(10));
			c.setBImage2( rs.getBinaryStream(11));
			c.setBImage3( rs.getBinaryStream(12));
			c.setBImage4( rs.getBinaryStream(13));
			c.setBImage5( rs.getBinaryStream(14));
			c.setAddedyBy(rs.getInt(15));
			l.add(c);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return l;
	}
	
	public static List fetch(int id) {
		List l = new ArrayList();
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
    		String url = "jdbc:oracle:thin:@localhost:1521:xe";
    		String dbuser = "system";
    		String dbpwd = "system";
    		
    		
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		
    	Connection con = DriverManager.getConnection(url,dbuser,dbpwd);
	
		Statement st = con.createStatement();
		String query = "SELECT  * FROM CAR WHERE ADDEDBY = "+id;
		ResultSet rs = st.executeQuery(query);	
	
		
		while(rs.next())
		{
			Car c = new Car();
			c.setCarId(rs.getInt(1));
			c.setCarName(rs.getString(2));
			c.setCarNumber(rs.getString(3));
			c.setNoOfSeats(rs.getInt(4));
			c.setCarColor(rs.getString(5));
			c.setModelYear(rs.getInt(6));
			c.setFuelType(rs.getString(7));
			c.setCarRent(rs.getString(8));
			c.setBCarDocument(rs.getBinaryStream(9));
			c.setBImage1( rs.getBinaryStream(10));
			c.setBImage2( rs.getBinaryStream(11));
			c.setBImage3( rs.getBinaryStream(12));
			c.setBImage4( rs.getBinaryStream(13));
			c.setBImage5( rs.getBinaryStream(14));
			c.setAddedyBy(rs.getInt(15));
			l.add(c);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return l;
	}
}
