package com.kh.space.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class spacePickedController
 */
@WebServlet("/picked.sp")
public class SpacePickedController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    
    public SpacePickedController() {
        super();


    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		
		//찜한 리스트에 추가
		int spaceNum=Integer.parseInt(request.getParameter("spaceNum"));
		
		//이미 찜 되있으면 
		 //이미 찜 하셨습니다.
		
		//찜 안되있으면 
		  // 찜 되었습니다.
		
		request.getSession().setAttribute("pickedMsg", "찜되었습니다.");
		response.sendRedirect(request.getContextPath()+"/detailview.sp");
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
