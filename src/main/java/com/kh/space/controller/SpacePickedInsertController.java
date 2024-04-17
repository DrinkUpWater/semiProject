package com.kh.space.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.space.model.vo.Picked;
import com.kh.space.service.SpacePickedService;

/**
 * Servlet implementation class spacePickedController
 */
@WebServlet("/picked.sp")
public class SpacePickedInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private  SpacePickedService service =new SpacePickedService();
	
    
    public SpacePickedInsertController() {
        super();


    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
		HttpSession session =request.getSession();
		
		int spaceNum=Integer.parseInt(request.getParameter("spaceNum"));
	
		Member m=(Member)session.getAttribute("loginUser");
		int result=0;
		
		if(m==null) {//필터 줄것
			
			session.setAttribute("alertMsg", "로그인하세요");
			response.sendRedirect(request.getContextPath()+"/detailview.sp");
			return;
		}
		
		else {
			int userNo=m.getUserNo();
			
			//찜한 리스트에 추가
		
			
			//찜한 리스트 확인
			
			Picked picked=service.selectOnePicked(spaceNum,userNo);
			
			
			if(picked==null) {
				 result=service.insertPicked(spaceNum,userNo);
				 session.setAttribute("picked", "찜해제");
				 request.getSession().setAttribute("pickedMsg", "찜되었습니다.");

			}
			else {
				 result=service.deletePicked(spaceNum,userNo);
				 session.setAttribute("picked", "찜하기");
				 request.getSession().setAttribute("pickedMsg", "찜해제되었습니다.");
			}
			
		    response.sendRedirect(request.getContextPath()+"/detailview.sp");
		}
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
