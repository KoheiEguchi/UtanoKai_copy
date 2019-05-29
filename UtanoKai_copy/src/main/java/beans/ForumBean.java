package beans;

import java.sql.Date;
import java.sql.Time;

public class ForumBean {
	private int id;
	private String name;
	private String comment;
	private Date commentDate;
	private Time commentTime;
	
	public ForumBean() {
		
	}
	
	public ForumBean(int id, String name, String comment, Date commentDate, Time commentTime) {
		this.id = id;
		this.name = name;
		this.comment = comment;
		this.commentDate = commentDate;
		this.commentTime = commentTime;
	}

	//以下アクセサ
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public Time getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Time commentTime) {
		this.commentTime = commentTime;
	}
}
