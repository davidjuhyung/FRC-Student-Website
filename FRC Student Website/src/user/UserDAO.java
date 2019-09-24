package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DatabaseUtil;

public class UserDAO {

	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM user WHERE userID = ?";
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			myConn = DatabaseUtil.getConnection();
			pstmt = myConn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery(); //when you look for something in database
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // Login
				} else {
					return 0; // Login Failed due to wrong password
				}
			}
			return -1; // Login Failed due to wrong ID
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (myConn != null) myConn.close();} catch (Exception e) {e.printStackTrace();}
			try {if (pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if (rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -2; // Database Error
	}

	public int signUp(UserDTO user) {
		String SQL = "INSERT INTO user VALUES(?, ?, ?, ?, false)";
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			myConn = DatabaseUtil.getConnection();
			pstmt = myConn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserEmailHash());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (myConn != null) myConn.close();} catch (Exception e) {e.printStackTrace();}
			try {if (pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if (rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1; // Database Error
	}

	public boolean getUserEmailChecked(String userID) {
		String SQL = "SELECT userEmailChecked FROM user WHERE userID = ?";
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			myConn = DatabaseUtil.getConnection();
			pstmt = myConn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getBoolean(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (myConn != null) myConn.close();} catch (Exception e) {e.printStackTrace();}
			try {if (pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if (rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return false; // Database Error
	}

	public boolean setUserEmailChecked(String userID) {
		String SQL = "UPDATE user SET userEmailChecked = true WHERE userID = ?";
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			myConn = DatabaseUtil.getConnection();
			pstmt = myConn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (myConn != null) myConn.close();} catch (Exception e) {e.printStackTrace();}
			try {if (pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if (rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return false; // Database Error
	}

	public String getUserEmail(String userID) {
		String SQL = "SELECT userEmail FROM user WHERE userID = ?";
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			myConn = DatabaseUtil.getConnection();
			pstmt = myConn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (myConn != null) myConn.close();} catch (Exception e) {e.printStackTrace();}
			try {if (pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if (rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return null; // Database Error
	}
	
}
