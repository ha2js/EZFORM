package com.ezform.domain;

import java.sql.Date;

public class EZ_empVO {
	
	private String id;
	private String pass; // default => 1
	private String name;
	private String email;
	private String dept;
	private String rank;
	private int phone;
	private Date e_regdate;
	private String file;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public Date getE_regdate() {
		return e_regdate;
	}
	public void setE_regdate(Date e_regdate) {
		this.e_regdate = e_regdate;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	
	@Override
	public String toString() {
		return "EZ_empVO [id=" + id + ", pass=" + pass + ", name=" + name + ", email=" + email + ", dept=" + dept
				+ ", rank=" + rank + ", phone=" + phone + ", e_regdate=" + e_regdate + ", file=" + file + "]";
	}
	
	

}
