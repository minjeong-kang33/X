package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class reviewDAO {

	public Connection getConnection() throws Exception{

		Context init = new InitialContext();
	    DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
	    Connection con = ds.getConnection();
	    return con;
	} // getConnection끝
	
	
	public void reviewWriteBoard(reviewDTO dto) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		
		try {
			con=getConnection();
			
			//게시판 번호 자동 넘버링
			int num=1;
			String sql= "select max(num) from review";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt("max(num)")+1;
			}
			
			
			//게시판 DB입력
			
			sql = "insert into board"
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
