package hicinema.movie;

import java.sql.Connection;
import hicinema.movie.vo.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Indexmoviegenre {
	Connection conn = null;
	Statement stmt = null;

	public void con() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_pf_jkh", "root", "1234");
		stmt = conn.createStatement();
	}

	public void discon() {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {
		}
	}

	public ArrayList<Moviegetset> indexgenre1(String genre1) throws Exception {
		
		ArrayList<Moviegetset> arr = new ArrayList<Moviegetset>();
		try {
			con();
			ResultSet rs = stmt.executeQuery("select*from movie where genre like concat"
											 + "('%','"+genre1+ "','%') order by rand();");
			while (rs.next()) {
				Moviegetset movietable = new Moviegetset();
				movietable.setMovieid(rs.getString("movieid"));
				movietable.setMovietitle(rs.getString("movietitle"));
				movietable.setDirector(rs.getString("director"));
				movietable.setStarring(rs.getString("starring"));
				movietable.setGenre(rs.getString("genre"));
				movietable.setSynopsis(rs.getString("synopsis"));
				movietable.setRunningtime(rs.getString("runningtime"));
				movietable.setRating(rs.getString("rating"));
				movietable.setReleasedate(rs.getString("releasedate"));
				movietable.setTotalview(rs.getInt("totalview"));
				movietable.setRatingvalue(rs.getDouble("ratingvalue"));
				arr.add(movietable);
			}
		} finally {
			discon();
		}
		return arr;
	}

	public ArrayList<Moviegetset> indexgenre2(String genre2) throws Exception {
		ArrayList<Moviegetset> arr = new ArrayList<Moviegetset>();
		try {
			con();
			ResultSet rs = stmt.executeQuery("select*from movie where genre like concat('%','" + genre2 + "','%') order by rand();");
			while (rs.next()) {
				Moviegetset movietable = new Moviegetset();
				movietable.setMovieid(rs.getString("movieid"));
				movietable.setMovietitle(rs.getString("movietitle"));
				movietable.setDirector(rs.getString("director"));
				movietable.setStarring(rs.getString("starring"));
				movietable.setGenre(rs.getString("genre"));
				movietable.setSynopsis(rs.getString("synopsis"));
				movietable.setRunningtime(rs.getString("runningtime"));
				movietable.setRating(rs.getString("rating"));
				movietable.setReleasedate(rs.getString("releasedate"));
				movietable.setTotalview(rs.getInt("totalview"));
				movietable.setRatingvalue(rs.getDouble("ratingvalue"));
				arr.add(movietable);
			}
		} finally {
			discon();
		}
		return arr;
	}
}