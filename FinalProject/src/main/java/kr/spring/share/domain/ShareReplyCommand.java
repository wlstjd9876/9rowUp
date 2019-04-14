package kr.spring.share.domain;

import java.sql.Date;

public class ShareReplyCommand {
	private int sr_num;
	private String sr_content;
	private Date sr_date;
	private String email;
	private int num;
	public int getSr_num() {
		return sr_num;
	}
	public void setSr_num(int sr_num) {
		this.sr_num = sr_num;
	}
	public String getSr_content() {
		return sr_content;
	}
	public void setSr_content(String sr_content) {
		this.sr_content = sr_content;
	}
	public Date getSr_date() {
		return sr_date;
	}
	public void setSr_date(Date sr_date) {
		this.sr_date = sr_date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "ShareReplyCommand [sr_num=" + sr_num + ", sr_content=" + sr_content + ", sr_date=" + sr_date
				+ ", email=" + email + ", num=" + num + "]";
	}
	
}
