package model;

import java.sql.ResultSet;

import dao.DBConnect;

public class RegModel {


		 private String name;
		 private String email;
		 private String pass;
		 private String mobile;

		 public RegModel(String n, String e, String p, String m) {
		  this.name = n;
		  this.email = e;
		  this.pass = p;
		  this.mobile = m;

		 }

		 public RegModel(String e, String p) {
			
			  this.email = e;
			  this.pass = p;
		

			 }

		 public String getName() {
		  return name;
		 }

		 public void setName(String name) {
		  this.name = name;
		 }

		 public String getEmail() {
		  return email;
		 }

		 public void setEmail(String email) {
		  this.email = email;
		 }

		 public String getPass() {
		  return pass;
		 }

		 public void setPass(String pass) {
		  this.pass = pass;
		 }

		 public String getMobile() {
		  return mobile;
		 }

		 public void setMobile(String mobile) {
		  this.mobile = mobile;
		 }

		public boolean insertData() throws Exception {
		  DBConnect c = new DBConnect();
		  c.QueryExecuter("insert into reg values ('" + this.getName() + "','" + this.getEmail() + "','" + this.getPass()
		    + "','" + this.getMobile() + "')");
		  return true;
		 }
		
		public boolean LoginCheck() throws Exception {
			  DBConnect c = new DBConnect();
			  
			  ResultSet rs = c.QueryReturner("select * from reg where email = '"+ this.getEmail()+"' and password='"+this.getPass()+"'");
			  if(rs.next())
			  {
				  this.setName(rs.getString(1));
				  this.setMobile(rs.getString(4));
				  return true;
			  }

			  return false;
		}
}

