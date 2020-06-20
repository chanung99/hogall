package com.ho.gall.model.vo;

import java.util.Date;

public class Participating {

	private int parNo;
	private String memberId;
	private int productId;
	private Date enrollDate;
	private String bidPrice;
	private String curPrice;
	private String enrollDatee;
	private String enrollD;
	
	public Participating() {}

	public Participating(int parNo, String memberId, int productId, Date enrollDate, String bidPrice, String curPrice,
			String enrollDatee, String enrollD) {
		super();
		this.parNo = parNo;
		this.memberId = memberId;
		this.productId = productId;
		this.enrollDate = enrollDate;
		this.bidPrice = bidPrice;
		this.curPrice = curPrice;
		this.enrollDatee = enrollDatee;
		this.enrollD = enrollD;
	}

	public int getParNo() {
		return parNo;
	}

	public void setParNo(int parNo) {
		this.parNo = parNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getBidPrice() {
		return bidPrice;
	}

	public void setBidPrice(String bidPrice) {
		this.bidPrice = bidPrice;
	}

	public String getCurPrice() {
		return curPrice;
	}

	public void setCurPrice(String curPrice) {
		this.curPrice = curPrice;
	}

	public String getEnrollDatee() {
		return enrollDatee;
	}

	public void setEnrollDatee(String enrollDatee) {
		this.enrollDatee = enrollDatee;
	}

	public String getEnrollD() {
		return enrollD;
	}

	public void setEnrollD(String enrollD) {
		this.enrollD = enrollD;
	}

	@Override
	public String toString() {
		return "Participating [parNo=" + parNo + ", memberId=" + memberId + ", productId=" + productId + ", enrollDate="
				+ enrollDate + ", bidPrice=" + bidPrice + ", curPrice=" + curPrice + ", enrollDatee=" + enrollDatee
				+ ", enrollD=" + enrollD + "]";
	}

	
	
}
