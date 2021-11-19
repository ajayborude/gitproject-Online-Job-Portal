package com.userServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.databaseOperation.AllUserRegardingOperation;
import com.entities.UserDetails;

@WebServlet("/LoginUserServlet")
public class LoginUserServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String pass = request.getParameter("password");

		UserDetails ud = null;
		HttpSession session = request.getSession();
		

		if (email.equals("ajay@yahoo.com") && pass.equals("5555")) 
		{
			ud = new UserDetails();
			response.sendRedirect("Admin/admin.jsp");
			session.setAttribute("admin-obj", ud);
		}
		else 
		{
            ud=AllUserRegardingOperation.loginUser(email, pass);
            if(ud!=null)
            {
            	response.sendRedirect("index.jsp");
            	session.setAttribute("user-obj", ud);
            }
            else
            {
				response.sendRedirect("login.jsp");
				session.setAttribute("war-msg", "Invalid Email or Password");
			}
		}
	}

}
