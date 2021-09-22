package com.ezform.domain;

public class EZ_mailCri {

	// 메일 페이징
	private int pageStart;
	private int pageSize;
	private String mail_id;
	
	
	public EZ_mailCri() {
		this.pageSize = 10;
		this.pageStart = 1;
	}
	
	public void setPageStart(int pageStart) {
		if (pageStart <= 0) {
			pageStart = 1;
			return;
		}
		this.pageStart = pageStart;
	}
	
	public void setPageSize(int pageSize) {
		if (pageSize <= 0 || pageSize > 100) {
			pageSize = 10;
			return;
		}
		this.pageSize = pageSize;
	}
	
	public void setMail_id(String mail_id) {
		this.mail_id = mail_id;
	}

	public int getPageStart() {
		return pageStart;
	}

	public int getPageSize() {
		return pageSize;
	}
	
	public String getMail_id() {
		return mail_id;
	}

	// 시작 데이터
	public int getPage() {
		return (this.pageStart-1) * pageSize;
	}

	@Override
	public String toString() {
		return "EZ_mailCri [pageStart=" + pageStart + ", pageSize=" + pageSize + ", mail_id=" + mail_id + "]";
	}
	
}
