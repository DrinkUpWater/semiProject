package test;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxCommentInser
 */
@WebServlet("/insertco.bo")
public class AjaxCommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static int us=0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCommentInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		request.setCharacterEncoding("utf-8");
		String userId="insertUserId"+(++us);
		
		
		int spaceNum=Integer.parseInt(request.getParameter("spaceNum"));  
		String content=request.getParameter("content");
		LocalDate now =LocalDate.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    String formatedNow = now.format(formatter);
	  
		String date=formatedNow;
		
		Comment in=new Comment(userId,content,"",spaceNum,date);
		CommentList.datas.add(in);
		response.getWriter().print(in.getCommentNo());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
