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
import beans.UserBean;
import dao.HaikuDAO;
import dao.UserDAO;
import haiku.Common;
import haiku.PasswordUtil;

/**
 * Servlet implementation class UserDetail
 */
@WebServlet("/UserDetail")
public class UserDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDetail() {
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
			String name = request.getParameter("name");
			//情報変更から戻ってきた場合
			if(name == "") {
				name = (String)session.getAttribute("name");
			}
			//登録、更新日時、ひとことを取得
			UserDAO uDao = new UserDAO();
			ArrayList<UserBean> userList = uDao.userData(name);
			request.setAttribute("userList", userList);
			//閲覧者がこれまでに詠んだ歌を取得
			HaikuDAO dao = new HaikuDAO();
			for(int genre = 1; genre <= 4; genre++) {
				ArrayList<HaikuBean> haikuList = dao.userHaiku(name, genre);
				switch(genre) {
				//俳句・川柳
				case 1:
					request.setAttribute("haikuList", haikuList);
					break;
				//短歌
				case 2:
					request.setAttribute("tankaList", haikuList);
					break;
				//長歌
				case 3:
					request.setAttribute("chokaList", haikuList);
					break;
				//都々逸
				case 4:
					request.setAttribute("dodoitsuList", haikuList);
					break;
				}
			}
			
			//閲覧者自身の情報かどうか判断
			String myName = (String)session.getAttribute("name");
			if(name.equals(myName)) {
				request.setAttribute("myData", "myData");
			}else {
				request.setAttribute("composerName", name);
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user/userDetail.jsp");
			dispatcher.forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		
		//ひとこと更新の場合
		if(request.getParameter("greetChange") != null) {
			String greet = request.getParameter("greet");
			String name = request.getParameter("name");
			
			UserDAO dao = new UserDAO();
			dao.userGreet(greet, name);
			
			request.setAttribute("msg", "ひとことを更新しました。");
			doGet(request, response);
		//情報変更の場合
		}else {
			String loginOk = request.getParameter("loginOk");
			//情報変更前に認証
			if(loginOk == null) {
				//俳号と合言葉を取得
				String name = request.getParameter("name");
				String password = request.getParameter("password");
				
				//空欄がある場合
				if(name == "" || password == "") {
					request.setAttribute("msg", "俳号と合言葉を共にお教えください。");
					doGet(request, response);
				//空欄なく入力できている場合
				}else {
					//合言葉を暗号化
					String safetyPassword = PasswordUtil.getSafetyPassword(password, name);
					UserDAO dao = new UserDAO();
					int id = 0;
					id = dao.dataChangeCheck(name, safetyPassword);
					//俳号と合言葉が正しい場合
					if(id != 0) {
						request.setAttribute("id", id);
						request.setAttribute("loginOk", "loginOk");
						request.setAttribute("myData", "myData");
						RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user/userDetail.jsp");
						dispatcher.forward(request,response);
					//正しくない場合
					}else {
						request.setAttribute("msg", "正しくお教えください。");
						doGet(request, response);
					}
				}
			//認証後
			}else {
				String name = request.getParameter("name");
				String password1 = request.getParameter("password1");
				String password2 = request.getParameter("password2");
				String strId = request.getParameter("id");
				int id = Integer.parseInt(strId);
				
				String password = "";
				//空欄がある場合
				if(name == "" || password1 == "" || password2 == "") {
					request.setAttribute("msg", "全てお書きください。");
					doGet(request, response);
				//空欄がない場合
				}else {
					//合言葉確認
					if(password1.equals(password2)) {
						password = password1;
						//合言葉に英数字以外が使われている場合
						Common common = new Common();
						if(common.passwordJpCheck(password) == false) {
							request.setAttribute("msg", "合言葉には英数字以外使えません。");
							doGet(request, response);
						//英数字のみの場合
						}else {
							//合言葉を暗号化
							String safetyPassword = PasswordUtil.getSafetyPassword(password, name);
							UserDAO dao = new UserDAO();
							dao.userUpdate(name, safetyPassword, id);
								
							request.setAttribute("msg", "情報を変更しました。");
							session.setAttribute("name", name);
							doGet(request, response);
						}
					//合言葉が合わない場合
					}else {
						request.setAttribute("msg", "合言葉が違っています。");
						doGet(request, response);
					}
				}
			}
		}
	}

}
