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
import com.kh.space.service.SpaceReviewService;

/**
 * Servlet implementation class SpaceReivewInsertController
 */
@WebServlet("/insert.re")
public class SpaceReivewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceReivewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		HttpSession session =request.getSession();
		Member m = (Member) session.getAttribute("loginUser");
		int spaceNum = Integer.parseInt(request.getParameter("spaceNum"));
		String content=request.getParameter("content");
		String reviewStars=request.getParameter("reviewStar");
	
		if (m == null) {
			new Gson().toJson("로그인하세요",response.getWriter());
			return;
		}

		else {
			
			
			if(reviewStars.equals("")) {
				new Gson().toJson("리뷰를 입력하세요",response.getWriter());
				return;
			}
			 int reviewStar=Integer.parseInt(reviewStars);
			 System.out.println(reviewStar);
		    

			int result = new SpaceReviewService().insertReviews(m.getUserNo() ,spaceNum,content,reviewStar);
			if(result<0) {
				new Gson().toJson("리뷰등록실패",response.getWriter());
			}
			else {
				new Gson().toJson("리뷰가 등록되었습니다.",response.getWriter());
			}
             
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
