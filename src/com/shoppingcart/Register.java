package com.shoppingcart;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registerServlet
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		PrintWriter pw = response.getWriter();
		String name,email,add,phone,pass,role;
		name = request.getParameter("name");
		email = request.getParameter("email");
		add = request.getParameter("add");
		phone = request.getParameter("phone");
		pass = request.getParameter("pass");
		role = request.getParameter("role");
		try {
		Connection c = dbconnection.getConnection();
		Statement st = c.createStatement();
		String sqlu="select * from register where name ='" + name + "'";
		ResultSet rs =st.executeQuery(sqlu);
		if(rs.next())
		{
			pw.print("<br> Please use different name , it already exist!");
			response.sendRedirect("login.jsp");
		}
		else
		{
			String sql="insert into register (name,email,address,phone,password,roleid) values ('"+name+"','"+email+"','"+add+"','"+ phone +"','"+ pass +"','2')";
			System.out.println(sql);
			int send = st.executeUpdate(sql);
			pw.print("Inserted row  = " + send);
			response.sendRedirect("login.jsp");
		}
		
		}catch(Exception e) {e.printStackTrace();}
		
		
	}

}
