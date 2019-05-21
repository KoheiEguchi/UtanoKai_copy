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
 * Servlet implementation class Compose
 */
@WebServlet("/Compose")
public class Compose extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Compose() {
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
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user/compose.jsp");
			dispatcher.forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		
		//入力情報を取得
		String name = (String)session.getAttribute("name");
		String strGenre = request.getParameter("genre");
		//歌の種類が選ばれていない場合
		if(strGenre == null) {
			request.setAttribute("msg", "歌の種類をお選びください。");
			doGet(request, response);
		//種類が選んである場合
		}else {
			int genre = Integer.parseInt(strGenre);
			String haikuBefore = request.getParameter("haiku");
			String comment = request.getParameter("comment");
	
			//込めた思いが書かれていない場合
			if(comment == null) {
				comment = "空白";
			}
			//歌が白紙の場合
			if(haikuBefore == "") {
				request.setAttribute("msg", "歌が詠まれていません。");
				doGet(request, response);
			}else {
				//改行を反映
				String haiku = haikuBefore.replace("\r\n", "<br>");
				HaikuDAO dao = new HaikuDAO();
				dao.compose(name, haiku, comment, genre);
				
				request.setAttribute("msg", "歌をお受けしました。");
				RequestDispatcher dispatcher = request.getRequestDispatcher("./Top");
				dispatcher.forward(request,response);
			}
		}
	}

}