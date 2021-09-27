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
	
	private int displaypageNum = 15;

	// 총 개수 계산
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

	// 페이지 블럭



		//페이징에  필요한 정보처리
		CalcData();
	}
	
	public void CalcData() {
		System.out.println("페이징 처리에 필요한 계산--------------------");
		endPage = (int)Math.ceil(Cri.getPageStart()/(double)displaypageNum) * displaypageNum;
		
		startPage = (endPage - displaypageNum)+1;
		
		int tmp = (int) Math.ceil(totalCount/(double)Cri.getPageSize());
		
		if(endPage > tmp) {
			endPage = tmp;
		}
		
		if( startPage == 1) prev = false;
		else prev = true;
		
		if ((endPage * Cri.getPageSize()) >= totalCount) next = false;
		else next = true;
		System.out.println("페이징 처리에 필요한 계산--------------------");
	}
	
	// get,set

	public EZ_boardCri getCri() {
		return Cri;
	}

	public void setCri(EZ_boardCri Cri) {
		this.Cri = Cri;
	}

	public int getTotalCout() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
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


	
	


	//ToString
	@Override
	public String toString() {
		return "EZ_board_PageMaker [Cri=" + Cri + ", totalCount=" + totalCount + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", displaypageNum=" + displaypageNum
				+ "]";
	}
	

}
