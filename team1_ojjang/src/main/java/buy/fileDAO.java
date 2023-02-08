package buy;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class fileDAO {
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	} //getConnection()

	public int upload(String fileName, String fileRealName) {
		Connection con=null;
		String SQL = "INSERT INTO buy (B_img1, B_img2) VALUES (?,?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}