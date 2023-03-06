package com.car.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.nio.file.*;

import com.car.beans.AddCarBean;


import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


/**
 * Servlet implementation class FileUpload
 */
@MultipartConfig
@WebServlet("/FileUpload")
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public FileUpload() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		System.out.println("in do method");
		Part file = request.getPart("CarDocuments");
		String fileName = file.getSubmittedFileName();
		InputStream path = file.getInputStream();
		System.out.println("path="+path);
		System.out.println("file name = "+fileName);
		String uploadPath = System.getProperty("user.dir")+File.separator+fileName;
	
		System.out.println("upload path="+uploadPath);
		FileOutputStream fos = new FileOutputStream(fileName);
		InputStream is = file.getInputStream();
		byte[] data = new byte[is.available()];
		is.read(data);
		fos.write(data);
		
		file = request.getPart("Image1");
		String fileName1 = file.getSubmittedFileName();
		InputStream path1 = file.getInputStream();
		System.out.println("path="+path1);
		System.out.println("file name = "+fileName1);
		String uploadPath1 = System.getProperty("user.dir")+File.separator+fileName1;
	
		System.out.println("upload path="+uploadPath1);
		fos = new FileOutputStream(fileName1);
		is = file.getInputStream();
		byte[] data1 = new byte[is.available()];
		is.read(data1);
		fos.write(data1);
		
		file = request.getPart("Image2");
		String fileName2 = file.getSubmittedFileName();
		InputStream path2 = file.getInputStream();
		System.out.println("path="+path2);
		System.out.println("file name = "+fileName2);
		String uploadPath2 = System.getProperty("user.dir")+File.separator+fileName2;
	
		System.out.println("upload path="+uploadPath2);
		fos = new FileOutputStream(fileName2);
		is = file.getInputStream();
		byte[] data2 = new byte[is.available()];
		is.read(data2);
		fos.write(data2);
		
		file = request.getPart("Image3");
		String fileName3 = file.getSubmittedFileName();
		InputStream path3 = file.getInputStream();
		System.out.println("path="+path3);
		System.out.println("file name = "+fileName3);
		String uploadPath3 = System.getProperty("user.dir")+File.separator+fileName3;
	
		System.out.println("upload path="+uploadPath3);
		fos = new FileOutputStream(fileName3);
		is = file.getInputStream();
		byte[] data3 = new byte[is.available()];
		is.read(data3);
		fos.write(data3);
		
		file = request.getPart("Image4");
		String fileName4 = file.getSubmittedFileName();
		InputStream path4 = file.getInputStream();
		System.out.println("path="+path4);
		System.out.println("file name = "+fileName4);
		String uploadPath4 = System.getProperty("user.dir")+File.separator+fileName4;
	
		System.out.println("upload path="+uploadPath4);
		fos = new FileOutputStream(fileName4);
		is = file.getInputStream();
		byte[] data4 = new byte[is.available()];
		is.read(data4);
		fos.write(data4);
		
		file = request.getPart("Image5");
		String fileName5 = file.getSubmittedFileName();
		InputStream path5 = file.getInputStream();
		System.out.println("path="+path5);
		System.out.println("file name = "+fileName5);
		String uploadPath5 = System.getProperty("user.dir")+File.separator+fileName5;
	
		System.out.println("upload path="+uploadPath5);
		fos = new FileOutputStream(fileName5);
		is = file.getInputStream();
		byte[] data5 = new byte[is.available()];
		is.read(data5);
		fos.write(data5);
		
		
		fos.close();
		//File tempfile = new File("CarDocuments/tmp", fileName);
		//File f = new File(fileName);
		//f.delete();
		

		Connection con;
		PreparedStatement ps1=null;
		FileInputStream fis= null;


	try{
		//ServletConfig cg = getServletConfig();
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbuser = "system";
		String dbpwd = "system";
		
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		con = DriverManager.getConnection(url,dbuser,dbpwd);
		
		ps1 = con.prepareStatement("INSERT INTO CAR VALUES(CARSEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		
	

		String val = request.getParameter("addCar");
		//if(val.equals("addCar")){
		AddCarBean acb = new AddCarBean();
		acb.setCarName(request.getParameter("CarName"));
		acb.setCarNo(request.getParameter("CarNumber"));
		acb.setNoOfSeats(request.getParameter("NoOfSeats"));
		acb.setCarColor(request.getParameter("CarColor"));
		acb.setModelYear(request.getParameter("ModelYear"));
		acb.setFuelType(request.getParameter("FuelType"));
		acb.setCarDocuments(request.getParameter("carDocuments"));
		acb.setCarRent(request.getParameter("CarRent"));
		System.out.println(acb.getCarDocuments());
		
		//============
			//Part file = request.getPart("CarDocuments");
			//String fileName = file.getSubmittedFileName();
			//InputStream path = file.getInputStream();
			System.out.println("path="+path);
			System.out.println("file name = "+fileName);
		//===
		
		//Clob clob = con.createClob();
		//clob.setString(1, acb.getCarDocuments());
		//InputStream is = new FileInputStream(acb.getCarDocuments());
			
		//String loc = request.getParameter("CarDocuments");
		//File f = new File(loc);
		//FileInputStream fis = new FileInputStream(f);
		//System.out.println("loca="+f);
		//System.out.println("loca1="+request.getParameter("carDocuments"));

		
	//	try {
			HttpSession session = request.getSession();
			ps1.setString(1,acb.getCarName());
			ps1.setString(2,acb.getCarNo());
			ps1.setString(3,acb.getNoOfSeats());
			ps1.setString(4,acb.getCarColor());
			ps1.setString(5,acb.getModelYear());
			ps1.setString(6,acb.getFuelType());
			ps1.setString(7,acb.getCarRent());
			ps1.setInt(14, (int)session.getAttribute("id"));
			
			
			InputStream is1 = new FileInputStream(System.getProperty("user.dir")+File.separator+fileName);
			ps1.setBinaryStream(8,is1);
			is1.close();
			File f= new File(System.getProperty("user.dir")+File.separator+fileName); 
			f.delete();
			
			InputStream is2 = new FileInputStream(System.getProperty("user.dir")+File.separator+fileName1);
			ps1.setBinaryStream(9,is2);
			is2.close();
			f= new File(System.getProperty("user.dir")+File.separator+fileName1); 
			f.delete();
			
			InputStream is3 = new FileInputStream(System.getProperty("user.dir")+File.separator+fileName2);
			ps1.setBinaryStream(10,is3);
			is3.close();
			f= new File(System.getProperty("user.dir")+File.separator+fileName2); 
			f.delete();
			
			InputStream is4 = new FileInputStream(System.getProperty("user.dir")+File.separator+fileName3);
			ps1.setBinaryStream(11,is4);
			is4.close();
			f= new File(System.getProperty("user.dir")+File.separator+fileName3); 
			f.delete();
			
			InputStream is5 = new FileInputStream(System.getProperty("user.dir")+File.separator+fileName4);
			ps1.setBinaryStream(12,is5);
			is5.close();
			f= new File(System.getProperty("user.dir")+File.separator+fileName4); 
			f.delete();
			
			InputStream is6 = new FileInputStream(System.getProperty("user.dir")+File.separator+fileName5);
			ps1.setBinaryStream(13,is6);
			is6.close();
			f= new File(System.getProperty("user.dir")+File.separator+fileName5); 
			f.delete();
			
		
			//ps1.setString(8,acb.getCarDocuments());
			//ps1.setBinaryStream(8,is);
			
			int result = ps1.executeUpdate();
			
			if(result==1)
			{
				System.out.println("path == "+request.getContextPath());
				System.out.println("path1 == "+request.getRequestURL());
				if(request.getParameter("user").equals("CarDealer"))
				{
					response.sendRedirect(request.getContextPath()+"/CarDealer/Cardealer.jsp?action=addCar&success=true");
				}
				else
				{
					response.sendRedirect(request.getContextPath()+"/Admin/AdminDashboard.jsp?action=addCar&success=true");
				}
			}

		}

		catch(Exception se)
		{
			se.printStackTrace();
		}
		finally
		{
			fos.close();
			is.close();
		
		}
	
	
		
		
		

		
	

	}

}
