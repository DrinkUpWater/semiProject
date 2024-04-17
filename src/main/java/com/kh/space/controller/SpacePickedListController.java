package com.kh.space.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.space.model.vo.Picked;
import com.kh.space.model.vo.Space;
import com.kh.space.service.SpacePickedService;

/**
 * Servlet implementation class SpacePickedListController
 */
@WebServlet("/pickedview.sp")
public class SpacePickedListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpacePickedListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    Member member=(Member)session.getAttribute("loginUser");
	    
	    int userNo=member.getUserNo();
	    
	    ArrayList<Space> pickdes=new SpacePickedService().findUserPicked(userNo);
	    
	    if(pickdes.isEmpty()) {
	    	response.sendRedirect(request.getContextPath());
	     }
	    else {
	    	request.setAttribute("pickeds", pickdes);
	    	request.getRequestDispatcher("views/space/spacePicked.jsp")
	    	.forward(request, response);
	    	
	    }
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}