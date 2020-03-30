package com.kh.menubar.controller;

public class TopMovieDto {

	private Integer movieNo;
	private Integer reservedCount;
	private Integer maxAddfileNo;
	private String modifyName;
	public Integer getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(Integer movieNo) {
		this.movieNo = movieNo;
	}
	public Integer getReservedCount() {
		return reservedCount;
	}
	public void setReservedCount(Integer reservedCount) {
		this.reservedCount = reservedCount;
	}
	public Integer getMaxAddfileNo() {
		return maxAddfileNo;
	}
	public void setMaxAddfileNo(Integer maxAddfileNo) {
		this.maxAddfileNo = maxAddfileNo;
	}
	public String getModifyName() {
		return modifyName;
	}
	public void setModifyName(String modifyName) {
		this.modifyName = modifyName;
	}
	public TopMovieDto(Integer movieNo, Integer reservedCount, Integer maxAddfileNo, String modifyName) {
		super();
		this.movieNo = movieNo;
		this.reservedCount = reservedCount;
		this.maxAddfileNo = maxAddfileNo;
		this.modifyName = modifyName;
	}
	
	
}
