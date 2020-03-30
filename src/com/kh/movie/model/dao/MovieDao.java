package com.kh.movie.model.dao;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.menubar.controller.NewMoviesDto;
import com.kh.menubar.controller.TopMovieDto;
import com.kh.movie.model.vo.Movie;
import com.kh.movie.model.vo.MovieCBS;
import com.kh.movie.model.vo.MovieLHJ;
import com.kh.movie.model.vo.MovieStillLHJ;
import com.kh.movie.model.vo.PageInfo;
import com.kh.still_image.model.vo.StillImageCBS;


public class MovieDao {
	Properties prop = new Properties();
	public MovieDao(){ 
		String fileName = MovieDao.class.getResource("/sql/movie/movie-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
  
 
	
	/* hajin */
	public MovieLHJ selectList(Connection conn, int movieNo){
		
		MovieLHJ m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movieNo);	
			rset = pstmt.executeQuery();
		
			if(rset.next()) {
				m = new MovieLHJ(rset.getInt("MOVIE_NO"),
								   rset.getString("TITLE"),
								   rset.getInt("RUNTIME"),
								   rset.getString("DIRECTOR"),
								   rset.getString("ACTOR"),
								   rset.getInt("AGE_LIMIT"),
								   rset.getString("SYNOPSIS"),
								   rset.getDate("ON_DATE"),
								   rset.getString("STATUS"),
								   rset.getDate("OFF_DATE"),
								   rset.getString("MODIFY_NAME"));
			}
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
			return m;
		
	}
	
	public List<MovieStillLHJ> selectMovieStill(Connection conn ,int movieNo) {
			
			
			List<MovieStillLHJ> ms = new ArrayList<>();
		
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectStill");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, movieNo);
				rset = pstmt.executeQuery();
			
				while(rset.next()) {
					ms.add(new MovieStillLHJ(rset.getInt("MOVIE_NO"),
											 rset.getString("MODIFY_NAME")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return ms;
			
			
			
			
		}
		

  
	
	/** 1. 5�쐞 �쁺�솕 議고쉶 (硫붿씤)
	 * @param conn
	 * @param num
	 * @return
	 */
	public List<TopMovieDto> topFiveMovies(Connection conn, Integer num) {
		List<TopMovieDto> tmd = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("topFiveMovies");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
		
			rset = pstmt.executeQuery();
			while(rset.next()) {
				tmd.add(new TopMovieDto(rset.getInt("MOVIE_NO"),rset.getInt("COUNT"),
								rset.getInt("MAXNO"),rset.getString("MODIFY_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return tmd;
	}

	
	/** 2. �떊�옉裕ㅻ퉬 由ъ뒪�듃 議고쉶 (硫붿씤)
	 * @param conn
	 * @return
	 */
	public List<NewMoviesDto> newMovies(Connection conn) {
		List<NewMoviesDto> nm = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("newMovies");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				nm.add(new NewMoviesDto(rset.getInt("MOVIE_NO"), rset.getDate("ON_DATE"),
						rset.getInt("AGE_LIMIT"), rset.getString("TITLE"), rset.getString("MODIFY_NAME")));
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return nm;
	}
		
	
	public List<Movie> selectScreen(Connection conn, String theaterNo, String screenDate, String lineUp) {
		List<Movie> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectS");
		sql += " ORDER BY " + screenOrderBy(lineUp);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, theaterNo);
			pstmt.setString(2, screenDate);

			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Movie(rset.getInt("MOVIE_NO"), rset.getString("TITLE"), rset.getInt("AGE_LIMIT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	private String screenOrderBy(String lineUp) {
		switch (lineUp) {
		case "2":
			return "TITLE";
		case "3":
			return "AGE_LIMIT";
		case "4":
			return "ON_DATE";
		}
		throw new RuntimeException("Not Support lineUp");
	}
	
	/* CBS*/
	public int insertMovie(Connection conn, MovieCBS mv) {
		
		int result=0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMovie");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mv.getModifyName());
			pstmt.setString(2, mv.getTitle());
			pstmt.setString(3, mv.getDirector());
			pstmt.setString(4, mv.getActor());
			pstmt.setDate(5, mv.getOnDate());
			pstmt.setInt(6, mv.getRuntime());
			pstmt.setInt(7, mv.getAgeLimit());
			pstmt.setString(8, mv.getSynopsis());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int insertMovieGenre(Connection conn, String[] genres) {
	
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMovieGenre");
		
		try {
			
			for(int i=0;i<genres.length;i++) {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, genres[i]);
			
			result=pstmt.executeUpdate();
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int InsertStillImage(Connection conn, ArrayList<StillImageCBS> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertStillImage");
		
			
			try {
				for(int i=0;i<list.size(); i++) {
				pstmt = conn.prepareStatement(sql);
				
				StillImageCBS si = list.get(i);
				
				pstmt.setString(1, si.getOriginName());
				pstmt.setString(2, si.getModifyName());
				
				if(i == 0) {
					pstmt.setInt(3, 2);
				}else {
					pstmt.setInt(3, 1);
				}
				pstmt.setString(4, si.getSavePath());
				
				result = pstmt.executeUpdate();
				
				if(result ==0) {
					close(pstmt);
					return 0;
				}
			}
				
			} catch (SQLException e) {
			
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			return result;
	
	}
	
	public int getOnListCount(Connection conn) {
		
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getOnListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}
	
public ArrayList<MovieCBS> selectOnList(Connection conn, PageInfo pi){
		
		ArrayList<MovieCBS> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOnList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new MovieCBS(rset.getInt("movie_no"),
								   rset.getString("title"),
								   rset.getInt("runtime"),
								   rset.getString("director"),
								   rset.getString("actor"),
								   rset.getInt("age_limit"),
								   rset.getString("synopsis"),
								   rset.getDate("on_date"),
								   rset.getString("modify_name")));
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

public ArrayList<MovieCBS> selectComingList(Connection conn, PageInfo pi){
	
	ArrayList<MovieCBS> list = new ArrayList<>();
	
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectComingList");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			
			list.add(new MovieCBS(rset.getInt("movie_no"),
							   rset.getString("title"),
							   rset.getInt("runtime"),
							   rset.getString("director"),
							   rset.getString("actor"),
							   rset.getInt("age_limit"),
							   rset.getString("synopsis"),
							   rset.getDate("on_date"),
							   rset.getString("modify_name")));
		}
		
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}finally {
		
		close(rset);
		close(pstmt);
	}
	return list;
}

public int getComingListCount(Connection conn) {
	
	int listCount = 0;
	
	Statement stmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("getComingListCount");
	
	try {
		stmt = conn.createStatement();
		
		rset = stmt.executeQuery(sql);
		
		if(rset.next()) {
			listCount = rset.getInt(1);
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(stmt);
	}
	
	return listCount;
}

public int getOffListCount(Connection conn) {

	int listCount = 0;
	
	Statement stmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("getOffListCount");
	
	try {
		stmt = conn.createStatement();
		
		rset = stmt.executeQuery(sql);
		
		if(rset.next()) {
			listCount = rset.getInt(1);
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(stmt);
	}
	
	return listCount;

}

public ArrayList<Movie> selectOffList(Connection conn, PageInfo pi) {
	
	ArrayList<Movie> list = new ArrayList<>();
	
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectOffList");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			
			list.add(new Movie(rset.getInt("movie_no"),
							   rset.getString("title"),
							   rset.getInt("runtime"),
							   rset.getInt("age_limit"),
							   rset.getDate("on_date")));
		}
		
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}finally {
		
		close(rset);
		close(pstmt);
	}
	return list;
}


  

}
