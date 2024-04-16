package com.kh.space.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SpaceEnrollController
 */
@WebServlet("/spaceEnroll.sp")
public class SpaceEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String spaceName = request.getParameter("spaceName");
		String[] spaceKind = request.getParameterValues("spaceKind");
		String spaceOneIntroduce = request.getParameter("spaceOneIntroduce");
		String spaceIntroduce = request.getParameter("spaceIntroduce");
		String spaceTag = request.getParameter("spaceTag");
		String spaceInformation = request.getParameter("spaceInformation");
		String spaceCaution = request.getParameter("spaceCaution");
		
		String spaceAddress = request.getParameter("spaceAddress");
		String spaceDetailAddress = request.getParameter("spaceDetailAddress");
		String spacePrice = request.getParameter("spacePrice");
		String spaceLocation = request.getParameter("spaceLocation");
		String spaceTel = request.getParameter("spaceTel");
		String spaceCapacity = request.getParameter("spaceCapacity");
		
		String spaceMimg = request.getParameter("spaceMimg");
		String spaceImg = request.getParameter("spaceImg");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
