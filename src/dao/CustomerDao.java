package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;
import java.util.List;

import oracle.jdbc.proxy.annotation.Pre;
import model.*;

public class CustomerDao {	
	Database db = new Database();
	static Connection con=null;
	private PreparedStatement ps;	

//	public static String encrypt(String pass) {
//		char[] ch = new char[pass.length()];
//		for(int i=0;i<pass.length();i++) {
//			ch[i] = pass.charAt(i);
//		}
//		String enpass = String.valueOf(ch);
//		char[] ch2 = new char[pass.length()];			
//		for(int i=0;i<enpass.length();i++) {
//			ch2[i] += ch[i]+'p';
//		}
//		enpass = String.valueOf(ch2);
//		System.out.println("In Encryption : "+enpass);
//		return enpass;
//	}
//
//	public static String decrypt(String pass) {
//		char []ch = new char[pass.length()];
//		for(int i=0;i<pass.length();i++) {
//			ch[i] = pass.charAt(i);
//		}
//		String enpass = String.valueOf(ch);
//		char []ch2 = new char[pass.length()];			
//		for(int i=0;i<enpass.length();i++) {
//			ch2[i] += ch[i]-'p';
//		}
//		enpass = String.valueOf(ch2);
//		System.out.println("In Decryption : "+enpass);
//		return enpass;
//	}

