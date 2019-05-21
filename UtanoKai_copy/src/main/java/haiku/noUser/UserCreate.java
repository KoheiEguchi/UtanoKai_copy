package haiku.noUser;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import haiku.Common;
import haiku.PasswordUtil;

/**
 * Servlet implementation class UserCreate
 */
@WebServlet("/UserCreate")
public class UserCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCreate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//退室用処理
		HttpSession session = request.getSession();
		session.removeAttribute("name");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/noUser/userCreate.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		
		String password = "";
		//空欄がある場合
		if(name == "" || password1 == "" || password2 == "") {
			request.setAttribute("msg", "全てお書きください。");
			doGet(request, response);
		}else {
			//合言葉が合わない場合
			if(!(password1.equals(password2))) {
				request.setAttribute("msg", "合言葉が違っています。");
				doGet(request, response);
			}else {
				password = password1;
				//合言葉に英数字以外が使われている場合
				Common common = new Common();
				if(common.passwordJpCheck(password) == false) {
					request.setAttribute("msg", "合言葉には英数字以外使えません。");
					doGet(request, response);
				//英数字のみの場合
				}else {
					//俳号被り確認
					UserDAO dao = new UserDAO();
					boolean userCheck = dao.userCheck(name);
					//被っていない場合
					if(userCheck == true) {
						//合言葉を暗号化
						String safetyPassword = PasswordUtil.getSafetyPassword(password, name);
						dao.userCreate(name, safetyPassword);
						
						String userCreate = "create";
						request.setAttribute("userCreate", userCreate);
						RequestDispatcher dispatcher = request.getRequestDispatcher("Login");
						dispatcher.forward(request,response);
					//被っている場合
					}else {
						request.setAttribute("msg", "その俳号は使われています。");
						doGet(request, response);
					}
				}
			}
		}
	}

}
