<%@page import="com.shoppingcart.dbconnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Product display</title>
</head>
<body>
Welcome, <%=session.getAttribute("name") %>
<center><h1>Products </h1></center>
<table class="table">
<thead>
	    <tr>
	      <th scope="col">Product name</th>
	      <th scope="col">Price</th>
	      <th scope="col">Details</th>
	      <th scope="col">Image</th>
	      <th scope="col">Delete</th>
	    </tr></thead>
	  <%
	try {
		Connection c = dbconnection.getConnection();
		Statement st = c.createStatement();
		String sqlu="select * from product ";
		ResultSet rs =st.executeQuery(sqlu);
	while(rs.next())
	{
		%>
	<tbody><tr>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><img src="getImage?id=<%=rs.getString(1)%>" width="400px"/></td>
		<td><a href="deleteproduct?id=<%= rs.getString(1) %>" >  <button type="submit"class="btn btn-secondary" >Delete</button> </a></td>
	</tr></tbody>
	<%}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}%>
	</table><br>
	<a href="Addproduct.jsp"><h1>Back 🔙</h1></a><hr>
	 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	  <script src="../../dist/js/bootstrap.min.js"></script>
</body>
</html>