package movie.work.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import movie.work.constant.Constant;
import movie.work.entity.Employee;
import movie.work.entity.Metadata;
import movie.work.entity.Star;

public class AdminDAO {
	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(Constant.DB_DRIVER);
			conn = DriverManager.getConnection(Constant.DB_URL, Constant.DB_USERNAME, Constant.DB_PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void main(String[] args) {
		AdminDAO adminDAO = new AdminDAO();
		System.out.println("hello world");
//		adminDAO.add_movie("Yue1", "Yue2", "Funnn", "Patrick at kansas", 1987, "Yue Sun");
	}
	public String addMovie(String first_name, String last_name, String genre_name, String title, int year, String director) {
		Connection dbConnection = getConnection();
		CallableStatement callableStatement = null;
		String message = "";
		String insertStoreProc = "{call add_movie(?,?,?,?,?,?,?)}";

		try {
			dbConnection = getConnection();
			callableStatement = dbConnection.prepareCall(insertStoreProc);

			callableStatement.setString(1, first_name);
			callableStatement.setString(2, last_name);
			callableStatement.setString(3, genre_name);
			callableStatement.setString(4, title);
			callableStatement.setInt(5, year);
			callableStatement.setString(6, director);
			callableStatement.setString(7, message);
			
			// execute insertDBUSER store procedure
			callableStatement.executeUpdate();
			message = callableStatement.getString(7);
			System.out.println("Record is inserted into DBUSER table!");
			System.out.println("message = " + message);
			if (callableStatement != null) {
				callableStatement.close();
			}

			if (dbConnection != null) {
				dbConnection.close();
			}

		} catch (SQLException e) {

			System.out.println(e.getMessage());

		} 
		return message;
	}
	public List<Metadata> getDatabaseSchema() {
		List<Metadata> list = new ArrayList<>();
		Connection conn = getConnection();
		try {

			DatabaseMetaData dbm = conn.getMetaData();
			String[] types = { "TABLE" };
			ResultSet rs = dbm.getTables(null, null, "%", types);
			while (rs.next()) {
				
				String table = rs.getString("TABLE_NAME");
				
				String sql = "DESCRIBE " + table;
				PreparedStatement pst = conn.prepareStatement(sql);
				ResultSet rsSub = pst.executeQuery("DESCRIBE " + table);
				ResultSetMetaData mdSub = rsSub.getMetaData();
				int col = mdSub.getColumnCount();
				DatabaseMetaData dbmSub = conn.getMetaData();
				ResultSet rs1 = dbmSub.getColumns(null, "%", table, "%");
				while (rs1.next()) {
					Metadata temp = new Metadata();
					String col_name = rs1.getString("COLUMN_NAME");
					String data_type = rs1.getString("TYPE_NAME");
					int data_size = rs1.getInt("COLUMN_SIZE");
					temp.setTableName(table);
					temp.setAttribute(col_name);
					temp.setType(data_type);
					temp.setColumnSize(data_size);
					list.add(temp);
				}
			
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("No any table in the database");

		}
		return list;

	}

	public Employee getEmployee(String fullname, String password) {
		Employee employee = null;
		Connection conn = getConnection();
		String sql = "select fullname, password, email from employee where fullname = ? and password = ?";

		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, fullname);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				employee = new Employee(rs.getString("fullname"), rs.getString("password"), rs.getString("email"));
			}
			rs.close();
			pst.close();
			conn.close();
		} catch (Exception e) {

		}
		return employee;
	}

	public boolean addStar(Star star) {
		boolean flag = true;
		Connection conn = getConnection();
		String sql = "insert into Stars(first_name, last_name, dob, photo_url) values (?, ?, ? , ?)";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, star.getFirst_name());
			pst.setString(2, star.getLast_name());
			pst.setObject(3, star.getDate());
			pst.setString(4, star.getPhoto_url());
			int result = pst.executeUpdate();
			if (result != 1) {
				flag = false;
			}
			System.out.println(flag + "check added");

			pst.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print("add failed");
		}
		return flag;
	}
}
