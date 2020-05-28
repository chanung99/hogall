package com.ho.gall.model.vo;

public class ProductImage {

	private int imageId;
	private String oriFileName;
	private String reFileName;
	private int productId;
	private String orithumbnail;
	private String rethumbnail;
	
	public ProductImage() {}

	public ProductImage(int imageId, String oriFileName, String reFileName, int productId, String orithumbnail,
			String rethumbnail) {
		super();
		this.imageId = imageId;
		this.oriFileName = oriFileName;
		this.reFileName = reFileName;
		this.productId = productId;
		this.orithumbnail = orithumbnail;
		this.rethumbnail = rethumbnail;
	}

	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}

	public String getOriFileName() {
		return oriFileName;
	}

	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}

	public String getReFileName() {
		return reFileName;
	}

	public void setReFileName(String reFileName) {
		this.reFileName = reFileName;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getOrithumbnail() {
		return orithumbnail;
	}

	public void setOrithumbnail(String orithumbnail) {
		this.orithumbnail = orithumbnail;
	}

	public String getRethumbnail() {
		return rethumbnail;
	}

	public void setRethumbnail(String rethumbnail) {
		this.rethumbnail = rethumbnail;
	}

	@Override
	public String toString() {
		return "ProductImage [imageId=" + imageId + ", oriFileName=" + oriFileName + ", reFileName=" + reFileName
				+ ", productId=" + productId + ", orithumbnail=" + orithumbnail + ", rethumbnail=" + rethumbnail + "]";
	}

	
	
	
}
