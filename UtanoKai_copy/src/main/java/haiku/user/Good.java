package haiku.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HaikuDAO;
import haiku.Common;

/**
 * Servlet implementation class Good
 */
@WebServlet("/Good")
public class Good extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Good() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//認証無しでの閲覧禁止
		Common common = new Common();
		if(common.loginCheck(request, response) == true) {
			String strId = request.getParameter("id");
			int id = Integer.parseInt(strId);
			
			HaikuDAO dao = new HaikuDAO();
			dao.goodPlus(id);
			
			//一時的にgenreをsessionに入れる
			String strGenre = request.getParameter("genre");
			int genre = Integer.parseInt(strGenre);
			session.setAttribute("genre", genre);
			
			request.setAttribute("msg", "歌に高評価しました。");
			
			String top = request.getParameter("top");
			if(top == null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("List");
				dispatcher.forward(request,response);
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("Top");
				dispatcher.forward(request,response);
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
