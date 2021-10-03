package com.ezform.domain;


import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class EZ_boardVO {
	
	private int cm_bnum;			//글번호
	private int cm_id;				//아이디
	private String cm_title;		//주제
	private String cm_dname;		//부서명
	private String cm_name;			//이름
	private Timestamp cm_regdate;	//날짜
	private String cm_content;		//내용
	private int cm_hits;			//조회수
	private int cm_like;			//좋아요
	private String cm_file;			//파일
	private MultipartFile uploadFile;
	private int like; //버튼 누르면 0 / 1 구분
	
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
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	@Override
	public String toString() {
		return "EZ_boardVO [cm_bnum=" + cm_bnum + ", cm_id=" + cm_id + ", cm_title=" + cm_title + ", cm_dname="
				+ cm_dname + ", cm_name=" + cm_name + ", cm_regdate=" + cm_regdate + ", cm_content=" + cm_content
				+ ", cm_hits=" + cm_hits + ", cm_like=" + cm_like + ", cm_file=" + cm_file + ", uploadFile="
				+ uploadFile + ", like=" + like + "]";
	}
	
	
	
	
		
	
}
