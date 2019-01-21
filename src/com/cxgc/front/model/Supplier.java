package com.cxgc.front.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "supplier", catalog = "mysql")
public class Supplier <T> implements java.io.Serializable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;						/*主键ID 	*/
	private String supplier_name; 			/*供应商名 */
	private String supplier_rank;			/*供应商等级*/
	private String supplier_category;		/*供应商类别 */
	private int supplier_delivery;		/*交货及时率评分 */
	private int supplier_servicequality;/*服务质量评分 */
	private int supplier_productquality;/*产品质量评分 */
	private int supplier_accountperiod;	/*供应商账期评分 */
	private int supplier_totalscore;	/*供应商总分 */
	private String supplier_rating;			/*供应商评分等级 */
	private String supplier_evaluate;		/*供应商评价 */
	private String supplier_picture1;		/*供应商资质1*/
	private String supplier_picture2;		/*供应商资质2*/
	private String supplier_picture3;		/*供应商资质3*/
	private String supplier_picture4;		/*供应商资质4*/
	private String supplier_picture5;		/*供应商资质5*/
	private String supplier_picture6;		/*供应商资质6*/
	
	
	public Supplier() {
	}
	public Supplier(int id) {
		this.id = id;
	}
	
	public Supplier(int id, String supplier_name, String supplier_rank,String supplier_category, int supplier_delivery,
			int supplier_servicequality,int supplier_productquality,int supplier_accountperiod,int supplier_totalscore,
			String supplier_rating,String supplier_evaluate,String supplier_picture1,String supplier_picture2,String supplier_picture3,
			String supplier_picture4,String supplier_picture5,String supplier_picture6) {
		super();
		this.id = id;
		this.supplier_name = supplier_name;
		this.supplier_rank = supplier_rank;
		this.supplier_category = supplier_category;
		this.supplier_delivery = supplier_delivery;
		this.supplier_servicequality = supplier_servicequality;
		this.supplier_productquality = supplier_productquality;
		this.supplier_accountperiod = supplier_accountperiod;
		this.supplier_totalscore = supplier_totalscore;
		this.supplier_rating = supplier_rating;
		this.supplier_evaluate = supplier_evaluate;
		this.supplier_picture1 = supplier_picture1;
		this.supplier_picture2 = supplier_picture2;
		this.supplier_picture3 = supplier_picture3;
		this.supplier_picture4 = supplier_picture4;
		this.supplier_picture5 = supplier_picture5;
		this.supplier_picture6 = supplier_picture6;
		
	}
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	
	@Column(name = "id", unique = true, nullable = false, length = 20)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "supplier_name")
	public String getSupplier_name() {
		return supplier_name;
	}
	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}
	
	@Column(name = "supplier_rank")
	public String getSupplier_rank() {
		return supplier_rank;
	}
	public void setSupplier_rank(String supplier_rank) {
		this.supplier_rank = supplier_rank;
	}
	
	@Column(name = "supplier_category")
	public String getSupplier_category() {
		return supplier_category;
	}
	public void setSupplier_category(String supplier_category) {
		this.supplier_category = supplier_category;
	}
	
	@Column(name = "supplier_delivery")
	public Integer getSupplier_delivery() {
		return supplier_delivery;
	}
	public void setSupplier_delivery(Integer supplier_delivery) {
		this.supplier_delivery = supplier_delivery;
	}
	
	@Column(name = "supplier_servicequality")
	public Integer getSupplier_servicequality() {
		return supplier_servicequality;
	}
	public void setSupplier_servicequality(Integer supplier_servicequality) {
		this.supplier_servicequality = supplier_servicequality;
	}
	
	@Column(name = "supplier_productquality")
	public Integer getSupplier_productquality() {
		return supplier_productquality;
	}
	public void setSupplier_productquality(Integer supplier_productquality) {
		this.supplier_productquality = supplier_productquality;
	}
	
	@Column(name = "supplier_accountperiod")
	public Integer getSupplier_accountperiod() {
		return supplier_accountperiod;
	}
	public void setSupplier_accountperiod(Integer supplier_accountperiod) {
		this.supplier_accountperiod = supplier_accountperiod;
	}
	
	@Column(name = "supplier_totalscore")
	public Integer getSupplier_totalscore() {
		return supplier_totalscore;
	}
	public void setSupplier_totalscore(Integer supplier_totalscore) {
		this.supplier_totalscore = supplier_totalscore;
	}
	
	@Column(name = "supplier_rating")
	public String getSupplier_rating() {
		return supplier_rating;
	}
	public void setSupplier_rating(String supplier_rating) {
		this.supplier_rating = supplier_rating;
	}
	
	@Column(name = "supplier_evaluate")
	public String getSupplier_evaluate() {
		return supplier_evaluate;
	}
	public void setSupplier_evaluate(String supplier_evaluate) {
		this.supplier_evaluate = supplier_evaluate;
	}
	
	@Column(name = "supplier_picture1")
	public String getSupplier_picture1() {
		return supplier_picture1;
	}
	public void setSupplier_picture1(String supplier_picture1) {
		this.supplier_picture1 = supplier_picture1;
	}
	
	@Column(name = "supplier_picture2")
	public String getSupplier_picture2() {
		return supplier_picture2;
	}
	public void setSupplier_picture2(String supplier_picture2) {
		this.supplier_picture2 = supplier_picture2;
	}
	
	@Column(name = "supplier_picture3")
	public String getSupplier_picture3() {
		return supplier_picture3;
	}
	public void setSupplier_picture3(String supplier_picture3) {
		this.supplier_picture3 = supplier_picture3;
	}
	
	@Column(name = "supplier_picture4")
	public String getSupplier_picture4() {
		return supplier_picture4;
	}
	public void setSupplier_picture4(String supplier_picture4) {
		this.supplier_picture4 = supplier_picture4;
	}
	
	@Column(name = "supplier_picture5")
	public String getSupplier_picture5() {
		return supplier_picture5;
	}
	public void setSupplier_picture5(String supplier_picture5) {
		this.supplier_picture5 = supplier_picture5;
	}
	
	@Column(name = "supplier_picture6")
	public String getSupplier_picture6() {
		return supplier_picture6;
	}
	public void setSupplier_picture6(String supplier_picture6) {
		this.supplier_picture6 = supplier_picture6;
	}
	
	 
	
	
}
