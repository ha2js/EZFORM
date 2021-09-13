package com.ezform.domain;

import java.sql.Date;

public class EZ_noticeVO {

	private int nno;
	private String id;
	private String ntitle;
	private String ncontent;
	private Date n_regdate;
	
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public Date getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
	}
	
	@Override
	public String toString() {
		return "EZ_noticeVO [nno=" + nno + ", id=" + id + ", ntitle=" + ntitle + ", ncontent=" + ncontent
				+ ", n_regdate=" + n_regdate + "]";
	}

	
	
	
	
	
	
	
}
