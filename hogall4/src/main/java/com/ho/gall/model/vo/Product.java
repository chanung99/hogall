package com.ho.gall.model.vo;

import java.util.Date;

public class Product {
	private String charDate;
	private int productId;
	private String productCategory;
	private String productName;
	private String buyNowPrice;
	private String buyNowWhether;
	private String priceStart;
	private String productPath;
	private String productOwner;
	private Date enrollProduct;
	private String productEnrollType;
	private String availability;
	private String productContent;
	private String categoryName;
	private String categoryImage;
	private String reFileName;
	private String oriFileName;
	private Date closingDate;
	private String closingTime;
	private String reThumbnail;
	private String commition;
	private String price;
	private String closingDatee;
	private int views;
	
	public Product() {}

	public Product(String charDate, int productId, String productCategory, String productName, String buyNowPrice,
			String buyNowWhether, String priceStart, String productPath, String productOwner, Date enrollProduct,
			String productEnrollType, String availability, String productContent, String categoryName,
			String categoryImage, String reFileName, String oriFileName, Date closingDate, String closingTime,
			String reThumbnail, String commition, String price, String closingDatee, int views) {
		super();
		this.charDate = charDate;
		this.productId = productId;
		this.productCategory = productCategory;
		this.productName = productName;
		this.buyNowPrice = buyNowPrice;
		this.buyNowWhether = buyNowWhether;
		this.priceStart = priceStart;
		this.productPath = productPath;
		this.productOwner = productOwner;
		this.enrollProduct = enrollProduct;
		this.productEnrollType = productEnrollType;
		this.availability = availability;
		this.productContent = productContent;
		this.categoryName = categoryName;
		this.categoryImage = categoryImage;
		this.reFileName = reFileName;
		this.oriFileName = oriFileName;
		this.closingDate = closingDate;
		this.closingTime = closingTime;
		this.reThumbnail = reThumbnail;
		this.commition = commition;
		this.price = price;
		this.closingDatee = closingDatee;
		this.views = views;
	}

	public String getCharDate() {
		return charDate;
	}

	public void setCharDate(String charDate) {
		this.charDate = charDate;
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

	public String getProductPath() {
		return productPath;
	}

	public void setProductPath(String productPath) {
		this.productPath = productPath;
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

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryImage() {
		return categoryImage;
	}

	public void setCategoryImage(String categoryImage) {
		this.categoryImage = categoryImage;
	}

	public String getReFileName() {
		return reFileName;
	}

	public void setReFileName(String reFileName) {
		this.reFileName = reFileName;
	}

	public String getOriFileName() {
		return oriFileName;
	}

	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
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

	public String getReThumbnail() {
		return reThumbnail;
	}

	public void setReThumbnail(String reThumbnail) {
		this.reThumbnail = reThumbnail;
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

	public String getClosingDatee() {
		return closingDatee;
	}

	public void setClosingDatee(String closingDatee) {
		this.closingDatee = closingDatee;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	@Override
	public String toString() {
		return "Product [charDate=" + charDate + ", productId=" + productId + ", productCategory=" + productCategory
				+ ", productName=" + productName + ", buyNowPrice=" + buyNowPrice + ", buyNowWhether=" + buyNowWhether
				+ ", priceStart=" + priceStart + ", productPath=" + productPath + ", productOwner=" + productOwner
				+ ", enrollProduct=" + enrollProduct + ", productEnrollType=" + productEnrollType + ", availability="
				+ availability + ", productContent=" + productContent + ", categoryName=" + categoryName
				+ ", categoryImage=" + categoryImage + ", reFileName=" + reFileName + ", oriFileName=" + oriFileName
				+ ", closingDate=" + closingDate + ", closingTime=" + closingTime + ", reThumbnail=" + reThumbnail
				+ ", commition=" + commition + ", price=" + price + ", closingDatee=" + closingDatee + ", views="
				+ views + "]";
	}

	
	
	
	
	
}