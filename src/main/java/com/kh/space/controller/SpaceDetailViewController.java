package com.kh.space.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.Attachment;
import com.kh.space.model.vo.Space;
import com.kh.space.service.SpaceService;

/**
 * Servlet implementation class spaceDetailViewController
 */
@WebServlet("/detailview.sp")
public class SpaceDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int spaceNo = Integer.parseInt(request.getParameter("spaceNo"));  
		Space space=new SpaceService().selectOneSpace(spaceNo);
		ArrayList<Attachment> attachments =new SpaceService().selectSpaceAttachment(spaceNo);
		
		if(attachments.isEmpty()) {
			 Attachment att=new Attachment();
			 att.setFilePath("");
			attachments.add(att);
		}
		
	
		if(space==null) {
			request.getSession().setAttribute("alertMsg","공간조회실패");
			response.sendRedirect(request.getContextPath());
			
		}else {
			request.setAttribute("space", space);
			request.setAttribute("spaceKind", "spaces");
			request.setAttribute("attachments", attachments);
			
			request.getRequestDispatcher("views/space/spaceDetail.jsp")
			.forward(request, response);
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
