package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import deal.DealDTO;
import member.MemberDTO;
import sell.SellDTO;

public class MypageDAO {
	
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
	//deal 테이블에 값 넣기(값이 들어가는지 확인해봐야하는데..)
	public void insertDeal(SellDTO selldto, MemberDTO memberdto) {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			int D_num=1;
			String sql="select max(D_num) from deal";
			
			if(rs.next()) {
				D_num=rs.getInt("max(D_num)")+1;
			}						
			sql="insert into deal(D_num,S_num,M_id,D_buy,D_date) values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,D_num);
			pstmt.setInt(2, selldto.getS_num());
			pstmt.setString(3, selldto.getM_id());
			pstmt.setString(4, memberdto.getM_id());			
			pstmt.setTimestamp(5,new Timestamp(System.currentTimeMillis()));
			pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
				if (con != null) try {con.close();} catch (Exception e2) {}
				if (rs != null) try {rs.close();} catch (Exception e2) {}
			}
		
	}
	
	//판매내역1
	public ArrayList<SellDTO> sellHistory(String M_id) {
		ArrayList<SellDTO> sellHistory=new ArrayList<SellDTO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select S_title, S_price, S_category from sell where M_id = ( select M_id from deal where M_id=?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, M_id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				SellDTO dto=new SellDTO();
				dto.setS_title(rs.getString("S_title"));
				dto.setS_price(rs.getInt("S_price"));		
				dto.setS_category(rs.getString("S_category"));
				sellHistory.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch (Exception e2) {}
			if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
			if(rs!=null) try {rs.close();} catch (Exception e2) {}
		}
		return sellHistory;
	};
	
	
	//판매내역2
	public ArrayList<DealDTO> dealHistory(String M_id) {
		ArrayList<DealDTO> dealHistory=new ArrayList<DealDTO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql= "select D_buy, D_date from deal where M_id=(select M_id from sell where M_id=?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, M_id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DealDTO dto=new DealDTO();
				dto.setD_buy(rs.getString("D_buy"));
				dto.setD_date(rs.getTimestamp("D_date"));
			
				dealHistory.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch (Exception e2) {}
			if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
			if(rs!=null) try {rs.close();} catch (Exception e2) {}
		}
		return dealHistory;
	}











}

