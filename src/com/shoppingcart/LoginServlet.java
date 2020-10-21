package com.shoppingcart;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String name,password;
		name = request.getParameter("uname");
		password = request.getParameter("password");
		PrintWriter pw = response.getWriter();
		try {
		Connection c = dbconnection.getConnection();
		Statement st = c.createStatement();
		String sqlu="select * from register where name ='" + name + "' and password = '" +password + "'";
		ResultSet rs =st.executeQuery(sqlu);
		String a = "1",b="2";
		if(rs.next())
		{
			HttpSession session=request.getSession();
			session.setAttribute("name", rs.getString(2));
			session.setAttribute("user_id",rs.getString(1));
			if(rs.getString(7).equals(a)) {
				response.sendRedirect("Addproduct.jsp");
			}
			else if (rs.getString(7).equals(b)) {
			response.sendRedirect("Uproductdisplay.jsp");
			}
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
