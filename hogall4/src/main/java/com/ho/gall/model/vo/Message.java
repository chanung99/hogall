package com.ho.gall.model.vo;

import java.util.Date;

public class Message {
	private int meNo;
	private String caller;
	private String receiver;
	private String meContent;
	private Date callDate;
	private String meSubject;
	private String callDatee;
	
	public Message() {}
	public Message(int meNo, String caller, String receiver, String meContent, Date callDate, String meSubject,
			String callDatee) {
		super();
		this.meNo = meNo;
		this.caller = caller;
		this.receiver = receiver;
		this.meContent = meContent;
		this.callDate = callDate;
		this.meSubject = meSubject;
		this.callDatee = callDatee;
	}
	public int getMeNo() {
		return meNo;
	}
	public void setMeNo(int meNo) {
		this.meNo = meNo;
	}
	public String getCaller() {
		return caller;
	}
	public void setCaller(String caller) {
		this.caller = caller;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getMeContent() {
		return meContent;
	}
	public void setMeContent(String meContent) {
		this.meContent = meContent;
	}
	public Date getCallDate() {
		return callDate;
	}
	public void setCallDate(Date callDate) {
		this.callDate = callDate;
	}
	public String getMeSubject() {
		return meSubject;
	}
	public void setMeSubject(String meSubject) {
		this.meSubject = meSubject;
	}
	public String getCallDatee() {
		return callDatee;
	}
	public void setCallDatee(String callDatee) {
		this.callDatee = callDatee;
	}
	@Override
	public String toString() {
		return "Message [meNo=" + meNo + ", caller=" + caller + ", receiver=" + receiver + ", meContent=" + meContent
				+ ", callDate=" + callDate + ", meSubject=" + meSubject + ", callDatee=" + callDatee + "]";
	}
	
	
	
}
