package com.kh.space.controller.picked;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.member.model.vo.Member;
import com.kh.space.model.vo.Picked;
import com.kh.space.service.SpacePickedService;

/**
 * Servlet implementation class SpacePickedViewController
 */
@WebServlet("/pickedcheck.sp")//비동기 처리
public class SpacePickedViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private  SpacePickedService service =new SpacePickedService();
    
    
    public SpacePickedViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    HttpSession session =request.getSession();
		   // request.setCharacterEncoding("utf-8");
			response.setContentType("application/json; charset=utf-8");
			
			
			int spaceNum=Integer.parseInt(request.getParameter("spaceNum"));
			
			Member m=(Member)session.getAttribute("loginUser");
			int result=0;
			
			if(m==null) {//필터 줄것
				
				//session.setAttribute("alertMsg", "로그인하세요");
				
				new Gson().toJson("찜하기",response.getWriter());
				
			}
			else {
				int userNo=m.getUserNo();
				Picked picked=service.selectOnePicked(spaceNum,userNo);
			
				
				String check="";
				if(picked==null) {
					check="찜하기";
				}
				else {

					check="찜해제";
					
				}
				
				 new Gson().toJson(check,response.getWriter());
				 
				
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
