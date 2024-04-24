package com.kh.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;

/**
 * Servlet Filter implementation class LoginFiler
 */
@WebFilter(urlPatterns= {"/detailview.sp","/myspace.sp","/pickedview.sp","/review.sp"})
public class LoginFiler implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFiler() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest= (HttpServletRequest)request;
		HttpServletResponse httpResponse= (HttpServletResponse) response;
		
		HttpSession session=httpRequest.getSession();
		
		Member member=(Member) session.getAttribute("loginUser");
		if( member==null) {
			session.setAttribute("alertMsg","로그인을 먼저 해주세요" );
			httpResponse.sendRedirect(httpRequest.getContextPath());
		}
		else {
			chain.doFilter(request, response);
		}
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
