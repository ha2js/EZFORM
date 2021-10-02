package com.ezform.domain;

import java.sql.Timestamp;

public class EZ_board_comVO {
	
	private int com_cnum;			//댓글번호
	private int com_bnum;			//게시글번호
	private String com_dept;		//부서명
	private String com_name;		//이름
	private Timestamp com_regdate;	//날짜
	private String com_content;		//내용
	private int com_id;				//아이디
	
	public int getCom_cnum() {
		return com_cnum;
	}
	public void setCom_cnum(int com_cnum) {
		this.com_cnum = com_cnum;
	}
	public int getCom_bnum() {
		return com_bnum;
	}
	public void setCom_bnum(int com_bnum) {
		this.com_bnum = com_bnum;
	}
	public String getCom_dept() {
		return com_dept;
	}
	public void setCom_dept(String com_dept) {
		this.com_dept = com_dept;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public Timestamp getCom_regdate() {
		return com_regdate;
	}
	public void setCom_regdate(Timestamp com_regdate) {
		this.com_regdate = com_regdate;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public int getCom_id() {
		return com_id;
	}
	public void setCom_id(int com_id) {
		this.com_id = com_id;
	}
	
	@Override
	public String toString() {
		return "EZ_board_comVO [com_cnum=" + com_cnum + ", com_bnum=" + com_bnum + ", com_dept=" + com_dept
				+ ", com_name=" + com_name + ", com_regdate=" + com_regdate + ", com_content=" + com_content
				+ ", com_id=" + com_id + "]";
	}
	
	
	
	
}
