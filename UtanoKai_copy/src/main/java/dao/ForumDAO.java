package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import beans.ForumBean;

public class ForumDAO extends DAOConnection{
	//質問、意見書き込み
	public void commentWrite(String name, String comment) {
		try {
			conn = getConnection();
			ps = conn.prepareStatement("INSERT INTO forum (name, comment, comment_date, comment_time) VALUES (?, ?, now(), now())");
			ps.setString(1, name);
			ps.setString(2, comment);
			ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			allClose(ps, conn);
		}
	}
	
	//質問、意見取得
	public ArrayList<ForumBean> commentGet(){
		ArrayList<ForumBean> forumList = new ArrayList<ForumBean>();
		try {
			conn = getConnection();
			ps = conn.prepareStatement("SELECT * FROM forum");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ForumBean bean = new ForumBean();
				bean.setName(rs.getString("name"));
				bean.setComment(rs.getString("comment"));
				bean.setCommentDate(rs.getDate("comment_date"));
				bean.setCommentTime(rs.getTime("comment_time"));
				forumList.add(bean);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			allClose(ps, conn);
		}
		return forumList;
	}
}
