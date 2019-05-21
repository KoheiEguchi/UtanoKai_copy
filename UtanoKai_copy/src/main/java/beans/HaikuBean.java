package beans;

import java.sql.Date;
import java.sql.Time;

public class HaikuBean {
	private int id;
	private String haiku;
	private String composer;
	private String comment;
	private Date composeDate;
	private Time composeTime;
	private String strComposeDate;
	private String strComposeTime;
	private int genre;
	private int good;
	private String strGood;
	
	public HaikuBean() {
		
	}
	
	public HaikuBean(int id, String haiku, String composer, String comment, Date composeDate, Time composeTime, int genre, int good) {
		this.id = id;
		this.haiku = haiku;
		this.composer = composer;
		this.comment = comment;
		this.composeDate = composeDate;
		this.composeTime = composeTime;
		this.genre = genre;
		this.good = good;
	}
	
	public HaikuBean(int id, String haiku, String composer, String comment, String strComposeDate, String strComposeTime, int genre, String strGood) {
		this.id = id;
		this.haiku = haiku;
		this.composer = composer;
		this.comment = comment;
		this.strComposeDate = strComposeDate;
		this.strComposeTime = strComposeTime;
		this.genre = genre;
		this.strGood = strGood;
	}
	
	//以下アクセサ
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHaiku() {
		return haiku;
	}
	public void setHaiku(String haiku) {
		this.haiku = haiku;
	}
	public String getComposer() {
		return composer;
	}
	public void setComposer(String composer) {
		this.composer = composer;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getComposeDate() {
		return composeDate;
	}
	public void setComposeDate(Date composeDate) {
		this.composeDate = composeDate;
	}
	public Time getComposeTime() {
		return composeTime;
	}
	public void setComposeTime(Time composeTime) {
		this.composeTime = composeTime;
	}
	public String getStrComposeDate() {
		return strComposeDate;
	}
	public void setStrComposeDate(String strComposeDate) {
		this.strComposeDate = strComposeDate;
	}
	public String getStrComposeTime() {
		return strComposeTime;
	}
	public void setStrComposeTime(String strComposeTime) {
		this.strComposeTime = strComposeTime;
	}
	public int getGenre() {
		return this.genre;
	}
	public void setGenre(int genre) {
		this.genre = genre;
	}
	public int getGood() {
		return this.good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public String getStrGood() {
		return this.strGood;
	}
	public void setStrGood(String strGood) {
		this.strGood = strGood;
	}
}