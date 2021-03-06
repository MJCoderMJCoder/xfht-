package com.cxgc.front.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t_task", catalog = "mysql")
public class Task implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	public Task() {
	}
	
	public Task(Integer id, String name, String contents, Date remindTime, Integer isDel,Integer user_id,Date createdate,Integer handle,Date handleDate) {
		super();
		this.id = id;
		this.name = name;
		this.contents = contents;
		this.remindTime = remindTime;
		this.isDel = isDel;
		this.user_id = user_id;
		this.createdate = createdate;
		this.handle = handle;
		this.handleDate = handleDate;
	}
	
	private Integer id;
	private String name;
	private String contents;
	private Date remindTime;
	private Integer isDel;
	private Integer user_id;
	private Date createdate;
	private Integer handle;//处理；0未处理，1已处理
	private Date handleDate;//处理日期
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false, length = 20)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "name", length = 255)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "contents", length = 2000)
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

	@Column(name = "remindTime")
	public Date getRemindTime() {
		return remindTime;
	}
	public void setRemindTime(Date remindTime) {
		this.remindTime = remindTime;
	}
	
	@Column(name = "isDel", length = 1)
	public Integer getIsDel() {
		return isDel;
	}
	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}

	@Column(name = "user_id", length = 20)
	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	@Column(name = "createdate")
	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	@Column(name = "handle", length = 20)
	public Integer getHandle() {
		return handle;
	}

	public void setHandle(Integer handle) {
		this.handle = handle;
	}

	@Column(name = "handleDate")
	public Date getHandleDate() {
		return handleDate;
	}

	public void setHandleDate(Date handleDate) {
		this.handleDate = handleDate;
	}

}
