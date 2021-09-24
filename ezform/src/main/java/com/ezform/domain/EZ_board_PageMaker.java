package com.ezform.domain;

public class EZ_board_PageMaker {

	// 페이징 처리 동작 수행
	private EZ_boardCri Cri; // 페이지에 출력되는 게시판 글의 개수 페이징 처리
	
	// 페이지 하단부 페이징 처리
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	// 페이지 블럭
	private int displaypageNum = 10;

	public void setCri(EZ_boardCri Cri) {
		this.Cri = Cri;
	}

	// 총 개수 계산
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

		//페이징에  필요한 정보처리
		CalcData();
	}
	
	public void CalcData() {
		System.out.println("----- 페이징 처리에 필요한 정보 계산-----");
		endPage = (int)Math.ceil(Cri.getPageStart()/(double)displaypageNum) * displaypageNum;
		
		startPage = (endPage - displaypageNum)+1;
		
		int tmpEndPage = (int) Math.ceil(totalCount/(double)Cri.getPageSize());
		
		if(endPage > tmpEndPage) {
			endPage = tmpEndPage;
		}
		
		prev = (startPage == 1? false : true );
		
		next = endPage * Cri.getPageSize() >= totalCount? false : true;
		System.out.println("----- 페이징 처리에 필요한 정보 계산-----");
	}

	// get,set
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplaypageNum() {
		return displaypageNum;
	}

	public void setDisplaypageNum(int displaypageNum) {
		this.displaypageNum = displaypageNum;
	} 
	
	public EZ_boardCri getCri() {
		return Cri;
	}
	
	public int getTotalCout() {
		return totalCount;
	}

	//ToString
	@Override
	public String toString() {
		return "EZ_board_pageMaker [Cri=" + Cri + ", totalCount=" + totalCount + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", displaypageNum=" + displaypageNum
				+ "]";
	}
	

}
