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
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * InsterMess generated by hbm2java
 */
/**
 * @author Administrator
 *
 */ 
@Entity
@Table(name = "t_person", catalog = "mysql")
public class Person implements java.io.Serializable{

	private Long id;

	private Date createDate;
	
	private Date lastModifyDate;
	
	private String description;
	
	private Dictionary gender;
	
	private String name;
	
	private Long lastModifyById;
	
	private Dictionary faceId;
	
	private FaceDB faceDB;
	
	private String phone;
	
	private String img;
	
	private String imgName;
	
	private User user;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false, length = 20)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "create_date")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "last_modify_date")
	public Date getLastModifyDate() {
		return lastModifyDate;
	}

	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}

	@Column(name = "description", length = 2048)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@ManyToOne(fetch = FetchType.LAZY, targetEntity = Dictionary.class)  
	@JoinColumn(name = "gender")
	public Dictionary getGender() {
		return gender;
	}

	public void setGender(Dictionary gender) {
		this.gender = gender;
	}

	@Column(name = "name", length = 255)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "last_modify_by_id", length = 20)
	public Long getLastModifyById() {
		return lastModifyById;
	}

	public void setLastModifyById(Long lastModifyById) {
		this.lastModifyById = lastModifyById;
	}

	@ManyToOne(fetch = FetchType.LAZY, targetEntity = Dictionary.class)  
	@JoinColumn(name = "face_id")
	public Dictionary getFaceId() {
		return faceId;
	}

	public void setFaceId(Dictionary faceId) {
		this.faceId = faceId;
	}
	
	@ManyToOne(fetch = FetchType.LAZY, targetEntity = FaceDB.class)  
	@JoinColumn(name = "db_id")
	public FaceDB getFaceDB() {
		return faceDB;
	}

	public void setFaceDB(FaceDB faceDB) {
		this.faceDB = faceDB;
	}

	@Column(name = "phone", length = 11)
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	

	@Column(name = "img", length = 255)
	public String getImg() {
		return img;
	}

	
	public void setImg(String img) {
		this.img = img;
	}

	@Column(name = "img_name", length = 255)
	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	
	
	@OneToOne(fetch = FetchType.LAZY, targetEntity = User.class)  
	@JoinColumn(name = "user_id") 
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
	
}