package com.adminServlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.databaseOperation.AllJobRegardingOperation;

@WebServlet("/DeleteJobServlet")
public class DeleteJobServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		int result = AllJobRegardingOperation.deleteJob(id);
		if (result > 0) 
		{
			session.setAttribute("suc-msg", "Job has been Deleted");
			response.sendRedirect("Admin/viewJob.jsp");
		} 
		else
		{
			session.setAttribute("eror-msg", "Something wrong on Server");
			response.sendRedirect("Admin/viewJob.jsp");
		}
	}

}