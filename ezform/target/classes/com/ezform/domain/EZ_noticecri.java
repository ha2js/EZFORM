package com.ezform.domain;

public class EZ_noticecri {
	
	//페이징 처리 정보를 저장하는 객체
	private int pageStart;
	private int pageSize;
	
	public EZ_noticecri() {
		this.pageStart = 1;
		this.pageSize = 10;
	}
	
	public void setPageStart(int pageStart) {
		//페이지 정보가 음수인 경우 1페이지로 처리
		if(pageStart<=0) {
			pageStart = 1;
			return;
		}
		this.pageStart = pageStart;
	}
	
	public void setPageSize(int pageSize) {
		
		if(pageSize<=0 || pageSize>100) {
			pageSize = 10;
			return;
		}
		this.pageSize = pageSize;
	}
	
	// mapper에서 사용할것
	public int getPageStart() {
		return pageStart;
	}

	public int getPageSize() {
		return pageSize;
	}
	
	// 시작 데이터 번호 = (페이지번호 -1)*페이지당 보여지는 수
	public int getPage() {
		return (this.pageStart-1)*pageSize;
	}

	@Override
	public String toString() {
		return "EZ_noticecri [pageStart=" + pageStart + ", pageSize=" + pageSize + "]";
	}
	
	
	
}
