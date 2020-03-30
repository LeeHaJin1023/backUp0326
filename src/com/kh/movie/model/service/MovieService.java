package com.kh.movie.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.menubar.controller.NewMoviesDto;
import com.kh.menubar.controller.TopMovieDto;
import com.kh.movie.model.dao.MovieDao;
import com.kh.movie.model.vo.Movie;
import com.kh.movie.model.vo.MovieCBS;
import com.kh.movie.model.vo.MovieLHJ;
import com.kh.movie.model.vo.MovieStillLHJ;
import com.kh.movie.model.vo.PageInfo;
import com.kh.still_image.model.vo.StillImageCBS;

public class MovieService {

  
	/* HAJIN */
	public MovieLHJ selectList(int movieNo){
		Connection conn = getConnection();
		MovieLHJ m = new MovieDao().selectList(conn, movieNo);
  
  	close(conn);
		return m;
  
  }
	
	
	public List<MovieStillLHJ> selectMovieStill(int movieNo) {
		
		Connection conn = getConnection();
		List<MovieStillLHJ> ms = new MovieDao().selectMovieStill(conn, movieNo);
		
		close(conn);
		return ms;
	}
	
  
	public List<Movie> selectScreen(String theaterNo, String screenDate, String lineUp) {
		Connection conn = getConnection();
		
		List<Movie> list = new MovieDao().selectScreen(conn, theaterNo, screenDate, lineUp);
	
		close(conn);
		return list;
	}
	
	


	/** 2. 메인화면에서 보여줄 예매율 상위5위 (SUJIN)
	 * @param num 포스터 Level
	 * @return
	 */
	public List<TopMovieDto> topFiveMovies(int num){
		Connection conn = getConnection();
		
		List<TopMovieDto> tmd = new MovieDao().topFiveMovies(conn, num);
		
		close(conn);
		return tmd;
	}
	
	/** 3. 메인화면에서 보여줄 상영예정작 (SUJIN)
	 * @return
	 */
	public List<NewMoviesDto> newMovies(){
		Connection conn = getConnection();
		
		List<NewMoviesDto> nm = new MovieDao().newMovies(conn);
		
		close(conn);
		
		return nm;
	}
	
	
  /* CBS */
	public int insertMovie(MovieCBS mv, String[] genres, ArrayList<StillImageCBS> list) {
		
		Connection conn = getConnection();
		
		int result1 = new MovieDao().insertMovie(conn,mv);
		
		int result2 = new MovieDao().insertMovieGenre(conn,genres);
		
		int result3 = new MovieDao().InsertStillImage(conn,list);
		
		
		if(result1*result2*result3 ==0) {
			commit(conn);
		
		}else {
			
			rollback(conn);
		}
		close(conn);
		return result1*result2*result3;
	}
	
	public int getOnListCount() {
		
		Connection conn = getConnection();

		int listCount = new MovieDao().getOnListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<MovieCBS> selectOnList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<MovieCBS> list = new MovieDao().selectOnList(conn,pi);
	
		close(conn);
		
		return list;

	}
	
	public ArrayList<MovieCBS> selectComingList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<MovieCBS> list = new MovieDao().selectComingList(conn,pi);
		
		close(conn);
		
		return list;
		
	}
	
	public int getComingListCount() {
		
		Connection conn = getConnection();

		int listCount = new MovieDao().getComingListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public int getOffListCount() {

		Connection conn = getConnection();

		int listCount = new MovieDao().getOffListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Movie> selectOffList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Movie> list = new MovieDao().selectOffList(conn,pi);
		
		close(conn);
		
		return list;
	}
	
	
}
