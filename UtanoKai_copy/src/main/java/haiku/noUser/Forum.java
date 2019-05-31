package haiku.noUser;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ForumBean;
import dao.ForumDAO;

/**
 * Servlet implementation class Forum
 */
@WebServlet("/Forum")
public class Forum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Forum() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String nameCheck = (String)session.getAttribute("name");
		//管理人が閲覧するのでない場合
		if(nameCheck == null || !(nameCheck.equals("admin"))){
		//管理人が閲覧する場合
		}else {
			ArrayList<ForumBean> forumList = new ArrayList<ForumBean>();
			ForumDAO dao = new ForumDAO();
			//意見を取得
			forumList = dao.commentGet();
			request.setAttribute("forumList", forumList);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/noUser/forum.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//削除してきた場合
		if(request.getAttribute("delete") != null) {
			request.setAttribute("msg", "削除しました。");
			doGet(request, response);
		//削除に行っていない場合
		}else {
			HttpSession session = request.getSession();
			request.setCharacterEncoding("UTF-8");
			
			String name = request.getParameter("name");
			String commentBefore = request.getParameter("comment");
			
			//本文が空白の場合
			if(commentBefore == "") {
				request.setAttribute("msg", "本文をお書きください。");
				doGet(request, response);
			//書かれていた場合
			}else {
				//改行を反映
				String comment = commentBefore.replace("\r\n", "<br>");
				ForumDAO dao = new ForumDAO();
				dao.commentWrite(name, comment);
				
				request.setAttribute("forum", "forum");
				
				String nameCheck = (String)session.getAttribute("name");
				//会員認証前に来た場合
				if(nameCheck == null) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("Login");
					dispatcher.forward(request,response);
				//認証後に来た場合
				}else {
					RequestDispatcher dispatcher = request.getRequestDispatcher("Top");
					dispatcher.forward(request,response);
				}
			}
		}
	}

}
