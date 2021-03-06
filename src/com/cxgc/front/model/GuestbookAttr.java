package com.cxgc.front.model;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

// Generated 2017-8-23 14:27:52 by Hibernate Tools 3.4.0.CR1


/**
 * Worktime generated by hbm2java
 */

@Entity
@Table(name = "jc_guestbook_attachment", catalog = "mysql")
public class GuestbookAttr implements java.io.Serializable {

	private Integer id;
	private Guestbook guestbook;
	private String path;//存放路径
	private String name;//原文件名
	private Integer type;//1、文档（录入） 2、音频（录入） 3、视频（录入） 4、图片 （录入）5、文档（处理中） 6、音频（处理中） 7、视频（处理中） 8、图片（处理中） 9、文档（领导批复） 10、音频（领导批复） 11、视频（领导批复） 12、图片（领导批复）
	private String imageRecognition;//从图片中识别出来的文字
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false, length = 11)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH,optional=false,fetch = FetchType.LAZY) 
	@JoinColumn(name = "guestbook_id")
	public Guestbook getGuestbook() {
		return guestbook;
	}
	public void setGuestbook(Guestbook guestbook) {
		this.guestbook = guestbook;
	}
	
	@Column(name = "attachment_path", length = 255)
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	@Column(name = "attachment_name", length = 100)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "type", length = 1)
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
	@Column(name="image_recognition", length = 16777216)  
	public String getImageRecognition() {
		return imageRecognition;
	}
	public void setImageRecognition(String imageRecognition) {
		this.imageRecognition = imageRecognition;
	}
	
	
	
}
