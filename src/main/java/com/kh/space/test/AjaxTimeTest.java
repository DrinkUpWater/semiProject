package com.kh.space.test;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;







/**
 * Servlet implementation class AjaxTest
 */
@WebServlet( "/timetest.sp" )
public class AjaxTimeTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTimeTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String date=request.getParameter("date");
		ArrayList<Integer> list =new ArrayList<>();
		if(date.equals("2024-04-11")) {
			list.add(9);
			list.add(10);
			list.add(15);
			list.add(16);
			
		}
		else {
			list.add(11);
			list.add(12);
			list.add(17);
			list.add(18);
		}
		System.out.println(date);
	
	
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
