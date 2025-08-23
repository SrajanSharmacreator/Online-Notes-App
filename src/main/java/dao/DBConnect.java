package dao;

import java.sql.*;

public class DBConnect implements AutoCloseable {

	public Connection cn = null;

	public DBConnect() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javadb", "root", "root");

	}

	public void QueryExecuter(String sql) throws Exception {
		Statement st = cn.createStatement();
		st.execute(sql);
		st.close();
	}

	public ResultSet QueryReturner(String sql) throws Exception {
		Statement st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		return rs;
	}

	@Override
	public void close() throws Exception {
		// TODO Auto-generated method stub
		
	}
}
