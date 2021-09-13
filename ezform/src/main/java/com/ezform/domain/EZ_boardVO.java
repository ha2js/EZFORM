package com.ezform.domain;


import java.sql.Timestamp;

public class EZ_boardVO {
	
	private int cm_bnum;
	private int cm_id;
	private String cm_title;
	private String cm_dname;
	private String cm_name;
	private Timestamp cm_regdate;
	private String cm_content;
	private int cm_hits;
	private int cm_like;
	private String cm_file;
	
	public int getCm_bnum() {
		return cm_bnum;
	}
	public void setCm_bnum(int cm_bnum) {
		this.cm_bnum = cm_bnum;
	}
	public int getCm_id() {
		return cm_id;
	}
	public void setCm_id(int cm_id) {
		this.cm_id = cm_id;
	}
	public String getCm_title() {
		return cm_title;
	}
	public void setCm_title(String cm_title) {
		this.cm_title = cm_title;
	}
	public String getCm_dname() {
		return cm_dname;
	}
	public void setCm_dname(String cm_dname) {
		this.cm_dname = cm_dname;
	}
	public String getCm_name() {
		return cm_name;
	}
	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}
	public Timestamp getCm_regdate() {
		return cm_regdate;
	}
	public void setCm_regdate(Timestamp cm_regdate) {
		this.cm_regdate = cm_regdate;
	}
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public int getCm_hits() {
		return cm_hits;
	}
	public void setCm_hits(int cm_hits) {
		this.cm_hits = cm_hits;
	}
	public int getCm_like() {
		return cm_like;
	}
	public void setCm_like(int cm_like) {
		this.cm_like = cm_like;
	}
	public String getCm_file() {
		return cm_file;
	}
	public void setCm_file(String cm_file) {
		this.cm_file = cm_file;
	}
	
	@Override
	public String toString() {
		return "EZ_boardVO [cm_bnum=" + cm_bnum + ", cm_id=" + cm_id + ", cm_title=" + cm_title + ", cm_dname="
				+ cm_dname + ", cm_name=" + cm_name + ", cm_regdate=" + cm_regdate + ", cm_content=" + cm_content
				+ ", cm_hits=" + cm_hits + ", cm_like=" + cm_like + ", cm_file=" + cm_file + "]";
	}
	
		
	
}
