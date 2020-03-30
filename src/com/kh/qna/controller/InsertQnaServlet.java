package com.kh.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.qna.model.service.QnaService;
import com.kh.qna.model.vo.Qna;

/**
 * Servlet implementation class InsertQnaServlet
 */
@WebServlet("/insertQna.qa")
public class InsertQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Integer loginUserNo = 0;
		
		if((Member)session.getAttribute("loginUser")==null) {
			loginUserNo = 1;
		}else {
			loginUserNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		}
		
		
		String type = request.getParameter("type");
		
	
		String typeValue = "";
		
		switch(type) {
			case "1" : typeValue = "영화"; break;
			case "2" : typeValue = "예매/결제"; break;
			case "3" : typeValue = "홈페이지/모바일";  break;
			
		};
		
		
		
		String kind = request.getParameter("kind");
		
		String kindValue = "";
		switch(kind) {
			case "1" : kindValue = "건의"; break;
			case "2" : kindValue = "문의"; break;
			case "3" : kindValue = "칭찬";  break;
			case "4" : kindValue = "불만";  break;
		};
		
		
		
		String secret = request.getParameter("secret");
		String secretPwd = request.getParameter("secretPwd");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Qna q = new Qna();
		q.setType(typeValue);
		q.setKind(kindValue);
		q.setSecretStatus(secret);
		q.setSecretPwd(secretPwd);
		q.setTitle(title);
		q.setContent(content);
		
		int result = new QnaService().insertQna(q, loginUserNo);
		
		if(result > 0) {
			response.sendRedirect("qnaList.qa");
		}else {
			request.setAttribute("msg","게시판 작성 실패");
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
