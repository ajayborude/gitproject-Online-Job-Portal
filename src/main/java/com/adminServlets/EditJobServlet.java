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

@WebServlet("/EditJobServlet")
public class EditJobServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String title = request.getParameter("title");
			String location = request.getParameter("location");
			String catogory = request.getParameter("catagory");
			String status = request.getParameter("status");
			String description = request.getParameter("discription");
			String pub_date = request.getParameter("Publish Date");

			JobDetails jd = new JobDetails();
			jd.setId(id);
			jd.setTitle(title);
			jd.setLocation(location);
			jd.setCatogory(catogory);
			jd.setStatus(status);
			jd.setDescription(description);
			jd.setPdate(pub_date);
			

			HttpSession session = request.getSession();

			int result = AllJobRegardingOperation.editJob(jd);
			if (result > 0) {
				session.setAttribute("suc-msg", "Job has been successfully Updated");
				response.sendRedirect("Admin/viewJob.jsp");
			} else {
				session.setAttribute("eror-msg", "Something Wrong on Server");
				response.sendRedirect("Admin/editJob.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
