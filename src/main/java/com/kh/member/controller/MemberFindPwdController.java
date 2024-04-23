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
 * Servlet implementation class MemberFindPwdController
 */
@WebServlet("/findPwd.me")
public class MemberFindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String phone = request.getParameter("phone");
		if(phone.contains("-")) { //만약 -가 포함되어있을시
			phone = phone.replace("-", "");
		}		
		String email = request.getParameter("email");		
	
		String findPwd= new MemberService().findPwd(userId,phone,email);
		if(findPwd == null) {
			 request.getSession().setAttribute("alertMsg", "비밀번호 찾기에 실패했습니다. 다시 확인 후 입력해주세요.");
			 response.sendRedirect(request.getContextPath()+"/findPwdForm");
		}else {
			 request.getSession().setAttribute("findPwd", findPwd);
			 response.sendRedirect(request.getContextPath()+"/findPwdForm");
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
