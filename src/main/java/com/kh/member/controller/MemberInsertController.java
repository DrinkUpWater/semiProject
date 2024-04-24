package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.member.service.MemberService;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId =request.getParameter("userId");
		String userPwd =request.getParameter("userPwd");
		String userName =request.getParameter("userName");
		String nickName =request.getParameter("nickName");
		String gender =request.getParameter("gender");
		String phone =request.getParameter("phone");
		String birth =request.getParameter("birth");
		String email = request.getParameter("email") + "@" + request.getParameter("select-email");
		String userHost = request.getParameter("userHost");
		

		
		Member m = new Member(userId,userPwd,userName,nickName,gender,phone,birth,email,userHost);
		System.out.println(m);
		int result = new MemberService().insertMember(m);
		
		if (result > 0) {
		    request.getSession().setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다.");
		    response.sendRedirect(request.getContextPath()); // 메인 페이지로 리디렉션
		} else {
		    request.getSession().setAttribute("alertMsg", "회원가입에 실패했습니다.");
		    response.sendRedirect(request.getContextPath()+"/enrollForm.me"); // 회원 가입 페이지로 리디렉션
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
