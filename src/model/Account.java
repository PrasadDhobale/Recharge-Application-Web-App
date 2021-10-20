package model;

import java.sql.Date;

public class Account {
	
	private String uname;
	private int accno;
	private float accbal;
	private Date dati;
	public Account(String uname, int accno, float accbal) {
		super();
		this.uname = uname;
		this.accno = accno;
		this.accbal = accbal;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getAccno() {
		return accno;
	}
	public void setAccno(int accno) {
		this.accno = accno;
	}
	public float getAccbal() {
		return accbal;
	}
	public void setAccbal(float accbal) {
		this.accbal = accbal;
	}
	public Date getDati() {
		return dati;
	}
	public void setDati(Date dati) {
		this.dati = dati;
	}
}
