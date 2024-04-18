package com.kh.space.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.Attachment;
import com.kh.common.MyFileRenamePolicy;
import com.kh.space.model.vo.Space;
import com.kh.space.service.SpaceService;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class SpaceEnrollController
 */
@WebServlet("/spaceEnroll.sp")
public class SpaceEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			
			int maxSize = 3 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/space_img/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			String spaceName = multiRequest.getParameter("spaceName");
			String[] spaceKinds = multiRequest.getParameterValues("spaceKind");
			String spaceKind = "";
			if (spaceKinds != null) {
				spaceKind = String.join("/", spaceKinds);
			}
			
			String spaceOneIntroduce = multiRequest.getParameter("spaceOneIntroduce");
			String spaceIntroduce = multiRequest.getParameter("spaceIntroduce");
			String spaceTag = multiRequest.getParameter("spaceTag");
			String[] spaceInformations = multiRequest.getParameterValues("spaceInformation");
			String spaceInformation = "";
			if (spaceInformations != null) {
				spaceInformation = String.join("/", spaceInformations);
			}
			
			String[] spaceCautions = multiRequest.getParameterValues("spaceCaution");
			String spaceCaution = "";
			if (spaceCautions != null) {
				spaceCaution = String.join("/", spaceCautions);
			}
			
			String spaceAddress = multiRequest.getParameter("spaceAddress");
			String spaceDetailAddress = multiRequest.getParameter("spaceDetailAddress");
			int spacePrice = Integer.parseInt(multiRequest.getParameter("spacePrice"));
			String spaceLocation = multiRequest.getParameter("spaceLocation");
			String spaceTel = multiRequest.getParameter("spaceTel");
			int spaceCapacity = Integer.parseInt(multiRequest.getParameter("spaceCapacity"));
			
			String spaceMimg = null;
			
			ArrayList<Attachment> list = new ArrayList<>();
			for(int i = 1; i <= 6; i++) {
				String key = "file" + i;
				if (multiRequest.getOriginalFileName(key) != null) {
					//첨부파일이 존재할 경우
					//Attachment 생성 -> 원본명, 수정된파일명, 폴더경로, 파일레벨 => list
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("/resources/space_img/");
					at.setFileLevel(i == 1 ? 1 : 2); 
					
					if(at.getFileLevel() == 1) {
						spaceMimg = at.getFilePath() + at.getChangeName();
					}
					list.add(at);
				}
			}
			
			Space sp = new Space(spaceName,
								 spaceKind,
								 spaceOneIntroduce,
								 spaceIntroduce,
								 spaceTag,
								 spaceInformation,
								 spaceCaution,
								 spaceMimg,
								 spaceAddress,
								 spaceDetailAddress,
								 spacePrice,
								 spaceLocation,
								 spaceTel,
								 spaceCapacity,
								 userNo
								 );
			
			int result = new SpaceService().insertSpace(sp, list);
			
			if (result > 0) {
				request.getSession().setAttribute("alertMsg", "성공!! SPACE등록에 성공하였습니다.");
				response.sendRedirect(request.getContextPath() + "/main.ho");
			} else {
				request.getSession().setAttribute("alertMsg", "실패 !! SPACE등록에 실패하였습니다.");
				response.sendRedirect(request.getContextPath() + "/main.ho");
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
