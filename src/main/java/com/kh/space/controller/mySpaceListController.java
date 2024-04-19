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
import com.kh.space.model.dto.SpaceThumbNail;
import com.kh.space.model.vo.Space;
import com.kh.space.service.SpaceService;

/**
 * Servlet implementation class mySpaceListController
 */
@WebServlet("/myspace.sp")
public class mySpaceListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mySpaceListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	    HttpSession session=request.getSession();
    	Member m=(Member)session.getAttribute("loginUser");
    	if(m==null) {
    		session.setAttribute("alertMsg", "로그인하세요");
    		response.sendRedirect(request.getContextPath()+"/loginForm.me");
    		return;
    	}
 		int userNo=m.getUserNo();
		
		ArrayList<Space> mySpaces=new SpaceService().selectMySpaces(userNo);
		
		if(mySpaces.isEmpty()) {
			session.setAttribute("alertMsg", "등록한 공간이 없습니다.");
			response.sendRedirect(request.getContextPath());
		}
		else {
			request.setAttribute("mySpace",mySpaces);
			request.getRequestDispatcher("/views/space/mySpaceList.jsp").forward(request, response);
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