	public int RegisterCust(Customer cust) {
		con = db.getConnection();
		int flag = 0;
		try{
			ps=con.prepareStatement("insert into mis1customer values(?,?,?,?,?,?,?,?,systimestamp)");
			ps.setString(1,cust.getFname());
			ps.setString(2,cust.getLname());
			ps.setInt(3,cust.getAge());
			ps.setString(4, cust.getGender());
			ps.setString(5, cust.getMobno());
			ps.setString(6,cust.getEmail());
			ps.setString(7,cust.getUname());
			
			ps.setString(8,cust.getPasswd());

			int i=ps.executeUpdate();
			if(i>0){
				flag = 1;
			}
		}
		catch(Exception e){
			System.out.println(e);
		}		
		return flag;
	}
	public Customer Login(String uname,String pass) {		
		con=db.getConnection();
		Customer c = null;
		try{			
			System.out.println("Before Check "+uname+"\t"+pass);
			PreparedStatement ps = con.prepareStatement("Select * from mis1customer where username = ? and password= ?");
			ps.setString(1, uname);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			if(rs.next() == false) {
				c = null;
			}else {
				//System.out.println("Logged In");
				System.out.println(rs.getString(7));
				c = new Customer(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4), rs.getString(5),rs.getString(6), rs.getString(7),pass);
				c.setDati(rs.getDate(9));
				System.out.println(rs.getString(1));
			}
		}
		catch(Exception ex){
			System.out.println(ex);
		}
		return c;
	}
	public Customer Search(String uname) {		
		con=db.getConnection();
		Customer cust = null;
		try{			
			PreparedStatement ps = con.prepareStatement("Select * from  mis1customer where username = ?");
			ps.setString(1, uname);
			ResultSet rs = ps.executeQuery();
			if(rs.next() == false) {
				cust = null;
			}else {
				do {
					cust = new Customer(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4), rs.getString(5),rs.getString(6), rs.getString(7),rs.getString(8));
					cust.setDati(rs.getDate(9));
				}while(rs.next());
			}
		}
		catch(Exception ex){
			System.out.println(ex);
		}
		return cust;
	}
	public boolean Deleteuser(String uname,String pass) {
		boolean b = false;
		con=db.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("Delete From mis1customer Where username = ? and password = ?");			
			ps.setString(1, uname);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			if(rs.next() ==false ) {
				b = false;
			}else {
				b = true;
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	public int checkuser(String uname) {
		int f = 0;
		con =db.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select username from mis1customer where username = ?");
			ps.setString(1, uname);			
			f = ps.executeUpdate();
			if(f > 0) {
				System.out.println("Username Already Exist");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return f;
	}
	public LinkedList<Customer> AllCustomer() {
		LinkedList<Customer> cust=new LinkedList<Customer>();

		con=db.getConnection();		
		try{
			String str="select * from mis1customer";
			PreparedStatement ps = con.prepareStatement(str);
			ResultSet rs = ps.executeQuery();
			if (rs.next() == false) { 
				//System.out.println("ResultSet in empty in Java");
				cust = null;				
			} else { 
				do {
					Customer  c1 = null;
					c1 = new Customer(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4), rs.getString(5),rs.getString(6), rs.getString(7),rs.getString(8));
					c1.setDati(rs.getDate(9));
					cust.add(c1);
				}while (rs.next()); 
			}			
		}
		catch(Exception ex){
			System.out.println(ex);
		}
		return cust;
	}	
	
	public int updateCust(String fname,String lname,int age,String email,String uname,String pass) {
		con = db.getConnection();
		int i=0;
		
		try {
			PreparedStatement ps = con.prepareStatement("update mis1customer set cfname = ?,clname=?,age=?,email=?,password=? where username = ?");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setInt(3, age);
			ps.setString(4, email);
			ps.setString(5, pass);			
			ps.setString(6, uname);
			System.out.println(fname+"\t"+lname+"\t"+age+"\t"+email+"\t"+uname+"\t"+pass);
			i = ps.executeUpdate();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}	
	public int checkpass(String uname,String pass) {
		int i = 0;
		con = db.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select username from mis1customer where username = ? and password = ?");
			ps.setString(1, uname);
			ps.setString(2, pass);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}				
		return i;
	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	public int checkAccount(String uname) {
		int i = 0;
		con = db.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select username from mis1account where username = ?");
			ps.setString(1, uname);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	public int checkAccno(int accno) {
		int i = 0;
		con = db.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select username from mis1account where accno = ?");
			ps.setInt(1, accno);
			i = ps.executeUpdate();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public int createAccount(Account a) {
		int f = 0;
		
		con = db.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("insert into mis1account values (?,?,?,systimestamp)");
			ps.setString(1, a.getUname());
			ps.setInt(2, a.getAccno());
			ps.setFloat(3, a.getAccbal());
			
			f = ps.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}
	public double getbal(String uname) {		
		double accbal = 0;
		con = db.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select accbal from mis1account where username = ?");
			ps.setString(1, uname);
			ResultSet rs = ps.executeQuery();
			if(rs.next() == false) {
				accbal = 0;
			}else {
				accbal = rs.getDouble(1);
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		return accbal;
	}
	public Account getacc(String uname) {		
		Account a = null;		
		con = db.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from mis1account where username = ?");
			ps.setString(1, uname);
			ResultSet rs = ps.executeQuery();
			if(rs.next() == false) {
				a = null;
			}else {
				a = new Account(rs.getString(1), rs.getInt(2), rs.getFloat(3));
				a.setDati(rs.getDate(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;
	}
	public int recharge(String uname,String mn,String sp,String circle,float ramt) {
		int i = 0;
		con = db.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("update mis1account set accbal = accbal - ? where username = ?");
			ps.setFloat(1, ramt);
			ps.setString(2, uname);
			i = ps.executeUpdate();			
			if(i > 0) {				
				PreparedStatement ps2 = con.prepareStatement("insert into mis1recharge values (?,?,?,?,?,systimestamp)");
				ps2.setString(1, uname);
				ps2.setString(2, mn);
				ps2.setString(3, sp);
				ps2.setString(4, circle);
				ps2.setFloat(5, ramt);
				
				i = ps2.executeUpdate();				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return i;
	}
	public int depositamt(String uname,float damt) {
		int f = 0;
		con = db.getConnection();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("update mis1account set accbal = accbal + ? where username = ?");
			ps.setFloat(1, damt);
			ps.setString(2, uname);
			f = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return f;
	}
	public int withamt(String uname,float wamt) {
		int f = 0;
		con = db.getConnection();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("update mis1account set accbal = accbal - ? where username = ?");
			ps.setFloat(1, wamt);
			ps.setString(2, uname);
			f = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return f;
	}
	public int Deleteacc(String uname) {		
		int i =0;
		con = db.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("delete from mis1account where username = ?");
			ps.setString(1, uname);
			i = ps.executeUpdate();
			if(i>0) {
				PreparedStatement ps2 =con.prepareStatement("delete from mis1recharge where username = ?");
				ps2.setString(1, uname);
				ps2.execute();
				PreparedStatement ps3 = con.prepareStatement("delete from mis1transaction where username = ?");
				ps3.setString(1, uname);
				ps3.execute();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return i;
	}
	public List<Recharge> rechhstory(String uname) {		
		List<Recharge> rlist = new LinkedList<Recharge>();
		con = db.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select *from mis1recharge where username = ?");
			ps.setString(1, uname);
			ResultSet rs = ps.executeQuery();
			if(rs.next() == false) {
				rlist = null; 
			}else {				
				do {
					Recharge rech = new Recharge(rs.getString(1),rs.getString(2), rs.getString(3), rs.getString(4),rs.getInt(5));
					rech.setR_date(rs.getDate(6));
					System.out.println(rs.getString(5));
					rlist.add(rech);
				}while(rs.next());				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return rlist;
	}
	public int Transaction (Transaction t) {
		con = db.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("Insert into mis1transaction values(?,?,?,systimestamp)");
			ps.setString(1, t.getUname());
			ps.setFloat(2,t.getAmt());
			ps.setString(3, t.getT_type());
			
			int i = ps.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;		
	}
	public List<Transaction> transhistory(String uname){
		List<Transaction> tlist = new LinkedList<Transaction>();
		con = db.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select *from mis1transaction where username = ?");
			ps.setString(1, uname);
			ResultSet rs = ps.executeQuery();
			if(rs.next() == false) {
				tlist = null;
			}else {
				do {
					Transaction t = new Transaction(rs.getString(1), rs.getFloat(2), rs.getString(3));
					t.setT_time(rs.getDate(4));
					tlist.add(t);
				}while(rs.next());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return tlist;
	}
}