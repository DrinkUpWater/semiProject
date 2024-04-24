package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.service.MemberService;
import com.kh.space.service.SpaceReservationService;

/**
 * Servlet implementation class MemberReservationCancel
 */
@WebServlet("/cancel.re")
public class MemberReservationCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReservationCancel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
		HttpSession s = request.getSession();
		int reservationNo=Integer.parseInt(request.getParameter("reservationNo"));
		
		int result=new SpaceReservationService().deleteReservation(reservationNo);
		
		if(result>0) {
			s.setAttribute("alertMsg", "예약취소되었습니다.");
			
		}else {
			s.setAttribute("alertMsg", "예약취소실패.");
		}
		response.sendRedirect(request.getContextPath()+"/reservation.me?cpage=1");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
