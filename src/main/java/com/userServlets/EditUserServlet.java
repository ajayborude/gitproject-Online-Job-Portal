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

@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String qualf=request.getParameter("qualification");
		String email=request.getParameter("email");
		String pass=request.getParameter("password");

		UserDetails ud=new UserDetails();
		ud.setId(id);
		ud.setName(name);
		ud.setQualification(qualf);
		ud.setEmail(email);
		ud.setPassword(pass);
		
		HttpSession session=request.getSession();
		
		int result=AllUserRegardingOperation.editUser(ud);
		
		if (result>0) 
		{
			session.setAttribute("war-msg", "Your Profile has been updated Successfully....Please Login Again");
			response.sendRedirect("login.jsp");
		}
		else 
		{
			session.setAttribute("eror-msg", "Something wrong on Server.....");
			response.sendRedirect("editUser.jsp");
		}

	}

}
