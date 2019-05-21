package haiku.user;

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
 * Servlet implementation class List
 */
@WebServlet("/List")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//genreName取得メソッド用
	Common common = new Common();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public List() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//認証無しでの閲覧禁止
		if(common.loginCheck(request, response) == true) {
			int genre = 0;
			//歌の削除または高評価から戻ってきた場合
			if(session.getAttribute("genre") != null) {
				//一時的にsessionに入れていたgenreをrequestに戻す
				genre = (int)session.getAttribute("genre");
				session.removeAttribute("genre");
			//戻ってきたのでない場合
			}else {
				//取得する種類を調べる
				String strGenre = request.getParameter("genre");
				genre = Integer.parseInt(strGenre);
			}
			//選ばれた種類の歌を取得
			String order = "new";
			HaikuDAO dao = new HaikuDAO();
			ArrayList<HaikuBean> list = dao.selectList(genre, order);
			request.setAttribute("list", list);
			
			//genreからgenreNameを取得
			String genreName = common.genreName(genre);
			
			request.setAttribute("genre", genre);
			request.setAttribute("genreName", genreName);
			request.setAttribute("order", "新しい順");
					
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user/list.jsp");
			dispatcher.forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//歌の削除から戻ってきた場合
		if(session.getAttribute("genre") != null) {
			doGet(request, response);
		//検索、並び替えの場合
		}else {
			request.setCharacterEncoding("UTF-8");
			
			String strGenre = request.getParameter("genre");
			int genre = Integer.parseInt(strGenre);
			
			HaikuDAO dao = new HaikuDAO();
			
			String order = request.getParameter("order");
			//並び替えの場合
			if(order != null) {
				ArrayList<HaikuBean> list = dao.selectList(genre, order);
				request.setAttribute("list", list);
				//基準を表示
				if(order.equals("new")) {
					request.setAttribute("order", "新しい順");
				}else if(order.equals("old")) {
					request.setAttribute("order", "古い順");
				}else if(order.equals("good")) {
					request.setAttribute("order", "評価の多い順");
				}else if(order.equals("bad")) {
					request.setAttribute("order", "評価の少ない順");
				}
			//検索の場合
			}else {
				String name = request.getParameter("name");
				
				//入力された俳号の歌を取得
				ArrayList<HaikuBean> searchList = dao.searchList(name, genre);
				//一つも見つからなかった場合
				if(searchList.size() == 0) {
					request.setAttribute("msg", "当てはまる俳号の方の歌は見つかりませんでした。");
				//見つかった場合
				}else {
					request.setAttribute("list", searchList);
				}
			}
			
			//genreからgenreNameを取得
			String genreName = common.genreName(genre);
			
			request.setAttribute("genre", genre);
			request.setAttribute("genreName", genreName);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user/list.jsp");
			dispatcher.forward(request,response);
		}
	}

}
