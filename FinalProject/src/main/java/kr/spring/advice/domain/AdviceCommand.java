package kr.spring.advice.domain;

import java.sql.Date;

public class AdviceCommand {
	private int adv_num;
	private String adv_title;
	private String email;
	private Date adv_date;
	private String adv_phone;
	private int adv_like;
	private String adv_dep;
	private String adv_arr;
	private int s_num;
	public int getAdv_num() {
		return adv_num;
	}
	public void setAdv_num(int adv_num) {
		this.adv_num = adv_num;
	}
	public String getAdv_title() {
		return adv_title;
	}
	public void setAdv_title(String adv_title) {
		this.adv_title = adv_title;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getAdv_date() {
		return adv_date;
	}
	public void setAdv_date(Date adv_date) {
		this.adv_date = adv_date;
	}
	public String getAdv_phone() {
		return adv_phone;
	}
	public void setAdv_phone(String adv_phone) {
		this.adv_phone = adv_phone;
	}
	public int getAdv_like() {
		return adv_like;
	}
	public void setAdv_like(int adv_like) {
		this.adv_like = adv_like;
	}
	public String getAdv_dep() {
		return adv_dep;
	}
	public void setAdv_dep(String adv_dep) {
		this.adv_dep = adv_dep;
	}
	public String getAdv_arr() {
		return adv_arr;
	}
	public void setAdv_arr(String adv_arr) {
		this.adv_arr = adv_arr;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	
	@Override
	public String toString() {
		return "AdviceCommand [adv_num=" + adv_num + ", adv_title=" + adv_title + ", email=" + email + ", adv_date="
				+ adv_date + ", adv_phone=" + adv_phone + ", adv_like=" + adv_like + ", adv_dep=" + adv_dep
				+ ", adv_arr=" + adv_arr + ", s_num=" + s_num + "]";
	}
	
}
