package com.kh.space.controller.picked;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.member.model.vo.Member;
import com.kh.space.model.vo.Picked;
import com.kh.space.model.vo.Space;
import com.kh.space.service.SpacePickedService;

/**
 * Servlet implementation class SpacePickedViewController
 */
@WebServlet("/pickedcheck.sp")//비동기 처리
public class SpacePickedCheckViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private  SpacePickedService service =new SpacePickedService();
    
    
    public SpacePickedCheckViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");

		if (member == null) {
			new Gson().toJson("로그인하세요", response.getWriter());
		} else {

			int spaceNo = Integer.parseInt(request.getParameter("spaceNum"));

			int count = new SpacePickedService().findUserPicked(member.getUserNo(), spaceNo);

			if (count == 0) {
				new Gson().toJson("찜하기", response.getWriter());
			} else {

				new Gson().toJson("찜해제", response.getWriter());
			}
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
