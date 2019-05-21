package haiku.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.HaikuBean;
import beans.UserBean;
import dao.UserDAO;
import haiku.Common;

/**
 * Servlet implementation class UserList
 */
@WebServlet("/UserList")
public class UserList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserList() {
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
				UserDAO dao = new UserDAO();
				//全会員を取得
				ArrayList<UserBean> userList = dao.allUser();
				request.setAttribute("userList", userList);
				
				request.setAttribute("order", "古い順");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/admin/userList.jsp");
				dispatcher.forward(request,response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//強制退会してきた場合
		if(request.getAttribute("delete") != null) {
			request.setAttribute("msg", "退会させました。");
			doGet(request, response);
		//強制退会に行っていない場合
		}else {
			request.setCharacterEncoding("UTF-8");
			
			UserDAO dao = new UserDAO();
			//並び替えの場合
			if(request.getParameter("userOrder") != null) {
				String order = request.getParameter("order");
				ArrayList<UserBean> userList = dao.orderUser(order);
				request.setAttribute("userList", userList);
				//基準を表示
				if(order.equals("new")) {
					request.setAttribute("order", "新しい順");
				}else if(order.equals("old")) {
					request.setAttribute("order", "古い順");
				}
			//検索の場合
			}else {
				String name = request.getParameter("name");
				
				//入力された俳号に当てはまる会員を取得
				ArrayList<UserBean> searchUser = dao.searchUser(name);
				//一人も見つからなかった場合
				if(searchUser.size() == 0) {
					request.setAttribute("msg", "当てはまる俳号の方は見つかりませんでした。");
				//見つかった場合
				}else {
					request.setAttribute("userList", searchUser);
				}
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/admin/userList.jsp");
			dispatcher.forward(request,response);
		}
	}

}