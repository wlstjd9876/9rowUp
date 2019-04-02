package kr.spring.advice.domain;

import java.sql.Date;

public class AdviceReplyCommand {
	private int adv_num;
	private String email;
	private Date ar_date;
	private int ar_like;
	private String ar_startdate;
	private String ar_enddate;
	private String ar_comment;
	private int s_num;
	private int ar_num;
	public int getAdv_num() {
		return adv_num;
	}
	public void setAdv_num(int adv_num) {
		this.adv_num = adv_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getAr_date() {
		return ar_date;
	}
	public void setAr_date(Date ar_date) {
		this.ar_date = ar_date;
	}
	public int getAr_like() {
		return ar_like;
	}
	public void setAr_like(int ar_like) {
		this.ar_like = ar_like;
	}
	public String getAr_startdate() {
		return ar_startdate;
	}
	public void setAr_startdate(String ar_startdate) {
		this.ar_startdate = ar_startdate;
	}
	public String getAr_enddate() {
		return ar_enddate;
	}
	public void setAr_enddate(String ar_enddate) {
		this.ar_enddate = ar_enddate;
	}
	public String getAr_comment() {
		return ar_comment;
	}
	public void setAr_comment(String ar_comment) {
		this.ar_comment = ar_comment;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getAr_num() {
		return ar_num;
	}
	public void setAr_num(int ar_num) {
		this.ar_num = ar_num;
	}
	
	@Override
	public String toString() {
		return "AdviceReplyCommand [adv_num=" + adv_num + ", email=" + email + ", ar_date=" + ar_date + ", ar_like="
				+ ar_like + ", ar_startdate=" + ar_startdate + ", ar_enddate=" + ar_enddate + ", ar_comment="
				+ ar_comment + ", s_num=" + s_num + ", ar_num=" + ar_num + "]";
	}
}
