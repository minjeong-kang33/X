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
			int rE_id=1;
			String sql= "select max(num) from review";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				rE_id=rs.getInt("max(num)")+1;
			}
			
			
			//게시판 DB입력
			
			sql = "insert into board(RE_id,S_id,RE_writer,RE_title,RE_text,RE_createtime,RE_view"
					+ "RE_img1,RE_delivery,RE_manner,RE_ProductStatus,RE_fast,RE_time) value (?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rE_id);
			pstmt.setString(2, dto.getS_id());
			pstmt.setString(3, dto.getRE_writer());
			pstmt.setString(4, dto.getRE_title());
			pstmt.setString(5, dto.getRE_text());
			pstmt.setTimestamp(6, dto.getRE_createtime());
			pstmt.setInt(7, dto.getRE_view());
			pstmt.setString(8, dto.getRE_img1());
			pstmt.setString(9, dto.getRE_delivery());
			pstmt.setString(10, dto.RE_img1());
			pstmt.setString(11, dto.RE_img1());
			
	
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
