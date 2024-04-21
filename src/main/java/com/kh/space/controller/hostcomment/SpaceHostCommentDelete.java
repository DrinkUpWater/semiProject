package com.kh.space.controller.hostcomment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.space.service.SpaceCommentService;

/**
 * Servlet implementation class SpaceHostCommentDelete
 */
@WebServlet("/delete.ho")
public class SpaceHostCommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceHostCommentDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		int commentNo=Integer.parseInt(request.getParameter("commentNo"));
		
		int result=new SpaceCommentService().deleteHostComment(commentNo);
		
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
