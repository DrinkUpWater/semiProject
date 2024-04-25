package controller.notice.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.NoticeAttachment;
import com.oreilly.servlet.MultipartRequest;

import controller.notice.model.vo.Notice;
import controller.notice.service.NoticeService;


/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/update.no")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			//1)용량제한크기설정
			int maxSize = 10 * 1024 * 1024;
			
			//2) 물리적 저장경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/notice_sample_img/");
			
			System.out.println(request);
			System.out.println(savePath);
			System.out.println(maxSize);
			System.out.println(new MyFileRenamePolicy());

			//3) 전달된 파일명 수정작업 후 서버에 업로드
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());

			//4. sql문 실행에 필요한 값 추출해서 vo에 저장
			int noticeNo = Integer.parseInt(multiRequest.getParameter("num"));
			System.out.println(noticeNo);
			String noticeTitle = multiRequest.getParameter("title");
			String noticeContent = multiRequest.getParameter("content");
			
			Notice n = new Notice();
			n.setNoticeNo(noticeNo);
			n.setNoticeTitle(noticeTitle);
			n.setNoticeContent(noticeContent);

			
			NoticeAttachment nat = null; //일단 null로 만들고 넘어온 파일이 있다면 그때 생성
			if(multiRequest.getOriginalFileName("file") != null) {
				//새로 넘어온 첨부파일이 있을 때
				nat = new NoticeAttachment();
				nat.setOriginName(multiRequest.getOriginalFileName("file"));
				nat.setChangeName(multiRequest.getFilesystemName("file"));
				nat.setFilePath("resources/notice_sample_img/");
				
				//기존 첨부파일이 있을 때 => update NoticeAttachment(기존첨부파일번호)
				if(multiRequest.getParameter("originFileNo") != null) {
					nat.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				} else {//첨부파일이 없을 떄 => insert
					nat.setRefNoticeNo(noticeNo);
				}
			} //새로운 첨부파일이 없다면 nat = null
			
			int result = new NoticeService().updateNotice(n, nat);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "공지사항이 수정되었습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.no?num=" + n.getNoticeNo());
			} else {
				request.setAttribute("errorMsg", "공지사항 수정에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
