package com.kh.space.controller.guestcomment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.member.model.vo.Member;
import com.kh.space.service.SpaceCommentService;

/**
 * Servlet implementation class SpaceDeleteCommentController
 */
@WebServlet("/delete.gu")
public class SpaceDeleteCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceDeleteCommentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		Member m=(Member)request.getSession().getAttribute("loginUser");
		if(m==null) {
			new Gson().toJson("로그인하세요",response.getWriter());
		}
		
		int commentNo=Integer.parseInt(request.getParameter("commentNo"));
		int userNo=((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		int result=new SpaceCommentService().deleteGuestComment(commentNo,userNo);
		
		if(result>0) {
			new Gson().toJson("삭제되었습니다.",response.getWriter());
		}else {
			new Gson().toJson("삭제실패",response.getWriter());
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
