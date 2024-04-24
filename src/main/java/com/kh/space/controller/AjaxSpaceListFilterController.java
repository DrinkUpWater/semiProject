package com.kh.space.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.common.PageInfo;
import com.kh.space.model.vo.Space;
import com.kh.space.service.SpaceService;

/**
 * Servlet implementation class SpaceListPcountController
 */
@WebServlet("/filteringSpace.sp")
public class AjaxSpaceListFilterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSpaceListFilterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int pCount = Integer.parseInt(request.getParameter("pCount"));
		String pInfo = request.getParameter("pInfo");
		String pKind = request.getParameter("pKind");
		String pOrder = request.getParameter("pOrder");
		
		//* listCount : 총 개시글 수
		int listCount = new SpaceService().selectListCountPaging(pCount, pInfo, pKind);
				
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
		
		
//		int pCount = Integer.parseInt(request.getParameter("pCount"));
//		String pInfo = request.getParameter("pInfo");
//		String pKind = request.getParameter("pKind");
//		String pOrder = request.getParameter("pOrder");
		
//		ArrayList<Space> list = new SpaceService().selectSpaceList(pInfo, pCount, pKind, pOrder);
		ArrayList<Space> list = new SpaceService().selectSpaceListPaging(pInfo, pCount, pKind, pOrder, pi);
		
		response.setContentType("application/json; charset=utf-8");
		
		Map<String, Object> data = new HashMap<>();
		data.put("list", list);
		data.put("pi", pi);
		
//		new Gson().toJson(list, response.getWriter());
		new Gson().toJson(data, response.getWriter());

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
