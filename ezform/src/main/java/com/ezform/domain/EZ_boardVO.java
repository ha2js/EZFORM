package com.ezform.domain;

import java.sql.Date;

public class EZ_boardVO {

	private int bno;
	private String id;
	private String btitle;
	private String dept;
	private String name;
	private Date b_regdate;
	private String b_content;
	private int view_cnt;
	private int like;
	private String bfile;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
	}
	
	@Override
	public String toString() {
		return "EZ_boardVO [bno=" + bno + ", id=" + id + ", btitle=" + btitle + ", dept=" + dept + ", name=" + name
				+ ", b_regdate=" + b_regdate + ", b_content=" + b_content + ", view_cnt=" + view_cnt + ", like=" + like
				+ ", bfile=" + bfile + "]";
	}
	
	
	
}
