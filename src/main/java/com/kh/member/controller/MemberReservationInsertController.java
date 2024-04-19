package com.kh.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.space.model.vo.Reservation;
import com.kh.space.model.vo.ReservationDate;
import com.kh.space.service.SpaceReservationService;

/**
 * Servlet implementation class MemberReservationInsertController
 */
@WebServlet("/reservationInsert.me")
public class MemberReservationInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReservationInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     request.setCharacterEncoding("utf-8");
	     HttpSession session =request.getSession();
	     Member m =(Member)session.getAttribute("loginUser");
		 if(m==null) {
			 session.setAttribute("alertMsg", "로그인 하세요");
			 response.sendRedirect(request.getContextPath()+"/loginForm.me");
		 }
		 else {
		
			 System.out.println(request.getParameter("spaceNum"));
			 System.out.println(request.getParameter("count"));
			 System.out.println(request.getParameter("payment"));
			 System.out.println(request.getParameter("date"));
			 System.out.println(request.getParameterValues("times[]"));
			 
			 
			 int spaceNum= Integer.parseInt(request.getParameter("spaceNum"));
			 
			 int userNo=m.getUserNo();
			 int headCount=Integer.parseInt(request.getParameter("count"));
			 int price=Integer.parseInt(request.getParameter("payment"));
			 
			 Reservation reservation = new Reservation();
			 reservation.setHeadCount(headCount);
			 reservation.setTotalPrice(price);
			 reservation.setUserNo(userNo);
			 reservation.setSpaceNo(spaceNum);
			 
			//날짜 시간
			 String date = request.getParameter("date");
			 String []times =request.getParameterValues("times[]");
			 int time1=Integer.parseInt(times[0]);
			 int time2=Integer.parseInt(times[1]);
			 
			 ReservationDate reservationDate =new ReservationDate();
			 reservationDate.setReservationDate(Date.valueOf(date));
			 reservationDate.setTime1(time1);
			 reservationDate.setTime2(time2);
		     //currval
			 
	         int result=new SpaceReservationService().insertReservation(reservation,reservationDate);
	         
	         if(result>0) {
	        	 session.setAttribute("alertMsg","예약되셨습니다." );
	        	 response.sendRedirect(request.getContextPath()+"/reservation.me?cpage=1");
	         }
	         else {
	        	 session.setAttribute("alertMsg","예약실패" );
	        	 response.sendRedirect(request.getContextPath()+"/detailview.sp?spaceNo="+spaceNum);
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
