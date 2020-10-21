package com.shoppingcart;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;

/**
 * Servlet implementation class Addproduct
 */
@MultipartConfig(maxFileSize = 16177215)
public class Addproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addproduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pname,pdetails,price;
		Part img;
//		FileInputStream fis = null;
//		Part image =null;
		pname = request.getParameter("pname");
		price = request.getParameter("price");
		pdetails = request.getParameter("pdetail");
		img = request.getPart("i");
		InputStream is=img.getInputStream();
		byte[] bytes=is.readAllBytes();
		
		
		try {
			Connection c = dbconnection.getConnection();
			String query = "insert into product(pname, pprice, pdetails,pimg) " + "values(?,?,?,?)";
			PreparedStatement pstmt = c.prepareStatement(query);
			Blob blob = new SerialBlob(bytes); //run karayyesss
			pstmt.setString(1, pname);
			pstmt.setString(2, price);
			pstmt.setString(3, pdetails);
			pstmt.setBlob(4, blob);
	        pstmt.execute();
			response.sendRedirect("Addproduct.jsp"); 
			}catch(Exception e) {e.printStackTrace();}
		}		
}