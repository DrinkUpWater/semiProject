package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.member.service.MemberService;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/login.me")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		String saveId =request.getParameter("saveId");
		if (loginUser == null) {

			request.getSession().setAttribute("alertMsg", "로그인에 실패하였습니다.");
			//응답페이지에게 위임
			response.sendRedirect(request.getContextPath()+"/loginForm.me");// <-  request.getContextPath()/loginForm.me

			
		}else {
			Cookie ck =new Cookie("saveId",loginUser.getUserId());
			if(saveId == null) {
				ck.setMaxAge(0);
			}
			response.addCookie(ck);
			request.getSession().setAttribute("loginUser", loginUser);

			response.sendRedirect(request.getContextPath()); //request.getContextPath()

			
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
