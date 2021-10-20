package model;

import java.sql.Date;

public class Transaction {

	private String uname;
	private float amt;
	private String t_type;
	private Date t_time;
	
	public Transaction(String uname, float amt, String t_type) {
		super();
		this.uname = uname;
		this.amt = amt;
		this.t_type = t_type;
	}
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public float getAmt() {
		return amt;
	}
	public void setAmt(float amt) {
		this.amt = amt;
	}
	public String getT_type() {
		return t_type;
	}
	public void setT_type(String t_type) {
		this.t_type = t_type;
	}
	public Date getT_time() {
		return t_time;
	}
	public void setT_time(Date date) {
		this.t_time = date;
	}			
}
