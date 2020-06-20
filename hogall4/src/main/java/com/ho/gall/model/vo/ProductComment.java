package com.ho.gall.model.vo;

import java.util.Date;

public class ProductComment {
	private int commentNo;
	private int productId;
	private String memberId;
	private String commentContent;
	private int groupId;
	private int commentNoRef;
	private int depth;
	private int commentOrder;
	private Date enrollComment;
	private String enroll;
	
	public ProductComment() {}

	public ProductComment(int commentNo, int productId, String memberId, String commentContent, int groupId,
			int commentNoRef, int depth, int commentOrder, Date enrollComment, String enroll) {
		super();
		this.commentNo = commentNo;
		this.productId = productId;
		this.memberId = memberId;
		this.commentContent = commentContent;
		this.groupId = groupId;
		this.commentNoRef = commentNoRef;
		this.depth = depth;
		this.commentOrder = commentOrder;
		this.enrollComment = enrollComment;
		this.enroll = enroll;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public int getCommentNoRef() {
		return commentNoRef;
	}

	public void setCommentNoRef(int commentNoRef) {
		this.commentNoRef = commentNoRef;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getCommentOrder() {
		return commentOrder;
	}

	public void setCommentOrder(int commentOrder) {
		this.commentOrder = commentOrder;
	}

	public Date getEnrollComment() {
		return enrollComment;
	}

	public void setEnrollComment(Date enrollComment) {
		this.enrollComment = enrollComment;
	}

	public String getEnroll() {
		return enroll;
	}

	public void setEnroll(String enroll) {
		this.enroll = enroll;
	}

	@Override
	public String toString() {
		return "ProductComment [commentNo=" + commentNo + ", productId=" + productId + ", memberId=" + memberId
				+ ", commentContent=" + commentContent + ", groupId=" + groupId + ", commentNoRef=" + commentNoRef
				+ ", depth=" + depth + ", commentOrder=" + commentOrder + ", enrollComment=" + enrollComment
				+ ", enroll=" + enroll + "]";
	}

	
	
}
