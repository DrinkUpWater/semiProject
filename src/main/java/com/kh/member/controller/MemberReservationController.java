package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.vo.PageInfo;
import com.kh.space.model.vo.Reservation;
import com.kh.space.model.vo.Space;
import com.kh.space.service.SpaceReservationService;

/**
 * Servlet implementation class MemberReservationController
 */
@WebServlet("/reservation.me")
public class MemberReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReservationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int listCount; //현재 총 게시글 수
		int currentPage; //현재 페이지(사용자가 요청한 페이지)
		int pageLimit; //페이지 하단에 보여질 페이징바의 페이지 최대개水
		int boardLimit; // 한 페이지내에 보여질 게시글 최대갯수

		int maxPage; // 가장 마지막페이지(총 페이지의 수)
		int startPage; // 페이징바의 시작수
		int endPage; //페이징바의 마지막 끝 수
		
		String userId = request.getParameter("userId");
		System.out.println(userId);
		listCount = new SpaceReservationService().selectReservationCount(userId);
		System.out.println(listCount);
		currentPage =Integer.parseInt(request.getParameter("cpage"));		
		pageLimit = 10;	
		boardLimit = 10;
		
		 maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1; 

		
		endPage = startPage + pageLimit - 1;		
		endPage = endPage > maxPage ? maxPage : endPage;
		
		PageInfo pi =new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Reservation> list =new SpaceReservationService().selectReservation(pi);
		System.out.println(list);
		request.getRequestDispatcher("views/member/Reservation_Member_hamyu.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
