package com.cxgc.front.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import static javax.persistence.GenerationType.IDENTITY;

/** 帮助中心实体
 * @author Hit_hitdy
 *
 */
@Entity
@Table(name = "t_help", catalog = "mysql")
public class THelp implements java.io.Serializable  {

	 
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String title;
	private String datail;
	private Integer cuserid;
	private String cusername;
	private Date createtime;
	private String type1;
	private String type2;
	private String type3;
	private String type4;
	private String type5;
	private Integer readcount;
	private Integer edituserid;
	private String editusername;
	private Date edittime;
	private String spare1;
	private String spare2;
	
	public THelp() { 
	}
	
	public THelp(Integer id, String title, String datail, Integer cuserid, String cusername, Date createtime,
			String type1, String type2, String type3, String type4, String type5, Integer readcount, Integer edituserid,
			String editusername, Date edittime, String spare1, String spare2) {
		super();
		this.id = id;
		this.title = title;
		this.datail = datail;
		this.cuserid = cuserid;
		this.cusername = cusername;
		this.createtime = createtime;
		this.type1 = type1;
		this.type2 = type2;
		this.type3 = type3;
		this.type4 = type4;
		this.type5 = type5;
		this.readcount = readcount;
		this.edituserid = edituserid;
		this.editusername = editusername;
		this.edittime = edittime;
		this.spare1 = spare1;
		this.spare2 = spare2;
	}

	
	@Id
	@GeneratedValue(strategy = IDENTITY) 
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "title" , length = 500)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "detail" , length = 5000)
	public String getDatail() {
		return datail;
	}

	public void setDatail(String datail) {
		this.datail = datail;
	}

	@Column(name = "cuserid")
	public Integer getCuserid() {
		return cuserid;
	}

	public void setCuserid(Integer cuserid) {
		this.cuserid = cuserid;
	}

	@Column(name = "cusername" , length = 50)
	public String getCusername() {
		return cusername;
	}

	public void setCusername(String cusername) {
		this.cusername = cusername;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createtime", length = 19)
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	@Column(name = "type1" , length = 255)
	public String getType1() {
		return type1;
	}

	public void setType1(String type1) {
		this.type1 = type1;
	}

	@Column(name = "type2" , length = 255)
	public String getType2() {
		return type2;
	}

	public void setType2(String type2) {
		this.type2 = type2;
	}

	@Column(name = "type3" , length = 255)
	public String getType3() {
		return type3;
	}

	public void setType3(String type3) {
		this.type3 = type3;
	}

	@Column(name = "type4" , length = 255)
	public String getType4() {
		return type4;
	}

	public void setType4(String type4) {
		this.type4 = type4;
	}

	@Column(name = "type5" , length = 255)
	public String getType5() {
		return type5;
	}

	public void setType5(String type5) {
		this.type5 = type5;
	}

	@Column(name = "readcount")
	public Integer getReadcount() {
		return readcount;
	}

	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}

	@Column(name = "edituserid")	
	public Integer getEdituserid() {
		return edituserid;
	}

	public void setEdituserid(Integer edituserid) {
		this.edituserid = edituserid;
	}

	@Column(name = "editusername" , length = 255)
	public String getEditusername() {
		return editusername;
	}

	public void setEditusername(String editusername) {
		this.editusername = editusername;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "edittime", length = 19)
	public Date getEdittime() {
		return edittime;
	}

	public void setEdittime(Date edittime) {
		this.edittime = edittime;
	}

	@Column(name = "spare1", length = 255)
	public String getSpare1() {
		return spare1;
	}

	public void setSpare1(String spare1) {
		this.spare1 = spare1;
	}

	@Column(name = "spare2", length = 255)
	public String getSpare2() {
		return spare2;
	}

	public void setSpare2(String spare2) {
		this.spare2 = spare2;
	}
	
 
	
	
	
	
}
