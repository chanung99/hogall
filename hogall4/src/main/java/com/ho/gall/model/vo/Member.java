package com.ho.gall.model.vo;

import java.util.Date;

public class Member {
	private String memberId;
	private String password;
	private String name;
	private String nickName;
	private String email;
	private String authe;
	private int level;
	private String zipCode;
	private String address;
	private String detailAddress;
	private Date EnrollDate;
	private String edate;
	private String onOff;
	private String offContent;
	
	
	public Member() {}


	public Member(String memberId, String password, String name, String nickName, String email, String authe, int level,
			String zipCode, String address, String detailAddress, Date enrollDate, String edate, String onOff,
			String offContent) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.name = name;
		this.nickName = nickName;
		this.email = email;
		this.authe = authe;
		this.level = level;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
		EnrollDate = enrollDate;
		this.edate = edate;
		this.onOff = onOff;
		this.offContent = offContent;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAuthe() {
		return authe;
	}


	public void setAuthe(String authe) {
		this.authe = authe;
	}


	public int getLevel() {
		return level;
	}


	public void setLevel(int level) {
		this.level = level;
	}


	public String getZipCode() {
		return zipCode;
	}


	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getDetailAddress() {
		return detailAddress;
	}


	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}


	public Date getEnrollDate() {
		return EnrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		EnrollDate = enrollDate;
	}


	public String getEdate() {
		return edate;
	}


	public void setEdate(String edate) {
		this.edate = edate;
	}


	public String getOnOff() {
		return onOff;
	}


	public void setOnOff(String onOff) {
		this.onOff = onOff;
	}


	public String getOffContent() {
		return offContent;
	}


	public void setOffContent(String offContent) {
		this.offContent = offContent;
	}


	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", password=" + password + ", name=" + name + ", nickName=" + nickName
				+ ", email=" + email + ", authe=" + authe + ", level=" + level + ", zipCode=" + zipCode + ", address="
				+ address + ", detailAddress=" + detailAddress + ", EnrollDate=" + EnrollDate + ", edate=" + edate
				+ ", onOff=" + onOff + ", offContent=" + offContent + "]";
	}

	
	
	

}
