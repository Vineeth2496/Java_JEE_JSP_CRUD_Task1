package com.data;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Vector;

import javax.sql.rowset.JdbcRowSet;
import javax.sql.rowset.RowSetFactory;
import javax.sql.rowset.RowSetProvider;


public class Data_logics {
	public static Connection mycon()
	{
		Connection con=null;
		try
		{
		FileInputStream fi=new FileInputStream("C:\\Users\\vinee\\OneDrive\\Desktop\\Java\\Practice\\Collections Frame Works\\com.jsptask1\\jdbc.properties");
		Properties p=new Properties();
		p.load(fi);
		Class.forName(p.getProperty("jdbc.driver")).newInstance();
		con=DriverManager.getConnection(p.getProperty("jdbc.url"), p.getProperty("jdbc.username"), p.getProperty("jdbc.password"));
		System.out.println(con);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return con;
	}
	
	public int register_logic(Data d)
	{
		Connection con= Data_logics.mycon();
		int res=0;
		try {
			PreparedStatement pst=con.prepareStatement("insert into admin values(?,?,?,?,?,?,?,?)");
			pst.setString(1, d.getFirstname());
			pst.setString(2, d.getLastname());
			pst.setString(3, d.getEmail());
			pst.setString(4, d.getRegno());
			pst.setString(5, d.getPassword());
			pst.setString(6, d.getStdcode());
			pst.setString(7, d.getPhoneno());
			pst.setString(8, d.getGender());
			
			int i=pst.executeUpdate();
			res=i;
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	return res;	
	}
	
	public Vector login_logics()
	{
		Vector v=new Vector();
		try
		{
			FileInputStream fi=new FileInputStream("C:\\Users\\vinee\\OneDrive\\Desktop\\Java\\Practice\\Collections Frame Works\\com.jsptask1\\jdbc.properties");
			Properties p=new Properties();
			p.load(fi);
			Class.forName(p.getProperty("jdbc.driver"));
			RowSetFactory rs=RowSetProvider.newFactory();
			JdbcRowSet jr=rs.createJdbcRowSet();
			jr.setUrl(p.getProperty("jdbc.url"));
			jr.setUsername(p.getProperty("jdbc.username"));
			jr.setPassword(p.getProperty("jdbc.password"));
			jr.setCommand("select regno,password from admin");
			jr.execute();
			for(;jr.next();)
			{
				v.add(jr.getString("regno"));
				v.add(jr.getString("password"));
			}
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return v;
	}
	
	public Vector profile_logics(Data d)
	{
		Vector v=new Vector();
		try
		{
			FileInputStream fi=new FileInputStream("C:\\Users\\vinee\\OneDrive\\Desktop\\Java\\Practice\\Collections Frame Works\\com.jsptask1\\jdbc.properties");
			Properties p=new Properties();
			p.load(fi);
			Class.forName(p.getProperty("jdbc.driver"));
			RowSetFactory rf=RowSetProvider.newFactory();
			JdbcRowSet jr=rf.createJdbcRowSet();
			jr.setUrl(p.getProperty("jdbc.url"));
			jr.setUsername(p.getProperty("jdbc.username"));
			jr.setPassword(p.getProperty("jdbc.password"));
			jr.setCommand("select * from admin where regno=?");
			jr.setString(1, d.getRegno());
			jr.execute();
			
			for(;jr.next();)
			{
				d.setFirstname(jr.getString("firstname"));
				d.setLastname(jr.getString("lastname"));
				d.setEmail(jr.getString("email"));
				d.setRegno(jr.getString("regno"));
				d.setPassword(jr.getString("password"));
				d.setStdcode(jr.getString("stdcode"));
				d.setPhoneno(jr.getString("phoneno"));
				d.setGender(jr.getString("gender"));
				v.add(d);
			}
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return v;
	}
	
	public Vector Edit_return(Data d)
	{
		Vector v=new Vector();
		try
		{

			FileInputStream fi=new FileInputStream("C:\\Users\\vinee\\OneDrive\\Desktop\\Java\\Practice\\Collections Frame Works\\com.jsptask1\\jdbc.properties");
			Properties p=new Properties();
			p.load(fi);
			Class.forName(p.getProperty("jdbc.driver"));
			RowSetFactory rf=RowSetProvider.newFactory();
			JdbcRowSet jr=rf.createJdbcRowSet();
			jr.setUrl(p.getProperty("jdbc.url"));
			jr.setUsername(p.getProperty("jdbc.username"));
			jr.setPassword(p.getProperty("jdbc.password"));
			jr.setCommand("select * from admin where regno=?");
			jr.setString(1, d.getRegno());
			jr.execute();
			for(;jr.next();)
			{
				d.setFirstname(jr.getString("firstname"));
				d.setLastname(jr.getString("lastname"));
				d.setEmail(jr.getString("email"));
				d.setRegno(jr.getString("regno"));
				d.setPassword(jr.getString("password"));
				d.setStdcode(jr.getString("stdcode"));
				d.setPhoneno(jr.getString("phoneno"));
				d.setGender(jr.getString("gender"));
				v.add(d);
			}
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return v;
		
	}
	
	public int Edit_logics(Data d)
	{
		Connection con=Data_logics.mycon();
		int r=0;
		try
		{
			PreparedStatement pst=con.prepareStatement("update admin set Firstname=?, Lastname=?, Email=?, Regno=?, Password=?, Stdcode=?,  Phoneno=?, Gender=? where Regno=?");
			pst.setString(1, d.getFirstname());
			pst.setString(2, d.getLastname());
			pst.setString(3, d.getEmail());
			pst.setString(4, d.getRegno());
			pst.setString(5, d.getPassword());
			pst.setString(6, d.getStdcode());
			pst.setString(7, d.getPhoneno());
			pst.setString(8, d.getGender());
			pst.setString(9, d.getRegno());
			int i=pst.executeUpdate();
			
			r=i;
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return r;
	}
	
	
	public int Delete_logics(Data d)
	{
		Connection con=Data_logics.mycon();
		int r=0;
		try
		{
			PreparedStatement pst=con.prepareStatement("delete from admin where Regno=?");
			pst.setString(1, d.getRegno());
			int i=pst.executeUpdate();
			
			r=i;
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return r;
	}
	
	
	public int admin_register(Data d)
	{
		int res=0;
		Connection con=Data_logics.mycon();
		System.out.println(con);
		try
		{
			PreparedStatement pst=con.prepareStatement("insert into admins values(?,?,?,?,?)");
			pst.setString(1, d.getFirstname());
			pst.setString(2, d.getLastname());
			pst.setString(3, d.getEmail());
			pst.setString(4, d.getRegno());
			pst.setString(5, d.getPassword());
			int i=pst.executeUpdate();
			res=i;
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}
	
	public Vector Admin_login_logics()
	{
		Vector v=new Vector();
		try
		{
			FileInputStream fi=new FileInputStream("C:\\Users\\vinee\\OneDrive\\Desktop\\Java\\Practice\\Collections Frame Works\\com.jsptask1\\jdbc.properties");
			Properties p=new Properties();
			p.load(fi);
			Class.forName(p.getProperty("jdbc.driver"));
			RowSetFactory rs=RowSetProvider.newFactory();
			JdbcRowSet jr=rs.createJdbcRowSet();
			jr.setUrl(p.getProperty("jdbc.url"));
			jr.setUsername(p.getProperty("jdbc.username"));
			jr.setPassword(p.getProperty("jdbc.password"));
			jr.setCommand("select regno,password from admins");
			jr.execute();
			for(;jr.next();)
			{
				v.add(jr.getString("regno"));
				v.add(jr.getString("password"));
			}
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return v;
	}

	public static List<Data> fetchAll()
	{
		List<Data> list= new ArrayList<Data>();
		try 
		{
			FileInputStream fi=new FileInputStream("C:\\Users\\vinee\\OneDrive\\Desktop\\Java\\Practice\\Collections Frame Works\\com.jsptask1\\jdbc.properties");
			Properties p=new Properties();
			p.load(fi);
			Class.forName(p.getProperty("jdbc.driver"));
			RowSetFactory rf=RowSetProvider.newFactory();
			JdbcRowSet jr=rf.createJdbcRowSet();
			jr.setUrl(p.getProperty("jdbc.url"));
			jr.setUsername(p.getProperty("jdbc.username"));
			jr.setPassword(p.getProperty("jdbc.password"));
			jr.setCommand("select * from admin");
			jr.execute();
			
			for(;jr.next();)
			{
				Data d=new Data();
				
				d.setFirstname(jr.getString("firstname"));
				d.setLastname(jr.getString("lastname"));
				d.setEmail(jr.getString("email"));
				d.setRegno(jr.getString("regno"));
				d.setPassword(jr.getString("password"));
				d.setStdcode(jr.getString("stdcode"));
				d.setPhoneno(jr.getString("phoneno"));
				d.setGender(jr.getString("gender"));
				list.add(d);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
//	public Vector Admin_Fetch_logics(Data d)
//	{
//		Vector v=new Vector();
//		try
//		{
//			FileInputStream fi=new FileInputStream("C:\\Users\\vinee\\OneDrive\\Desktop\\Java\\Practice\\Collections Frame Works\\com.jsptask1\\jdbc.properties");
//			Properties p=new Properties();
//			p.load(fi);
//			Class.forName(p.getProperty("jdbc.driver"));
//			RowSetFactory rf=RowSetProvider.newFactory();
//			JdbcRowSet jr=rf.createJdbcRowSet();
//			jr.setUrl(p.getProperty("jdbc.url"));
//			jr.setUsername(p.getProperty("jdbc.username"));
//			jr.setPassword(p.getProperty("jdbc.password"));
//			jr.setCommand("select * from admin");
//			
//			jr.execute();
//			for(;jr.next();)
//			{
//				d.setFirstname(jr.getString("firstname"));
//				d.setLastname(jr.getString("lastname"));
//				d.setEmail(jr.getString("email"));
//				d.setRegno(jr.getString("regno"));
//				d.setPassword(jr.getString("password"));
//				d.setStdcode(jr.getString("stdcode"));
//				d.setPhoneno(jr.getString("phoneno"));
//				d.setGender(jr.getString("gender"));
//				v.add(d);
//				
//			}
//			
//		}
//		catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		return v;
//	}
	
	public Vector Admin_Edit_return_logics(Data d)
	{
		Vector v=new Vector();
		try
		{

			FileInputStream fi=new FileInputStream("C:\\Users\\vinee\\OneDrive\\Desktop\\Java\\Practice\\Collections Frame Works\\com.jsptask1\\jdbc.properties");
			Properties p=new Properties();
			p.load(fi);
			Class.forName(p.getProperty("jdbc.driver"));
			RowSetFactory rf=RowSetProvider.newFactory();
			JdbcRowSet jr=rf.createJdbcRowSet();
			jr.setUrl(p.getProperty("jdbc.url"));
			jr.setUsername(p.getProperty("jdbc.username"));
			jr.setPassword(p.getProperty("jdbc.password"));
			jr.setCommand("select * from admin where regno=?");
			jr.setString(1, d.getRegno());
			jr.execute();
			for(;jr.next();)
			{
				d.setFirstname(jr.getString("firstname"));
				d.setLastname(jr.getString("lastname"));
				d.setEmail(jr.getString("email"));
				d.setRegno(jr.getString("regno"));
				d.setPassword(jr.getString("password"));
				d.setStdcode(jr.getString("stdcode"));
				d.setPhoneno(jr.getString("phoneno"));
				d.setGender(jr.getString("gender"));
				v.add(d);
			}
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return v;
	}

	public int Admin_Edit_logics(Data d)
	{
		int res=0;
		Connection con=Data_logics.mycon();
		//System.out.println(con);
		try 
		{
		PreparedStatement pst=con.prepareStatement("update admin set firstname=?, lastname=?, email=?, regno=?, password=?, stdcode=?, phoneno=?, gender=? where regno=?");
		pst.setString(1, d.getFirstname());
		pst.setString(2, d.getLastname());
		pst.setString(3, d.getEmail());
		pst.setString(4, d.getRegno());
		pst.setString(5, d.getPassword());
		pst.setString(6, d.getStdcode());
		pst.setString(7, d.getPhoneno());
		pst.setString(8, d.getGender());
		pst.setString(9, d.getRegno());
		
		res=pst.executeUpdate();
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}
	
	public int Admin_Delete_logics(Data d)
	{
		Connection con=Data_logics.mycon();
		int r=0;
		try
		{
			PreparedStatement pst=con.prepareStatement("delete from admin where Regno=?");
			pst.setString(1, d.getRegno());
			int i=pst.executeUpdate();
			r=i;
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return r;
	}
	
	
}
