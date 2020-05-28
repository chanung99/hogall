package com.ho.gall.model.vo;

import java.util.Date;

public class WinningBid {
	
	private int bidNo;
	private String memberId;
	private int productId;
	private String name;
	private String price;
	private String image;
	private String seller;
	private Date wbDate;
	private String wbdatee;
	
	public WinningBid() {}

	public WinningBid(int bidNo, String memberId, int productId, String name, String price, String image, String seller,
			Date wbDate, String wbdatee) {
		super();
		this.bidNo = bidNo;
		this.memberId = memberId;
		this.productId = productId;
		this.name = name;
		this.price = price;
		this.image = image;
		this.seller = seller;
		this.wbDate = wbDate;
		this.wbdatee = wbdatee;
	}

	public int getBidNo() {
		return bidNo;
	}

	public void setBidNo(int bidNo) {
		this.bidNo = bidNo;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public Date getWbDate() {
		return wbDate;
	}

	public void setWbDate(Date wbDate) {
		this.wbDate = wbDate;
	}

	public String getWbdatee() {
		return wbdatee;
	}

	public void setWbdatee(String wbdatee) {
		this.wbdatee = wbdatee;
	}

	@Override
	public String toString() {
		return "WinningBid [bidNo=" + bidNo + ", memberId=" + memberId + ", productId=" + productId + ", name=" + name
				+ ", price=" + price + ", image=" + image + ", seller=" + seller + ", wbDate=" + wbDate + ", wbdatee="
				+ wbdatee + "]";
	}

	

}
