package com.adminServlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.databaseOperation.AllJobRegardingOperation;
import com.entities.JobDetails;

@WebServlet("/AddJobServlet")
public class AddJobServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String title=request.getParameter("title");
		String description=request.getParameter("discription");
		String catogory=request.getParameter("catagory");
		String status=request.getParameter("status");
		String location=request.getParameter("location");
		
		JobDetails jd=new JobDetails();
		jd.setTitle(title);
		jd.setDescription(description);
		jd.setCatogory(catogory);
		jd.setStatus(status);
		jd.setLocation(location);
		
		HttpSession session=request.getSession();
		
		int result=AllJobRegardingOperation.addJob(jd);
		
		if(result>0)
		{
			session.setAttribute("ad-msg", "You have add the job successfully....");
			response.sendRedirect("Admin/addJob.jsp");
		}
		else 
		{
			session.setAttribute("eror-msg", "Something wrong on server....");
			response.sendRedirect("Admin/addJob.jsp");
		}
	}

}
