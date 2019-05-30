package haiku.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ForumBean;
import dao.ForumDAO;
import haiku.Common;

/**
 * Servlet implementation class ForumBAN
 */
@WebServlet("/ForumBAN")
public class ForumBAN extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForumBAN() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//認証無しでの閲覧禁止
		Common common = new Common();
		if(common.loginCheck(request, response) == true) {
			//管理人以外の閲覧禁止
			if(common.adminCheck(request, response) == true) {
				String strId = request.getParameter("id");
				int id = Integer.parseInt(strId);
				ForumDAO dao = new ForumDAO();
				//削除する投稿を取得
				ArrayList<ForumBean> banComment = dao.banComment(id);
				request.setAttribute("banComment", banComment);
				
				request.setAttribute("id", id);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/admin/forumBAN.jsp");
				dispatcher.forward(request,response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String strId = request.getParameter("id");
		int id = Integer.parseInt(strId);
		
		//指定された投稿を削除
		ForumDAO dao = new ForumDAO();
		dao.commentBAN(id);
		
		String delete = "delete";
		request.setAttribute("delete", delete);
		RequestDispatcher dispatcher = request.getRequestDispatcher("./Forum");
		dispatcher.forward(request,response);
	}

}
