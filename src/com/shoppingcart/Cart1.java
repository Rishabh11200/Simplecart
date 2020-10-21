package com.shoppingcart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CArr
 */
public class Cart1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cart1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String quantity = request.getParameter("quantity");
		String prod_id = request.getParameter("prod_id");
		HttpSession session = request.getSession(false);
		String user_id = session.getAttribute("user_id").toString();
		try {
			
		Connection c  = dbconnection.getConnection();
		Statement s = 	c.createStatement();
		String sql = " insert into cart (prod_id, user_id, quantity) values (' " + prod_id+ "',' " + user_id+ "',' " + quantity + "')";
		int i=s.executeUpdate(sql);
		if (i != 0) {
			response.sendRedirect("Uproductdisplay.jsp");
		}
		}catch(Exception e){e.printStackTrace();}
	}

}
