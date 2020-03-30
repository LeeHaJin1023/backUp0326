package com.kh.review_report.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;

import com.kh.review_report.model.vo.ReviewReport;

public class ReviewReDao {

	private Properties prop = new Properties();
	
	public ReviewReDao() {
		String fileName = ReviewReDao.class.getResource("/sql/review_report/reivew_report-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertReviewRe(Connection conn, int movieNo, ReviewReport rp) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReportRe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,rp.getReviewNo());
			pstmt.setInt(2, rp.getMemberNo());
			pstmt.setString(3,rp.getContent());
			pstmt.setString(4, rp.getReportType());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
