package evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class EvaluationDAO {

	public int write(EvaluationDTO evaluationDTO) {
		String SQL = "INSERT INTO evaluation VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			myConn = DatabaseUtil.getConnection();

			pstmt = myConn.prepareStatement(SQL);

			pstmt.setString(1, evaluationDTO.getUserID().replaceAll("<", "&lt;").replaceAll(">", " &gt;").replaceAll("\r\n", "<br>"));

			pstmt.setString(2, evaluationDTO.getCourseName().replaceAll("<", "&lt;").replaceAll(">", " &gt;").replaceAll("\r\n", "<br>"));

			pstmt.setString(3, evaluationDTO.getTeacherName().replaceAll("<", "&lt;").replaceAll(">", " &gt;").replaceAll("\r\n", "<br>"));

			pstmt.setInt(4, evaluationDTO.getCourseYear());

			pstmt.setString(5, evaluationDTO.getSemesterDivide().replaceAll("<", "&lt;").replaceAll(">", " &gt;").replaceAll("\r\n", "<br>"));

			pstmt.setString(6, evaluationDTO.getGradeDivide().replaceAll("<", "&lt;").replaceAll(">", " &gt;").replaceAll("\r\n", "<br>"));

			pstmt.setString(7, evaluationDTO.getEvaluationTitle().replaceAll("<", "&lt;").replaceAll(">", " &gt;").replaceAll("\r\n", "<br>"));

			pstmt.setString(8, evaluationDTO.getEvaluationContent().replaceAll("<", "&lt;").replaceAll(">", " &gt;").replaceAll("\r\n", "<br>"));

			pstmt.setString(9, evaluationDTO.getTotalScore().replaceAll("<", "&lt;").replaceAll(">", " &gt;").replaceAll("\r\n", "<br>"));

			pstmt.setString(10, evaluationDTO.getUseful().replaceAll("<", "&lt;").replaceAll(">", " &gt;").replaceAll("\r\n", "<br>"));

			pstmt.setString(11, evaluationDTO.getInteresting().replaceAll("<", "&lt;").replaceAll(">", " &gt;").replaceAll("\r\n", "<br>"));

			pstmt.setString(12, evaluationDTO.getEasy().replaceAll("<", "&lt;").replaceAll(">", " &gt;").replaceAll("\r\n", "<br>"));

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (myConn != null)
					myConn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // Database Error

	}

	public ArrayList<EvaluationDTO> getList(String gradeDivide, String searchType, String search, int pageNumber) {

		if (gradeDivide.equals("All")) {

			gradeDivide = "";
		}

		ArrayList<EvaluationDTO> evaluationList = null;

		String SQL = "";

		Connection myConn = null;

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		try {

			if (searchType.equals("Newest")) {

				SQL = "SELECT * FROM evaluation WHERE gradeDivide LIKE ? AND CONCAT(courseName, teacherName, evaluationTitle, evaluationContent) LIKE " +
						"? ORDER BY evaluationID DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;

			}
			else if (searchType.equals("Most Useful")) {

				SQL = "SELECT * FROM evaluation WHERE gradeDivide LIKE ? AND CONCAT(courseName, teacherName, evaluationTitle, evaluationContent) LIKE " +
						"? ORDER BY likeCount DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;

			}

			myConn = DatabaseUtil.getConnection();

			pstmt = myConn.prepareStatement(SQL);

			pstmt.setString(1, "%" + gradeDivide + "%");

			pstmt.setString(2, "%" + search + "%");

			rs = pstmt.executeQuery();

			evaluationList = new ArrayList<EvaluationDTO>();

			while (rs.next()) {

				EvaluationDTO evaluation = new EvaluationDTO(

						rs.getInt(1),

						rs.getString(2),

						rs.getString(3),

						rs.getString(4),

						rs.getInt(5),

						rs.getString(6),

						rs.getString(7),

						rs.getString(8),

						rs.getString(9),

						rs.getString(10),

						rs.getString(11),

						rs.getString(12),

						rs.getString(13),

						rs.getInt(14)

				);

				evaluationList.add(evaluation);

			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try { if (myConn != null) myConn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }

		}
		
		return evaluationList;

	}
	
	public int like(String evaluationID) {
		String SQL = "UPDATE evaluation SET likeCount = likeCount + 1 WHERE evaluationID = ?";
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			myConn = DatabaseUtil.getConnection();
			pstmt = myConn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
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
	
	public int delete(String evaluationID) {
		String SQL = "DELETE FROM evaluation WHERE evaluationID = ?";
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			myConn = DatabaseUtil.getConnection();
			pstmt = myConn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
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

	public String getUserID(String evaluationID) {
		String SQL = "SELECT userID FROM evaluation WHERE evaluationID = ?";
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			myConn = DatabaseUtil.getConnection();
			pstmt = myConn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
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