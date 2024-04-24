package com.kh.space.controller.hostcomment;

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
 * Servlet implementation class SpaceHostCommentInsert
 */
@WebServlet("/insert.ho")
public class SpaceHostCommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceHostCommentInsert() {
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
		Member member= (Member)session.getAttribute("loginUser");
		if(member==null) {
			new Gson().toJson("로그인하세요",response.getWriter());
			
		}else {
			int commentNo=Integer.parseInt(request.getParameter("commentNo"));
			String hostReply=request.getParameter("hostReply");
			
			
			
			
			if(hostReply==null) {
				hostReply="";
			}
			
			int result=0;
			int count=new SpaceCommentService().findHostComment(commentNo);
			
			
			if(count==0) {
				 result=new SpaceCommentService().insertHostComment(commentNo,hostReply);
			}else {
				 result=new SpaceCommentService().updateHostComment(commentNo,hostReply);
			}
		
			
			if(result<0) {
				new Gson().toJson("답글등록실패",response.getWriter());
			}
			else {
				new Gson().toJson("답글이 등록되었습니다.",response.getWriter());
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
