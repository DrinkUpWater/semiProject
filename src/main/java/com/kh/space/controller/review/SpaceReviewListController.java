package com.kh.space.controller.review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.member.model.vo.Member;
import com.kh.space.model.vo.Review;
import com.kh.space.service.SpaceReservationService;
import com.kh.space.service.SpaceReviewService;

/**
 * Servlet implementation class SpaceReviewListController
 */
@WebServlet("/review.sp")
public class SpaceReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =request.getSession();
	//	Member m = (Member)session.getAttribute("loginUser");
		int spaceNum=Integer.parseInt(request.getParameter("spaceNum"));
		System.out.println(spaceNum);
//		if(m==null) {
//		  // response.sendRedirect(request.getContextPath()+"/detailview?spaceNo="+spaceNum);
//			session.setAttribute("alertMsg","로그인해주세요");
//		    return;
//		}
//		
		 
	
			response.setContentType("application/json; charset=utf-8");
			ArrayList<Review> reviews = new SpaceReviewService().selectReviews(spaceNum);
			System.out.println(reviews);
			new Gson().toJson(reviews,response.getWriter());
			
			//ArrayList<Review> reviews = new ArrayList<>()
			
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
