package com.kh.review_report.model.vo;

import java.util.Date;

public class ReviewReport {
   /* REVIEW_REPORT_NO */
   private int reviewReportNo;

   /* REVIEW_NO */
   private int reviewNo;

   /* MEMBER_NO */
   private int memberNo;

   /* DATE */
   private Date date;

   /* CONTENT */
   private String content;

   /* REPORT_TYPE */
   private String reportType;

   public ReviewReport() {
	   
   }

public ReviewReport(int reviewNo, int memberNo, String content, String reportType) {
	this.reviewNo = reviewNo;
	this.memberNo = memberNo;
	this.content = content;
	this.reportType = reportType;
}

public int getReviewReportNo() {
	return reviewReportNo;
}

public void setReviewReportNo(int reviewReportNo) {
	this.reviewReportNo = reviewReportNo;
}

public int getReviewNo() {
	return reviewNo;
}

public void setReviewNo(int reviewNo) {
	this.reviewNo = reviewNo;
}

public int getMemberNo() {
	return memberNo;
}

public void setMemberNo(int memberNo) {
	this.memberNo = memberNo;
}

public Date getDate() {
	return date;
}

public void setDate(Date date) {
	this.date = date;
}

public String getContent() {
	return content;
}

public void setContent(String content) {
	this.content = content;
}

public String getReportType() {
	return reportType;
}

public void setReportType(String reportType) {
	this.reportType = reportType;
}

@Override
public String toString() {
	return "ReviewReport [reviewReportNo=" + reviewReportNo + ", reviewNo=" + reviewNo + ", memberNo=" + memberNo
			+ ", date=" + date + ", content=" + content + ", reportType=" + reportType + "]";
}

   
}
