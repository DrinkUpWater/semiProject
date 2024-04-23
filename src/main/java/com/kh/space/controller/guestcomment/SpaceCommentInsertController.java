package com.kh.space.controller.guestcomment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.member.model.vo.Member;

import com.kh.space.service.SpaceCommentService;

/**
 * Servlet implementation class SpaceCommentInsertController
 */
//@WebServlet("/coinsert.sp")
@WebServlet("/insert.gu")
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
	   response.setContentType("application/json; charset=utf-8");
	   HttpSession session=request.getSession();
		
	   Member member=(Member)session.getAttribute("loginUser");
	   if(member==null) {
		   new Gson().toJson("로그인을 먼저 해주세요",response.getWriter());
	   } 
	   else {
		   
		  // System.out.println(member);
		   int spaceNum=Integer.parseInt(request.getParameter("spaceNum"));
		   //System.out.println(spaceNum);
		   String content=request.getParameter("content");
		   int userNo=member.getUserNo();
		   int result=new SpaceCommentService().insertComment(spaceNum,content,userNo);
		   
		   if(result>0)
			   new Gson().toJson("QA가 등록되었습니다.",response.getWriter());
		   else
			   new Gson().toJson("QA가 등록실패",response.getWriter());
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
