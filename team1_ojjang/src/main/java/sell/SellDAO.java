package sell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import buy.BuyDTO;

public class SellDAO {
	
	public Connection getConnection() throws Exception{
			Context init=new InitialContext();
			DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
			Connection con=ds.getConnection();
			return con;
		}//getConnection() 끝
	
	public void insertSellBoard(SellDTO dto) {		
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try {
				con = getConnection();
				int S_num = 1;
				String sql="select max(S_num) from sell";
				
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					// 현존하는 최대 num에서 +1한 값을 num으로서 사용
					S_num = rs.getInt("max(S_num)") + 1;
				}
				
				sql="insert into Buy(S_num,M_id,S_title,S_price,S_text,S_like,S_view,S_send,S_sido1,S_gugun1,S_createdate,S_category"
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, S_num);  
				pstmt.setString(2, dto.getM_id()); 
				pstmt.setString(3, dto.getS_title()); 
				pstmt.setInt(4, dto.getS_price());
				pstmt.setString(5, dto.getS_text());
				pstmt.setInt(6, dto.getS_like());
				pstmt.setInt(7, dto.getS_view());
				pstmt.setString(8, dto.getS_send());
				pstmt.setString(9, dto.getS_sido1());
				pstmt.setString(10, dto.getS_gugun1());
				pstmt.setTimestamp(11, dto.getS_createdate());
				pstmt.setString(12, dto.getS_category());
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return;
		} //insertSellBoard (글번호 부여하면서 입력된 내용을 등록)
		
	public ArrayList<SellDTO> getsellList(int startRow, int pageSize){
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		ArrayList<SellDTO> sellList=new ArrayList<SellDTO>();
		try {
			con=getConnection();
			String sql="select * from sell order by S_num desc limit ?, ?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs=pstmt.executeQuery();	

			while(rs.next()) {
				
				SellDTO dto=new SellDTO();
				dto.setS_num(rs.getInt("S_num"));
				dto.setM_id(rs.getString("M_id"));
				dto.setS_title(rs.getString("S_title"));
				dto.setS_price(rs.getInt("S_price"));
				dto.setS_text(rs.getString("S_text"));
				dto.setS_like(rs.getInt("S_like"));
				dto.setS_view(rs.getInt("S_view"));
				dto.setS_send(rs.getString("S_send"));		
				dto.setS_sido1(rs.getString("S_sido1"));	
				dto.setS_gugun1(rs.getString("S_gugun1"));	
				dto.setS_createdate(rs.getTimestamp("S_createdate"));
				dto.setS_category(rs.getString("S_category"));
				
				sellList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return sellList;
	}
	
	public int getSellBoardCount() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String sql = "select count(*) from sell";
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
	
	public SellDTO getSellBoard(int S_num){
		SellDTO dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String sql = "select * from sell where S_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,S_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new SellDTO();
				//TO.승민 **여기서 게시판에 출력되는 결과만 남기고 지울것! **
				dto.setS_num(rs.getInt("S_num"));
				dto.setM_id(rs.getString("M_id"));
				dto.setS_title(rs.getString("S_title"));
				dto.setS_price(rs.getInt("S_price"));
				dto.setS_text(rs.getString("S_text"));
				dto.setS_like(rs.getInt("S_like"));
				dto.setS_view(rs.getInt("S_view"));
				dto.setS_send(rs.getString("S_send"));		
				dto.setS_sido1(rs.getString("S_sido1"));	
				dto.setS_gugun1(rs.getString("S_gugun1"));	
				dto.setS_createdate(rs.getTimestamp("S_createdate"));
				dto.setS_category(rs.getString("S_category"));
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
	
	public ArrayList<SellDTO> sellHistory(String M_id){
		ArrayList<SellDTO> sellHistory=new ArrayList<SellDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from sell where M_id=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, M_id);
			
			rs=pstmt.executeQuery();	

			while(rs.next()) {
				
				SellDTO dto=new SellDTO();
				dto.setS_num(rs.getInt("S_num"));
				dto.setM_id(rs.getString("M_id"));
				dto.setS_title(rs.getString("S_title"));
				dto.setS_text(rs.getString("S_text"));
				dto.setS_like(rs.getInt("S_like"));
				dto.setS_view(rs.getInt("S_view"));
				dto.setS_send(rs.getString("S_send"));			
				dto.setS_createdate(rs.getTimestamp("S_createdate"));
				dto.setS_updatedate(rs.getTimestamp("S_updatedate"));
				dto.setS_category(rs.getString("S_category"));
				
				sellHistory.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return sellHistory;
	}
	
	
	
}

	

