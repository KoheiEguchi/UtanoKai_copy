package haiku.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.HaikuBean;
import dao.HaikuDAO;
import haiku.Common;

/**
 * Servlet implementation class HaikuDelete
 */
@WebServlet("/HaikuDelete")
public class HaikuDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HaikuDelete() {
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
			//管理人以外の閲覧禁止
			if(common.adminCheck(request, response) == true) {
				String strId = request.getParameter("id");
				int id = Integer.parseInt(strId);
				request.setAttribute("id", id);
				
				HaikuDAO dao = new HaikuDAO();
				//削除する歌を取得
				ArrayList<HaikuBean> deleteHaiku = dao.selectDeleteHaiku(id);
				request.setAttribute("deleteHaiku", deleteHaiku);
				
				//一時的にgenreをsessionに入れる
				String strGenre = request.getParameter("genre");
				int genre = Integer.parseInt(strGenre);
				session.setAttribute("genre", genre);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/admin/haikuDelete.jsp");
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
		HaikuDAO dao = new HaikuDAO();
		//指定された歌を削除
		dao.deleteHaiku(id);
		
		request.setAttribute("msg", "削除しました。");
		RequestDispatcher dispatcher = request.getRequestDispatcher("List");
		dispatcher.forward(request,response);
	}

}
