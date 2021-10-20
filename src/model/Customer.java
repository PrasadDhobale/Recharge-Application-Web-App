package model;

import java.io.InputStream;
import java.sql.Date;

public class Customer {
	
	private String fname;
	private String lname;
	private int age;
	private String gender;	
	private String mobno;
	private String email;
	private String uname;
	private String passwd;
	private Date dati;
	private InputStream proimg;
	
	public Customer(String fname, String lname, int age, String gender, String mobno, String email, String uname,String passwd) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.age = age;
		this.gender = gender;
		this.mobno = mobno;
		this.email = email;
		this.uname = uname;
		this.passwd = passwd;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMobno() {
		return mobno;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getDati() {
		return dati;
	}
	public void setDati(Date dati) {
		this.dati = dati;
	}
	
	
}