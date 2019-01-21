package com.cxgc.front.model;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "supplier_scope", catalog = "mysql")
public class SupplierScope implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;	/*id*/
	private String supplier_scope;/*供应商类别*/
	
	public SupplierScope(int id,String supplier_scope) {

		this.id=id;
		this.supplier_scope=supplier_scope;
		
		
	}
	public SupplierScope() {
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
	
	@Column(name = "getSupplier_scope")
	public String getSupplier_scope() {
		return supplier_scope;
	}
	public void setSupplier_scope(String supplier_scope) {
		this.supplier_scope = supplier_scope;
	}
	
}
