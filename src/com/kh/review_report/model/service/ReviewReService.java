package com.kh.review_report.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.review_report.model.dao.ReviewReDao;
import com.kh.review_report.model.vo.ReviewReport;

public class ReviewReService {
	
	public int insertReviewRe(ReviewReport rp, int movieNo) {
		
		Connection conn = getConnection();
		int result = new ReviewReDao().insertReviewRe(conn, movieNo, rp);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

}
