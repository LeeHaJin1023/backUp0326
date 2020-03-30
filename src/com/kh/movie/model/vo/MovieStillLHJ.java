package com.kh.movie.model.vo;

public class MovieStillLHJ {
	
	private Integer movieNo;
	private String modifyName;
	
	public MovieStillLHJ() {
		
	}

	public MovieStillLHJ(Integer movieNo, String modifyName) {
		super();
		this.movieNo = movieNo;
		this.modifyName = modifyName;
	}

	public Integer getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(Integer movieNo) {
		this.movieNo = movieNo;
	}

	public String getModifyName() {
		return modifyName;
	}

	public void setModifyName(String modifyName) {
		this.modifyName = modifyName;
	}

	@Override
	public String toString() {
		return "MovieStillLHJ [movieNo=" + movieNo + ", modifyName=" + modifyName + "]";
	}
	
	

}
