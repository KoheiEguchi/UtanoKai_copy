package haiku.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.HaikuBean;
import dao.HaikuDAO;
import haiku.Common;

/**
 * Servlet implementation class Top
 */
@WebServlet("/Top")
public class Top extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Top() {
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
			//最新の歌を取得
			HaikuDAO dao = new HaikuDAO();
			for(int genre = 1; genre <= 4; genre++) {
				ArrayList<HaikuBean> newHaiku = dao.newHaiku(genre);
				switch(genre) {
				//俳句・川柳
				case 1:
					request.setAttribute("newHaiku", newHaiku);
					break;
				//短歌
				case 2:
					request.setAttribute("newTanka", newHaiku);
					break;
				//長歌
				case 3:
					request.setAttribute("newChoka", newHaiku);
					break;
				//都々逸
				case 4:
					request.setAttribute("newDodoitsu", newHaiku);
					break;
				}
			}
			
			//高評価の歌を取得
			for(int genre = 1; genre <= 4; genre++) {
				ArrayList<HaikuBean> goodHaiku = dao.goodHaiku(genre);
				switch(genre) {
				//俳句・川柳
				case 1:
					request.setAttribute("goodHaiku", goodHaiku);
					break;
				//短歌
				case 2:
					request.setAttribute("goodTanka", goodHaiku);
					break;
				//長歌
				case 3:
					request.setAttribute("goodChoka", goodHaiku);
					break;
				//都々逸
				case 4:
					request.setAttribute("goodDodoitsu", goodHaiku);
					break;
				}
			}
			
			//トップ画面のみヘッダー表示を変える
			request.setAttribute("top", "top");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user/top.jsp");
			dispatcher.forward(request,response);
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
