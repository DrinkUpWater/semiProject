package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;

/**
 * Servlet implementation class MemberPwdCheckController
 */
@WebServlet("/pwdCheck.me")
public class MemberPwdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId =request.getParameter("userId");
		String checkPwd =request.getParameter("oldPwd");
		System.out.println("1."+userId);
		System.out.println("2."+checkPwd);
		int result =new MemberService().pwdCheck(userId,checkPwd);
		if(result>0) { //비밀번호 중복일 때
			response.getWriter().print("NNNNY");
		}else {
			response.getWriter().print("NNNNN");
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
