package com.ezform.domain;

public class EZ_mail_pageMarker {

	private EZ_mailCri cri;

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private int displayPageNum = 10;


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

		pagingCalc();
	}

	public void pagingCalc() {
		System.out.println("pagingCalc() 호출");

		endPage = (int)Math.ceil(cri.getPageStart()/(double)displayPageNum) * displayPageNum;

		startPage = (endPage - displayPageNum) + 1;

		int tmp = (int)Math.ceil(totalCount/(double)cri.getPageSize());

		if (endPage > tmp) {
			endPage = tmp;
		}

		// 이전, 다음 T/F 처리
		if (startPage == 1) prev = false;
		else prev = true;

		if ((endPage * cri.getPageSize()) >= totalCount) next = false;
		else next = true;
	} 

	public EZ_mailCri getCri() {
		return cri;
	}

	public void setCri(EZ_mailCri cri) {
		this.cri = cri;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}
	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

}