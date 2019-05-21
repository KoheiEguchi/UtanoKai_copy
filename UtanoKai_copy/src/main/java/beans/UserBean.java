package beans;

import java.sql.Time;
import java.sql.Date;

public class UserBean {
	private int id;
	private String name;
	private String password;
	private Date createDate;
	private Time createTime;
	private Date updateDate;
	private Time updateTime;
	private String greet;
	
	public UserBean() {
		
	}
	
	public UserBean(int id, String name, String password, Date createDate, Time createTime, Date updateDate, Time updateTime, String greet) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.createDate = createDate;
		this.createTime = createTime;
		this.updateDate = updateDate;
		this.updateTime = updateTime;
		this.greet = greet;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Time getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Time createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Time getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Time updateTime) {
		this.updateTime = updateTime;
	}
	public String getGreet() {
		return this.greet;
	}
	public void setGreet(String greet) {
		this.greet = greet;
	}
}
