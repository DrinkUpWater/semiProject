package com.kh.space.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.space.model.vo.Space;
import com.kh.space.service.SpaceService;

/**
 * Servlet implementation class SpaceSelectListController
 */
@WebServlet("/main.sp")
public class SpaceSelectListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceSelectListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//* listCount : 총 개시글 수
		int listCount = new SpaceService().selectListCount();
		
		//* currentPage : 현재 페이지(사용자가 요청한 페이지)
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		//* pageLimit : 페이징바의 최대갯수
		int pageLimit = 10;
		
		//*boardLimit : 한페이지에 보여질 게시글 최대개숫
		int boardLimit = 9;

		//가장 마지막 페이지(총 페이지의 수)
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		//페이징바의 시작수 
		int startPage = ((currentPage - 1) / pageLimit ) * pageLimit + 1;
		
		//페이징바의 마지막 끝수
		int endPage = startPage + pageLimit - 1;
		
		//startPage가 11이면 endPage는 20이다(만약 maxPage가 13이라면 endPage 13까지만 보여줘야한다
		endPage = endPage > maxPage ? maxPage : endPage;
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Space> list = new SpaceService().selectSpaceList(pi);
		
		request.setAttribute("pi", pi);
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
