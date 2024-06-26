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
		response.setContentType("application/json; charset=utf-8");

		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginUser");
		int result=0;

		if (m == null) {
			new Gson().toJson("로그인하세요", response.getWriter());
		}

		else {
			
			int spaceNum=Integer.parseInt(request.getParameter("spaceNum"));
			int userNo=m.getUserNo();
			
			//찜한 리스트에 추가
		
			
			//찜한 리스트 확인
			
			Picked picked=service.selectOnePicked(spaceNum,userNo);

			String check="";
			if(picked==null) {
				 result=service.insertPicked(spaceNum,userNo);
				 
				 if(result>0) {
					check="찜해제";
				 }else {
					check="찜하기";
				 }
				 
			}
			else {
				 result=service.deletePicked(spaceNum,userNo);
				 
				 if(result>0) {
						check="찜하기";
					 }else {
						 check="찜해제";
				 }
					 
			}
			
			 new Gson().toJson(check,response.getWriter());
			 
				
			
				
		}
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
