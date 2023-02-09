package buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class BuyDAO {
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	} //getConnection()

	public void insertBuyBoard(BuyDTO dto) {		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
			int B_num = 1;
			String sql="select max(B_num) from buy";
			
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				// 현존하는 최대 num에서 +1한 값을 num으로서 사용
				B_num = rs.getInt("max(B_num)") + 1;
			}
			
			sql="insert into Buy(M_id, B_num, B_title, B_text, B_view, B_time, B_imgname, B_imgsize)"
		               + "values(?,?,?,?,?,?,?,?)";
		         pstmt=con.prepareStatement(sql);
		         pstmt.setString(1, dto.getM_id());  
		         pstmt.setInt(2, B_num); 
		         pstmt.setString(3, dto.getB_title()); 
		         pstmt.setString(4, dto.getB_text());
		         pstmt.setInt(5, dto.getB_view()); 
		         pstmt.setTimestamp(6, dto.getB_time());
		         pstmt.setString(7, dto.getB_imgname());
		         pstmt.setString(8, dto.getB_imgsize());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return;
	} //insertBuyBoard (글번호 부여하면서 입력된 내용을 등록)
	
	
	public ArrayList<BuyDTO> getList(int startRow, int pageSize){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BuyDTO> buyList=new ArrayList<BuyDTO>();
	
		try {
			con = getConnection();
			String sql = "select * from buy order by B_num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			// 다음으로 작성될 글의 번호 : getNext, 
			// 현재 게시글이 5개라면 getNext = 6, 
			// pageNumber = 6-(1-1)*10
			rs = pstmt.executeQuery();

			while(rs.next()) {
				BuyDTO dto = new BuyDTO();
				dto.setB_num(rs.getInt("B_num"));
				dto.setM_id(rs.getString("M_id"));
				dto.setB_title(rs.getString("B_title"));
				dto.setB_time(rs.getTimestamp("B_time"));
				dto.setB_view(rs.getInt("B_view"));
				
				buyList.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { pstmt.close();} catch (Exception e2) {}
		}
		return buyList;
	} //getList(startRow, pageSize)
	
	public int getBuyBoardCount() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select count(*) from buy";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { pstmt.close();} catch (Exception e2) {}
		}
		return count;
	}
	
	public BuyDTO getBuyBoard(int B_num){
		BuyDTO dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String sql = "select * from buy where B_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,B_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new BuyDTO();
				dto.setB_num(rs.getInt("B_num"));
				dto.setM_id(rs.getString("M_id"));
				dto.setB_title(rs.getString("B_title"));
				dto.setB_time(rs.getTimestamp("B_time"));
				dto.setB_view(rs.getInt("B_view"));
			}else {
		}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { pstmt.close();} catch (Exception e2) {}
		}
		return dto;
		
	}
	
	
	
	// 페이징 처리
//	public boolean nextPage(int pageNumber) {
//		String SQL = "select * from Buy where B_num < ?";
//		try {
//			conn = getConnection();
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				return true;
//				// 결과가 하나라도 존재하면 다음페이지로 넘어갈수있음
//			}
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		return false;
//	}
	
	
//	public BuyDTO getbuy(int B_num) {
//		BuyDTO buy=null;
//		String SQL="select * from Buy where B_num=?";
//		try {
//			conn = getConnection();
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, B_num);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				buy.setB_num(rs.getInt(1));
//				buy.setM_id(rs.getString(2));
//				buy.setB_title(rs.getString(3));
//				buy.setB_time(rs.getString(4));
//				buy.setB_view(rs.getInt(5));
//				return buy;
//			}
//		}catch (Exception e){
//			e.printStackTrace();
//			}
//		return null;
//		}
	
}
