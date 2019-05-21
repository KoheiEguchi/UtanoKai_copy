package haiku.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserBean;
import dao.UserDAO;
import haiku.Common;

/**
 * Servlet implementation class UserBAN
 */
@WebServlet("/UserBAN")
public class UserBAN extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserBAN() {
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
				UserDAO dao = new UserDAO();
				//退会させる会員を取得
				ArrayList<UserBean> banUser = dao.banUser(id);
				request.setAttribute("banUser", banUser);
				
				request.setAttribute("id", id);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/admin/userBAN.jsp");
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
		
		//指定された会員を強制退会
		UserDAO dao = new UserDAO();
		dao.userBAN(id);
		
		String delete = "delete";
		request.setAttribute("delete", delete);
		RequestDispatcher dispatcher = request.getRequestDispatcher("./UserList");
		dispatcher.forward(request,response);
	}

}