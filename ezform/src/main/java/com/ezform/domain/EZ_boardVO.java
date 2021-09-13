package com.ezform.domain;

<<<<<<< HEAD
import java.sql.Timestamp;

public class EZ_boardVO {
	
	private int cm_bnum;
	private String cm_title;
	private String cm_content;
	private String cm_name;
	private int cm_enum;
	private String cm_dname;
	private Timestamp cm_date;
	private int cm_hits;
	private int cm_like;
	private String cm_file;
	
	
	public int getCm_bnum() {
		return cm_bnum;
	}
	public void setCm_bnum(int cm_bnum) {
		this.cm_bnum = cm_bnum;
	}
	public String getCm_title() {
		return cm_title;
	}
	public void setCm_title(String cm_title) {
		this.cm_title = cm_title;
	}
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public String getCm_name() {
		return cm_name;
	}
	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}
	public int getCm_enum() {
		return cm_enum;
	}
	public void setCm_enum(int cm_enum) {
		this.cm_enum = cm_enum;
	}
	public String getCm_dname() {
		return cm_dname;
	}
	public void setCm_dname(String cm_dname) {
		this.cm_dname = cm_dname;
	}
	public Timestamp getCm_date() {
		return cm_date;
	}
	public void setCm_date(Timestamp cm_date) {
		this.cm_date = cm_date;
	}
	public int getCm_hits() {
		return cm_hits;
	}
	public void setCm_hits(int cm_hits) {
		this.cm_hits = cm_hits;
	}
	public int getCm_like() {
		return cm_like;
	}
	public void setCm_like(int cm_like) {
		this.cm_like = cm_like;
	}
	public String getCm_file() {
		return cm_file;
	}
	public void setCm_file(String cm_file) {
		this.cm_file = cm_file;
=======
import java.sql.Date;

public class EZ_boardVO {

	private int bno;
	private String id;
	private String btitle;
	private String dept;
	private String name;
	private Date b_regdate;
	private String b_content;
	private int view_cnt;
	private int like;
	private String bfile;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
>>>>>>> 3b5677dea747152a65a6eedde8d2f8e0e2786ee9
	}
	
	@Override
	public String toString() {
<<<<<<< HEAD
		return "EZ_boardVO [cm_bnum=" + cm_bnum + ", cm_title=" + cm_title + ", cm_content=" + cm_content + ", cm_name="
				+ cm_name + ", cm_enum=" + cm_enum + ", cm_dname=" + cm_dname + ", cm_date=" + cm_date + ", cm_hits="
				+ cm_hits + ", cm_like=" + cm_like + ", cm_file=" + cm_file + "]";
=======
		return "EZ_boardVO [bno=" + bno + ", id=" + id + ", btitle=" + btitle + ", dept=" + dept + ", name=" + name
				+ ", b_regdate=" + b_regdate + ", b_content=" + b_content + ", view_cnt=" + view_cnt + ", like=" + like
				+ ", bfile=" + bfile + "]";
>>>>>>> 3b5677dea747152a65a6eedde8d2f8e0e2786ee9
	}
	
	
	
<<<<<<< HEAD
	
=======
>>>>>>> 3b5677dea747152a65a6eedde8d2f8e0e2786ee9
}
