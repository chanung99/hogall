package com.ho.gall.model.vo;

import java.util.Date;

public class ReadProduct {
	private int productId;
	private String productCategory;
	private String productName;
	private String buyNowPrice;
	private String buyNowWhether;
	private String priceStart;
	private String productOwner;
	private Date enrollProduct;
	private String productEnrollType;
	private String availAbility;
	private String productContent;
	private Date closingDate;
	private String closingTime;
	private String commition;
	private String price;
	private String unit;
	private String views;
	private String enrollDate;
	private String closingDatee;
	
	public ReadProduct() {}

	public ReadProduct(int productId, String productCategory, String productName, String buyNowPrice,
			String buyNowWhether, String priceStart, String productOwner, Date enrollProduct, String productEnrollType,
			String availAbility, String productContent, Date closingDate, String closingTime, String commition,
			String price, String unit, String views, String enrollDate, String closingDatee) {
		super();
		this.productId = productId;
		this.productCategory = productCategory;
		this.productName = productName;
		this.buyNowPrice = buyNowPrice;
		this.buyNowWhether = buyNowWhether;
		this.priceStart = priceStart;
		this.productOwner = productOwner;
		this.enrollProduct = enrollProduct;
		this.productEnrollType = productEnrollType;
		this.availAbility = availAbility;
		this.productContent = productContent;
		this.closingDate = closingDate;
		this.closingTime = closingTime;
		this.commition = commition;
		this.price = price;
		this.unit = unit;
		this.views = views;
		this.enrollDate = enrollDate;
		this.closingDatee = closingDatee;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getBuyNowPrice() {
		return buyNowPrice;
	}

	public void setBuyNowPrice(String buyNowPrice) {
		this.buyNowPrice = buyNowPrice;
	}

	public String getBuyNowWhether() {
		return buyNowWhether;
	}

	public void setBuyNowWhether(String buyNowWhether) {
		this.buyNowWhether = buyNowWhether;
	}

	public String getPriceStart() {
		return priceStart;
	}

	public void setPriceStart(String priceStart) {
		this.priceStart = priceStart;
	}

	public String getProductOwner() {
		return productOwner;
	}

	public void setProductOwner(String productOwner) {
		this.productOwner = productOwner;
	}

	public Date getEnrollProduct() {
		return enrollProduct;
	}

	public void setEnrollProduct(Date enrollProduct) {
		this.enrollProduct = enrollProduct;
	}

	public String getProductEnrollType() {
		return productEnrollType;
	}

	public void setProductEnrollType(String productEnrollType) {
		this.productEnrollType = productEnrollType;
	}

	public String getAvailAbility() {
		return availAbility;
	}

	public void setAvailAbility(String availAbility) {
		this.availAbility = availAbility;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public Date getClosingDate() {
		return closingDate;
	}

	public void setClosingDate(Date closingDate) {
		this.closingDate = closingDate;
	}

	public String getClosingTime() {
		return closingTime;
	}

	public void setClosingTime(String closingTime) {
		this.closingTime = closingTime;
	}

	public String getCommition() {
		return commition;
	}

	public void setCommition(String commition) {
		this.commition = commition;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getViews() {
		return views;
	}

	public void setViews(String views) {
		this.views = views;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getClosingDatee() {
		return closingDatee;
	}

	public void setClosingDatee(String closingDatee) {
		this.closingDatee = closingDatee;
	}

	@Override
	public String toString() {
		return "ReadProduct [productId=" + productId + ", productCategory=" + productCategory + ", productName="
				+ productName + ", buyNowPrice=" + buyNowPrice + ", buyNowWhether=" + buyNowWhether + ", priceStart="
				+ priceStart + ", productOwner=" + productOwner + ", enrollProduct=" + enrollProduct
				+ ", productEnrollType=" + productEnrollType + ", availAbility=" + availAbility + ", productContent="
				+ productContent + ", closingDate=" + closingDate + ", closingTime=" + closingTime + ", commition="
				+ commition + ", price=" + price + ", unit=" + unit + ", views=" + views + ", enrollDate=" + enrollDate
				+ ", closingDatee=" + closingDatee + "]";
	}

	
	
}
