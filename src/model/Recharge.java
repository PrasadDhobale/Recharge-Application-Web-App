package model;

import java.sql.Date;

public class Recharge {
	
	private String uname;
	private String mn;
	private String sp;
	private String circle;
	private float ramt;
	private Date r_date;

	public Recharge(String uname, String mn, String sp, String circle, float ramt) {
		super();
		this.uname = uname;
		this.mn = mn;
		this.sp = sp;
		this.circle = circle;
		this.ramt = ramt;
	}
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getMn() {
		return mn;
	}
	public void setMn(String mn) {
		this.mn = mn;
	}
	public String getSp() {
		return sp;
	}
	public void setSp(String sp) {
		this.sp = sp;
	}
	public String getCircle() {
		return circle;
	}
	public void setCircle(String circle) {
		this.circle = circle;
	}
	public float getRamt() {
		return ramt;
	}
	public void setRamt(float ramt) {
		this.ramt = ramt;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
}
