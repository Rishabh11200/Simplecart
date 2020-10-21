<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.shoppingcart.dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/productdecorate.css" />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Display products</title>
</head>
<body>
<h3>Welcome,<b><%=session.getAttribute("name") %></b></h3> 
<div align="right" style="margin-right:10%"><a href=" cartshow.jsp"> <i class="fa fa-shopping-cart" style="font-size:36px;color:black"></i> </a><h4>Cart</h4></div>
<hr>
<center><h1>Products </h1></center>
 <%
	try {
		Connection c = dbconnection.getConnection();
		Statement st = c.createStatement();
		String sqlu="select * from product ";
		ResultSet rs =st.executeQuery(sqlu);
	while(rs.next())
	{
		%>
		<div class="row justify-content-center">
		<div class="card">
		<div class="col-md-4">
  			<img class="card-img-top" src="getImage?id=<%=rs.getString(1)%>" alt="Card image" width="100px" height="100px">
  			<div class="card-body">
    			<h4 class="card-title"><%=rs.getString(2) %></h4>
  			  <p class="card-text"><%=rs.getString(4) %></p>
  			  <p class="card text"> &#8377;  <%=rs.getString(3) %></p>
    		<a href="addtocart.jsp?prod_id=<%=rs.getString(1)%>" class="btn btn-primary">Add to cart</a>
 		 </div>
 		 </div>
 		 <%}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}%>
  			</div>
  			
	</div>
		
		
	
<footer style="margin-left:50px"><br><a href="logout">Logout</a></footer>
</body>
</html>