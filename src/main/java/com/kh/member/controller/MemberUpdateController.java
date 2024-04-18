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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String oldPwd = request.getParameter("oldPwd");
		String newPwd = request.getParameter("userPwd"); //변경된 패스워드
		String nickName = request.getParameter("nickName");
		String phone =request.getParameter("phone");
		phone = phone.replace("-", "");
		
		String birth =request.getParameter("birth");
		String email =request.getParameter("email")+"@"+request.getParameter("select-email");
		
		System.out.println(userId+","+oldPwd +","+newPwd+","+ nickName +","+phone+","+ birth +","+email);
		
		Member m = new Member(userId,nickName,phone,birth,email);
		if(oldPwd == "") { //비밀번호변경(버튼) 클릭안하고 수정할시
			Member updateMem = new MemberService().updateMember(m);
			System.out.println("상태:"+updateMem);
			if(updateMem == null) { //실패시
				request.getSession().setAttribute("alertMsg", "회원정보 수정에 실패했습니다.");
				 response.sendRedirect(request.getContextPath()+"/editInfo.me");
			}else { //성공시
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", updateMem);
				session.setAttribute("alertMsg", "성공적으로 수정하였습니다.");
				response.sendRedirect(request.getContextPath()+"/myPage.me");
			}
		}else { //비밀번호변경(버튼) 클릭하고 수정할 시
			Member updateMem = new MemberService().updatePwdMember(m,oldPwd,newPwd);
			if(updateMem ==null) {
				request.getSession().setAttribute("alertMsg", "회원정보 수정에 실패했습니다.");
				 response.sendRedirect(request.getContextPath()+"/editInfo.me");
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", updateMem);
				session.setAttribute("alertMsg", "성공적으로 수정하였습니다.");
				response.sendRedirect(request.getContextPath()+"/myPage.me");
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
