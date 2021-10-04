package com.ezform.domain;

public class ez_cm_likeVO {
	
	private int like_bnum;
	private int like_id;
	private String like_check;

	public int getLike_bnum() {
		return like_bnum;
	}
	public void setLike_bnum(int like_bnum) {
		this.like_bnum = like_bnum;
	}
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}
	public String getLike_check() {
		return like_check;
	}
	public void setLike_check(String like_check) {
		this.like_check = like_check;
	}
	@Override
	public String toString() {
		return "ez_cm_likeVO [like_bnum=" + like_bnum + ", like_id=" + like_id + ", like_check=" + like_check + "]";
	}
	
	
}
