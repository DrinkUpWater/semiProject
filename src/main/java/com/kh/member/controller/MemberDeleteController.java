package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.service.MemberService;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		int userNo =Integer.parseInt(request.getParameter("userNo"));
		int result = new MemberService().deleteMember(userId,userNo);
		HttpSession session = request.getSession();
		System.out.println(result);
		if(result>0) {
			session.setAttribute("alertMsg", "회원이 성공적으로 탈퇴되셨습니다. 이용해주셔서 감사합니다.");
			session.removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
		}else {
			session.setAttribute("alert", "회원탈퇴에 실패했습니다.");
			request.getRequestDispatcher("views/member/SecessionMember_hamyu.jsp").forward(request, response);
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
