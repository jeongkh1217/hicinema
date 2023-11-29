package hicinema.reservation.vo;

import java.time.LocalDateTime;

public class Reservationgetset {
	String reservationid;
	String id;
	String theater;
	String date;
	String time;
	String seat;
	String payby;
	String paydate;
	public String getReservationid() {
		return reservationid;
	}
	public void setReservationid(String reservationid) {
		this.reservationid = reservationid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTheater() {
		return theater;
	}
	public void setTheater(String theater) {
		this.theater = theater;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getPayby() {
		return payby;
	}
	public void setPayby(String payby) {
		this.payby = payby;
	}
	public String getPaydate() {
		return paydate;
	}
	public void setPaydate(String string) {
		this.paydate = string;
	}

}
