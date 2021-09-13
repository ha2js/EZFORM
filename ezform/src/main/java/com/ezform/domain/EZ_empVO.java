package com.ezform.domain;

import java.sql.Timestamp;

public class EZ_empVO {
	
	private int em_id;
	private String em_email;
	private String em_pw;
	private String em_name;
	private String em_dept;
	private String em_posi;
	private Timestamp em_regdate;
	private int em_extension;
	private String em_image;
	
	
	public int getEm_id() {
		return em_id;
	}
	public void setEm_id(int em_id) {
		this.em_id = em_id;
	}
	public String getEm_email() {
		return em_email;
	}
	public void setEm_email(String em_email) {
		this.em_email = em_email;
	}
	public String getEm_pw() {
		return em_pw;
	}
	public void setEm_pw(String em_pw) {
		this.em_pw = em_pw;
	}
	public String getEm_name() {
		return em_name;
	}
	public void setEm_name(String em_name) {
		this.em_name = em_name;
	}
	public String getEm_dept() {
		return em_dept;
	}
	public void setEm_dept(String em_dept) {
		this.em_dept = em_dept;
	}
	public String getEm_posi() {
		return em_posi;
	}
	public void setEm_posi(String em_posi) {
		this.em_posi = em_posi;
	}
	public Timestamp getEm_regdate() {
		return em_regdate;
	}
	public void setEm_regdate(Timestamp em_regdate) {
		this.em_regdate = em_regdate;
	}
	public int getEm_extension() {
		return em_extension;
	}
	public void setEm_extension(int em_extension) {
		this.em_extension = em_extension;
	}
	public String getEm_image() {
		return em_image;
	}
	public void setEm_image(String em_image) {
		this.em_image = em_image;
	}
	
	@Override
	public String toString() {
		return "EZ_empVO [em_id=" + em_id + ", em_email=" + em_email + ", em_pw=" + em_pw + ", em_name=" + em_name
				+ ", em_dept=" + em_dept + ", em_posi=" + em_posi + ", em_regdate=" + em_regdate + ", em_extension="
				+ em_extension + ", em_image=" + em_image + "]";
	}
		

}
