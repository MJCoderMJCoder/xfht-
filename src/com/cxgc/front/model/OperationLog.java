package com.cxgc.front.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t_operationLog", catalog = "mysql")
public class OperationLog implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	public OperationLog() {
	}
	
	public OperationLog(String modular,String submodule,String category,String classification,Date ModifyTime,String ip,User userId,String describes) {
		this.modular = modular;
		this.submodule = submodule;
		this.category = category;
		this.classification = classification;
		this.ModifyTime = ModifyTime;
		this.ip = ip;
		this.userId = userId;
		this.describes = describes;
	}
	
	private int id;
	private String modular;//保管柜编号
	private String submodule;//物品编号
	private String category;//操作项（0查询、1新增、2修改、3删除、4分配）
	private String classification;//分类(0登录日志，1操作日志，2错误日志)
	private Date ModifyTime;//操作时间
	private String ip;//操作人IP
	private User userId;//操作人
	private String describes;//描述
	
	
	@Column(name = "describes", length = 2000)
	public String getDescribes() {
		return describes;
	}

	public void setDescribes(String describes) {
		this.describes = describes;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false, length = 20)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "modular", length = 255)
	public String getModular() {
		return modular;
	}
	public void setModular(String modular) {
		this.modular = modular;
	}
	
	@Column(name = "submodule", length = 255)
	public String getSubmodule() {
		return submodule;
	}
	public void setSubmodule(String submodule) {
		this.submodule = submodule;
	}
	
	@Column(name = "category", length = 255)
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Column(name = "classification", length = 255)
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	
	@Column(name = "ModifyTime")
	public Date getModifyTime() {
		return ModifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		ModifyTime = modifyTime;
	}
	
	@Column(name = "ip", length = 255)
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH,optional=false,fetch = FetchType.LAZY) 
	@JoinColumn(name = "user_id") 
	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}
	
}
