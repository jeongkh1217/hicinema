package hicinema.snc.vo;

import java.sql.Date;

public class SnCgetset {
	String movieid;
	int sncno;
	String id;
	int starrating;
	String comment;
	int commentlike;
	Date writtendatetime;
	public String getMovieid() {
		return movieid;
	}
	public void setMovieid(String movieid) {
		this.movieid = movieid;
	}
	public int getSncno() {
		return sncno;
	}
	public int getCommentlike() {
		return commentlike;
	}
	public void setCommentlike(int commentlike) {
		this.commentlike = commentlike;
	}
	public void setSncno(int sncno) {
		this.sncno = sncno;
	}
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	public int getStarrating() {
		return starrating;
	}
	public void setStarrating(int starrating) {
		this.starrating = starrating;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getWrittendatetime() {
		return writtendatetime;
	}
	public void setWrittendatetime(Date writtendatetime) {
		this.writtendatetime = writtendatetime;
	}


}
