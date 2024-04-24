package com.kh.space.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.space.model.vo.Space;
import com.kh.space.service.SpaceService;

/**
 * Servlet implementation class SpaceUpdateController
 */
@WebServlet("/updateForm.sp")
public class SpaceUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession s = request.getSession();
		int spaceNum= Integer.parseInt(request.getParameter("spaceNum"));   
		
		
		Space sp = new SpaceService().selectOneSpace(spaceNum);
		if(sp==null) {
			s.setAttribute("alertMsg", "공간이 없습니다.");
			response.sendRedirect(request.getContextPath()+"/myspacedetail.sp?spaceNo="+spaceNum);
			
		}else {
			request.setAttribute("sp", sp);
			request.getRequestDispatcher("views/host/hostUpdateForm.jsp")
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
