package com.ezform.domain;

import java.sql.Timestamp;

public class EZ_sendmailVO {

	private int mail_num;
	private String mail_id;
	private String mail_email;
	private Timestamp mail_regdate;
	private String mail_title;
	private String mail_content;
	private String mail_file;
	
	public int getMail_num() {
		return mail_num;
	}
	public void setMail_num(int mail_num) {
		this.mail_num = mail_num;
	}
	public String getMail_id() {
		return mail_id;
	}
	public void setMail_id(String mail_id) {
		this.mail_id = mail_id;
	}
	public String getMail_email() {
		return mail_email;
	}
	public void setMail_email(String mail_email) {
		this.mail_email = mail_email;
	}
	public Timestamp getMail_regdate() {
		return mail_regdate;
	}
	public void setMail_regdate(Timestamp mail_regdate) {
		this.mail_regdate = mail_regdate;
	}
	public String getMail_title() {
		return mail_title;
	}
	public void setMail_title(String mail_title) {
		this.mail_title = mail_title;
	}
	public String getMail_content() {
		return mail_content;
	}
	public void setMail_content(String mail_content) {
		this.mail_content = mail_content;
	}
	public String getMail_file() {
		return mail_file;
	}
	public void setMail_file(String mail_file) {
		this.mail_file = mail_file;
	}
	@Override
	public String toString() {
		return "EZ_sendmailVO [mail_num=" + mail_num + ", mail_id=" + mail_id + ", mail_email=" + mail_email
				+ ", mail_regdate=" + mail_regdate + ", mail_title=" + mail_title + ", mail_content=" + mail_content
				+ ", mail_file=" + mail_file + "]";
	}
	

}
