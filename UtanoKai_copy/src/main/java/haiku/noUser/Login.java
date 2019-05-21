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
import haiku.PasswordUtil;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/noUser/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//退会直後
		String delete = (String)request.getAttribute("delete");
		if(delete != null) {
			request.setAttribute("msg", "退会手続きを完了いたしました。");
			doGet(request, response);
		}else {
			//入会直後
			String userCreate = (String)request.getAttribute("userCreate");
			if(userCreate != null) {
				request.setAttribute("msg", "入会を受け付けました。");
				doGet(request, response);
			}else {
				HttpSession session = request.getSession();
				request.setCharacterEncoding("UTF-8");
				
				//俳号と合言葉を取得
				String name = request.getParameter("name");
				String password = request.getParameter("password");
				
				//空欄がある場合
				if(name == null || password == null) {
					request.setAttribute("msg", "俳号と合言葉を共にお教えください。");
					doGet(request, response);
				//空欄なく入力できている場合
				}else {
					//合言葉を暗号化
					String safetyPassword = PasswordUtil.getSafetyPassword(password, name);
					UserDAO dao = new UserDAO();
					int loginCheck = 0;
					loginCheck = dao.loginCheck(name, safetyPassword);
					
					//認証に失敗した場合
					if(loginCheck == 0){
						request.setAttribute("msg", "正しくお教えください。");
						doGet(request, response);
					//成功した場合
					}else {
						session.setAttribute("name", name);
						RequestDispatcher dispatcher = request.getRequestDispatcher("./Top");
						dispatcher.forward(request,response);
					}
				}
			}
		}
	}

}