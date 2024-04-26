package com.kh.space.test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.space.test.Comment;

/**
 * Servlet implementation class AjaxHostCommentInsert
 */
@WebServlet("/hostComment.bo")
public class AjaxHostCommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxHostCommentInsert() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String spaceNum=request.getParameter("spaceNum");
		int commentNum= Integer.parseInt(request.getParameter("commentNum"));      
		String hostReply=request.getParameter("hostReply");
		
		HostComment hostComment=new HostComment(hostReply,commentNum);
		
		
		for(Comment c:CommentList.datas) {
			if(c.getCommentNo()==commentNum) {
				c.setHostReply(hostReply);
				break;
			}
		}
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
