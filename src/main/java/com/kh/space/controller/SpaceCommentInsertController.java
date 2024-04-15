package com.kh.space.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;

import com.kh.space.service.SpaceCommentService;

/**
 * Servlet implementation class SpaceCommentInsertController
 */
@WebServlet("/coinsert.sp")
public class SpaceCommentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceCommentInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   request.setCharacterEncoding("utf-8");
	   HttpSession session=request.getSession();
		
	   Member member=(Member)session.getAttribute("loginUser");
	   if(member==null) {
		   session.setAttribute("alertMsg", "로그인을 먼저 해주세요");
		   response.sendRedirect(request.getContextPath()+"/detailview.sp");
	   }
	   
	   else {
		   
		   System.out.println(member);
		   int spaceNum=Integer.parseInt(request.getParameter("spaceNum"));
		   System.out.println(spaceNum);
		   String content=request.getParameter("content");
		   int userNo=member.getUserNo();
		   int result=new SpaceCommentService().insertComment(spaceNum,content,userNo);
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
