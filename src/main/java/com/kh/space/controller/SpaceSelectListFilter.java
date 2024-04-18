package com.kh.space.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.kh.space.model.vo.Space;
import com.kh.space.service.SpaceService;

/**
 * Servlet implementation class SpaceSelectListPeopleCountController
 */
@WebServlet("/mainP.sp")
public class SpaceSelectListFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceSelectListFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Space> list = new ArrayList<>();
		String pInfo = request.getParameter("pInfo");
		
		if( request.getParameter("pCount") != "" && pInfo == "") {
			int pCount = Integer.parseInt(request.getParameter("pCount"));
			request.setAttribute("pCount", pCount);
			list = new SpaceService().selectSpaceList(pCount);
		} else if (request.getParameter("pCount") == "" && pInfo != "") {
			request.setAttribute("pInfo", pInfo);
			list = new SpaceService().selectSpaceList(pInfo);
		} else if (request.getParameter("pCount") != "" && pInfo != ""){
			int pCount = Integer.parseInt(request.getParameter("pCount"));
			list = new SpaceService().selectSpaceList(pInfo, pCount);
			request.setAttribute("pCount", pCount);
			request.setAttribute("pInfo", pInfo);
		} else {
			list = new SpaceService().selectSpaceList();
		}
		
		
		
		
		
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/common/mainPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
