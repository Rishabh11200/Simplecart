<%@page import="com.shoppingcart.dbconnection"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.io.*"%>
<%
	String id = request.getParameter("id");
	//String id  = "1";

try {

	Connection con = dbconnection.getConnection();
	PreparedStatement ps = con.prepareStatement("select * from product where pid=?");
	ps.setString(1, id);
	ResultSet rs = ps.executeQuery();

	if (rs.next()) {
		Blob blob = rs.getBlob(5);
		byte byteArray[] = blob.getBytes(1, (int) blob.length());

		response.setContentType( "image/gif");
		OutputStream os = response.getOutputStream();
		os.write(byteArray);
		System.out.println(os);
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>