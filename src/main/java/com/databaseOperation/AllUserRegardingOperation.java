package com.databaseOperation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.databaseConnection.DatabaseConnection;
import com.entities.UserDetails;

public class AllUserRegardingOperation {

	public static int addUser(UserDetails ud) {
		Connection conn = null;
		int result = 0;

		conn = DatabaseConnection.getConnection();

		String s = " Insert into `user_details`(`FullName`, `Qualification`, `Email`, `Password`) Values(?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, ud.getName());
			ps.setString(2, ud.getQualification());
			ps.setString(3, ud.getEmail());
			ps.setString(4, ud.getPassword());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static UserDetails loginUser(String email, String pass) {
		Connection conn = null;
		UserDetails ud = null;
		conn = DatabaseConnection.getConnection();

		String s = " Select * from `user_details` where `Email`=? and `Password`=?";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ud = new UserDetails();
				ud.setId(rs.getInt(1));
				ud.setName(rs.getString(2));
				ud.setQualification(rs.getString(3));
				ud.setEmail(rs.getString(4));
				ud.setPassword(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ud;
	}

	public static UserDetails getUserById(int id) {
		Connection conn = null;
		UserDetails ud = null;
		conn = DatabaseConnection.getConnection();

		String s = " Select * from `user_details` where `Id`=? ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ud = new UserDetails();
				ud.setId(rs.getInt(1));
				ud.setName(rs.getString(2));
				ud.setQualification(rs.getString(3));
				ud.setEmail(rs.getString(4));
				ud.setPassword(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ud;
	}

	public static int editUser(UserDetails ud) {

		Connection conn = null;
		conn = DatabaseConnection.getConnection();
		int result = 0;
		String s = " Update `user_details` set `FullName`=?, `Qualification`=?, `Email`=?, `Password`=? where `Id`=?";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, ud.getName());
			ps.setString(2, ud.getQualification());
			ps.setString(3, ud.getEmail());
			ps.setString(4, ud.getPassword());
			ps.setInt(5, ud.getId());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
