package com.databaseOperation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.databaseConnection.DatabaseConnection;
import com.entities.JobDetails;

public class AllJobRegardingOperation {

	public static int addJob(JobDetails jd) {
		Connection conn;
		int result = 0;

		conn = DatabaseConnection.getConnection();
		String s = " Insert into `job_details`(`Title`, `Location`, `Category`, `Status`, `Discription`) Values(?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, jd.getTitle());
			ps.setString(2, jd.getLocation());
			ps.setString(3, jd.getCatogory());
			ps.setString(4, jd.getStatus());
			ps.setString(5, jd.getDescription());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static List<JobDetails> viewAllJobs() {
		Connection conn;
		List<JobDetails> list = new ArrayList<JobDetails>();
		
		conn = DatabaseConnection.getConnection();
		String s = " Select * from `job_details` order by `Id` desc ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				JobDetails jd = new JobDetails();
				jd.setId(rs.getInt(1));
				jd.setTitle(rs.getString(2));
				jd.setLocation(rs.getString(3));
				jd.setCatogory(rs.getString(4));
				jd.setStatus(rs.getString(5));
				jd.setDescription(rs.getString(6));
				jd.setPdate(rs.getTimestamp(7) +"");
				list.add(jd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static JobDetails getJobById(int id) {
		Connection conn;
		JobDetails jd = null;
		conn = DatabaseConnection.getConnection();
		String s = " Select * from `job_details` Where `Id`=? ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				jd = new JobDetails();
				jd.setId(rs.getInt(1));
				jd.setTitle(rs.getString(2));
				jd.setLocation(rs.getString(3));
				jd.setCatogory(rs.getString(4));
				jd.setStatus(rs.getString(5));
				jd.setDescription(rs.getString(6));
				jd.setPdate(rs.getTimestamp(7) +"");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jd;
	}
	
	public static int editJob(JobDetails jd) {
		Connection conn;
		int result = 0;
		conn = DatabaseConnection.getConnection();
		String s = " Update `job_details`Set `Title`=?, `Location`=?, `Category`=?, `Status`=?, `Discription`=? Where `Id`=?";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, jd.getTitle());
			ps.setString(2, jd.getLocation());
			ps.setString(3, jd.getCatogory());
			ps.setString(4, jd.getStatus());
			
			ps.setString(5, jd.getDescription());
			
			ps.setInt(6, jd.getId());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static int deleteJob(int id) {
		Connection conn;
		int result = 0;
		conn = DatabaseConnection.getConnection();
		String s = " Delete from `job_details` Where `Id`=? ";
		try 
		{
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setInt(1, id);
			result=ps.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static List<JobDetails> viewAllJobsForUser() {
		Connection conn;
		List<JobDetails> list = new ArrayList<JobDetails>();
		
		conn = DatabaseConnection.getConnection();
		String s = " Select * from `job_details` Where `Status`=? order by `Id` desc ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				JobDetails jd = new JobDetails();
				jd.setId(rs.getInt(1));
				jd.setTitle(rs.getString(2));
				jd.setLocation(rs.getString(3));
				jd.setCatogory(rs.getString(4));
				jd.setStatus(rs.getString(5));
				jd.setDescription(rs.getString(6));
				jd.setPdate(rs.getTimestamp(7) +"");
				list.add(jd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	    public static List<JobDetails> viewJobsByLocOrCat(String location , String category) {
		Connection conn;
		List<JobDetails> list = new ArrayList<JobDetails>();
		JobDetails jd = null;
		conn = DatabaseConnection.getConnection();
		String s = " Select * from `job_details` Where `Location`=? or `Category`=? order by `Id` desc ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, location);
			ps.setString(2, category);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
			    jd = new JobDetails();
				jd.setId(rs.getInt(1));
				jd.setTitle(rs.getString(2));
				jd.setLocation(rs.getString(3));
				jd.setCatogory(rs.getString(4));
				jd.setStatus(rs.getString(5));
				jd.setDescription(rs.getString(6));
				jd.setPdate(rs.getTimestamp(7) +"");
				list.add(jd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
 
	    
	    public static List<JobDetails> viewJobsByLocAndCat(String location , String category) {
			Connection conn;
			List<JobDetails> list = new ArrayList<JobDetails>();
			JobDetails jd = null;
			conn = DatabaseConnection.getConnection();
			String s = " Select * from `job_details` Where `Location`=? And `Category`=? order by `Id` desc ";
			try {
				PreparedStatement ps = conn.prepareStatement(s);
				ps.setString(1, location);
				ps.setString(2, category);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					jd = new JobDetails();
					jd.setId(rs.getInt(1));
					jd.setTitle(rs.getString(2));
					jd.setLocation(rs.getString(3));
					jd.setCatogory(rs.getString(4));
					jd.setStatus(rs.getString(5));
					jd.setDescription(rs.getString(6));
					jd.setPdate(rs.getTimestamp(7) +"");
					list.add(jd);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}

}
