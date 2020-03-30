package com.kh.review_report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.review_report.model.service.ReviewReService;
import com.kh.review_report.model.vo.ReviewReport;

/**
 * Servlet implementation class ReviewReportServlet
 */
@WebServlet("/reviewRe.re")
public class ReviewReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		int loginUserNo = 0;
		
		if((Member)session.getAttribute("loginUser") == null) {
			loginUserNo =1;
		}else {
			loginUserNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		}
		
		
		String reviewId = request.getParameter("reviewId");
		String reviewContent = request.getParameter("reviewContent");
		String reviewRe = request.getParameter("reviewRe");
		String reviewRep = "";
		String reviewNo = request.getParameter("reviewNo");
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		
		switch(reviewRe) {
			case "1" : reviewRep = "스포일러"; break;
			case "2" : reviewRep = "광고성 발언"; break;
			case "3" : reviewRep = "부적절한 언어행동"; break;
		}
		ReviewReport rp = new ReviewReport(Integer.parseInt(reviewNo),loginUserNo,reviewContent,reviewRep);
		
		int result = new ReviewReService().insertReviewRe(rp,movieNo);
	
		if(result > 0) {
			response.sendRedirect("movieDetail.mo?movieNo=" + movieNo);
		} else {
			request.setAttribute("msg", "게시판 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
