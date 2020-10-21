<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.shoppingcart.dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	int sum = 0;
int total = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">

<title>Display cart</title>
</head>
<body>
	<center>
		<h1>Cart</h1>
	</center>

	<hr>
	<br>
	<table class="table ">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">Name</th>
				<th scope="col">Price</th>
				<th scope="col">Quantity</th>
				<th scope="col">Total</th>
				<th scope="col">Delete</th>
				<th scope="col">Edit Quantity</th>
			</tr>
		</thead>
		<%
			try {
			HttpSession ses = request.getSession(false);
			String user = ses.getAttribute("user_id").toString();
			Connection c = dbconnection.getConnection();
			Statement st = c.createStatement();
			String sqlu = "select cart.quantity,product.pname,product.pprice,product.pid,cart.cart_id from cart  INNER JOIN product ON cart.prod_id = product.pid where cart.user_id = " + user ;
			ResultSet rs = st.executeQuery(sqlu);
			while (rs.next()) {
				total = Integer.parseInt(rs.getString(3)) * Integer.parseInt(rs.getString(1));
				sum += total;
		%>
		<tbody>
			<tr>
				<td><img src="getImage?id=<%=rs.getString(4)%>" width="150px"
					height="150px" /></td>
				<td><b><%=rs.getString(2)%></b></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(1)%></td>
				<td><%=total%></td>
				<td><a href="deletecart?id=<%=rs.getString(5)%>">
						<button type="submit" class="btn btn-secondary">Delete</button>
				</a></td>
				<td><a href="updatecart1.jsp?id=<%=rs.getString(5)%>">
						<button type="submit" class="btn btn-secondary">Edit
							quantity</button>
				</a></td>
			</tr>
		</tbody>
		<%
			}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
	<br>
	<center>
		<h4>
			<b>Amount Payable = <%=sum%></b>
		</h4>
	</center>
	<br>
	<hr>

</body>
</html>