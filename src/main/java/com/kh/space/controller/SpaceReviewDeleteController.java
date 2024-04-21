package com.kh.space.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.member.model.vo.Member;
import com.kh.space.service.SpaceReviewService;

/**
 * Servlet implementation class SpaceReviewDeleteController
 */
@WebServlet("/delete.re")
public class SpaceReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceReviewDeleteController() {
        super();
    
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		int reviewNo=Integer.parseInt(request.getParameter("reviewNo"));
		Member m =(Member)request.getSession().getAttribute("loginUser");
	
		
		if (m == null) {
			new Gson().toJson("로그인하세요",response.getWriter());
			return;
		}

		int userNo=m.getUserNo();
		int result=new SpaceReviewService().deleteReview(reviewNo,userNo);
		
		if(result<0) {
			new Gson().toJson("리뷰삭제실패",response.getWriter());
		}else {
			new Gson().toJson("리뷰가 삭제되었습니다.",response.getWriter());
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
