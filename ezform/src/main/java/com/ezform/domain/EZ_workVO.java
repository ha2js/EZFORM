package com.ezform.domain;

import java.sql.Timestamp;

public class EZ_workVO {
	private int em_id;
	private Timestamp work_regdate;
	private String work_status;
	
	public int getEm_id() {
		return em_id;
	}
	public void setEm_id(int em_id) {
		this.em_id = em_id;
	}
	public Timestamp getWork_regdate() {
		return work_regdate;
	}
	public void setWork_regdate(Timestamp work_regdate) {
		this.work_regdate = work_regdate;
	}
	public String getWork_status() {
		return work_status;
	}
	public void setWork_status(String work_status) {
		this.work_status = work_status;
	}
	@Override
	public String toString() {
		return "EZ_workVO [em_id=" + em_id + ", work_regdate=" + work_regdate + ", work_status=" + work_status + "]";
	}

	
}
