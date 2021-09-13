package com.ezform.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class EZ_noticeVO {

	private int not_num;
	private int not_id;
	private String not_title;
	private String not_content;
	private Timestamp not_regdate;
	private String not_file;
	private int not_hits;
	
	public int getNot_num() {
		return not_num;
	}
	public void setNot_num(int not_num) {
		this.not_num = not_num;
	}
	public int getNot_id() {
		return not_id;
	}
	public void setNot_id(int not_id) {
		this.not_id = not_id;
	}
	public String getNot_title() {
		return not_title;
	}
	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}
	public String getNot_content() {
		return not_content;
	}
	public void setNot_content(String not_content) {
		this.not_content = not_content;
	}
	public Timestamp getNot_regdate() {
		return not_regdate;
	}
	public void setNot_regdate(Timestamp not_regdate) {
		this.not_regdate = not_regdate;
	}
	public String getNot_file() {
		return not_file;
	}
	public void setNot_file(String not_file) {
		this.not_file = not_file;
	}
	public int getNot_hits() {
		return not_hits;
	}
	public void setNot_hits(int not_hits) {
		this.not_hits = not_hits;
	}
	
	@Override
	public String toString() {
		return "EZ_noticeVO [not_num=" + not_num + ", not_id=" + not_id + ", not_title=" + not_title + ", not_content="
				+ not_content + ", not_regdate=" + not_regdate + ", not_file=" + not_file + ", not_hits=" + not_hits
				+ "]";
	}
		
	
}
