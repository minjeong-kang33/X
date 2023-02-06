package buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BuyDAO {
	
	public Connection getConnection() throws Exception {
	Context init=new InitialContext();
	DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
	Connection con=ds.getConnection();
	return con;
	}//getConnection()
	
	public ArrayList<BuyDTO> adBuyList(int startRow, int pageSize) {
		ArrayList<BuyDTO> adbuyList=new ArrayList<BuyDTO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from buy order by M_id limit ?, ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BuyDTO dto=new BuyDTO();
				dto.setM_id(rs.getString("M_id"));
				dto.setB_title(rs.getString("B_title"));
				dto.setB_time(rs.getTimestamp("B_time"));
				dto.setB_view(rs.getInt("B_view"));
				dto.setB_img1(rs.getString("B_img1"));
				dto.setB_img2(rs.getString("B_img3"));
				dto.setB_img2(rs.getString("B_img3"));
				adbuyList.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch (Exception e) {}
			if(pstmt!=null) try {pstmt.close();} catch (Exception e) {}
			if(rs!=null) try {rs.close();} catch (Exception e) {}
		}
		return adbuyList;
	}//adBuyList()
	
	public int adBuyCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from buy";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch (Exception e) {}
			if(pstmt!=null) try {pstmt.close();} catch (Exception e) {}
			if(rs!=null) try {rs.close();} catch (Exception e) {}
		} return count;
	}//adBuyCount()
	
}//class