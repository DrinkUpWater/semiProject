package com.kh.space.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.space.service.SpaceDeleteService;

/**
 * Servlet implementation class SpaceDeleteController
 */
@WebServlet("/delete.sp")
public class SpaceDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int spaceNum=Integer.parseInt(request.getParameter("spaceNum"));        
		int userNo=((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		int result=new SpaceDeleteService().spaceDelete(spaceNum,userNo);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "등록취소되었습니다.");
			response.sendRedirect(request.getContextPath()+"/main.ho");
			
		}
		else {
			request.getSession().setAttribute("alertMsg", "취소실패");
			response.sendRedirect(request.getContextPath());
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
