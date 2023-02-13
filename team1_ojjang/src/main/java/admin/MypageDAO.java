package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import buy.BuyDTO;
import deal.DealDTO;
import like.LikeDTO;
import member.MemberDTO;
import sell.SellDTO;

public class MypageDAO {
	
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	//=========================거래내역====================================
	
	//deal 테이블에 값 넣기(값이 들어가는지 확인해봐야하는데..) //승민
	public void insertDeal(SellDTO selldto, String M_id) {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			int D_num=1;
			String sql="select max(D_num) from deal";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				D_num=rs.getInt("max(D_num)")+1;
				
			}						
			sql="insert into deal(D_num,S_num,M_id,D_buy,D_date) values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,D_num);
			pstmt.setInt(2, selldto.getS_num());
			pstmt.setString(3, selldto.getM_id());
			pstmt.setString(4, M_id);			
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
			String sql="select S_title, S_price, S_category from sell where M_id in ( select M_id from deal where M_id=?)";
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
			String sql= "select D_buy, D_date from deal where M_id in (select M_id from sell where M_id=?)";
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
	

	

	//buyHistory_dealListS
	public ArrayList<SellDTO> dealListS(String M_id) {
		ArrayList<SellDTO> dealListS=new ArrayList<SellDTO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select M_id, S_title, S_price, S_category from sell where S_num in ( select S_num from deal where D_buy=?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, M_id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				SellDTO dto=new SellDTO();
				dto.setM_id(rs.getString("M_id"));
				dto.setS_title(rs.getString("S_title"));
				dto.setS_price(rs.getInt("S_price"));		
				dto.setS_category(rs.getString("S_category"));
				dealListS.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch (Exception e2) {}
			if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
			if(rs!=null) try {rs.close();} catch (Exception e2) {}
		}
		return dealListS;
	}

	//================like===========================================
	
	//likePro_insertlike
	public void insertlike(int S_num, String M_id) {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
		
			int Like_id=1;
			String sql ="select max(Like_id) from likes";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Like_id=rs.getInt("max(Like_id)")+1;}
			
			sql="insert into likes(Like_id,S_num,M_id) values(?,?,?)";
			pstmt=con.prepareStatement(sql);	
			pstmt.setInt(1,Like_id);
			pstmt.setInt(2, S_num);
			pstmt.setString(3, M_id);			
			pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {				
				if (con != null) try {con.close();} catch (Exception e2) {}
				if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
				if (rs != null) try {rs.close();} catch (Exception e2) {}
			}
		
	}	//insertlike

	//likePro_insertlike
	public void insertlike_S_like(int S_num) {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			String sql="update sell set S_like=S_like+1 where S_num=?";
			pstmt=con.prepareStatement(sql);			
			pstmt.setInt(1,S_num);			
			pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {				
				if (con != null) try {con.close();} catch (Exception e2) {}
				if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
				if (rs != null) try {rs.close();} catch (Exception e2) {}
			}
		
	}	//insertlike

	
	//likelist
	public ArrayList<SellDTO> likeHistory(String M_id) {
		ArrayList<SellDTO> likeHistory=new ArrayList<SellDTO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql= "select s.S_num, s.M_id, s.S_category, s.S_title, s.S_text, s.S_price from sell s join likes l on s.S_num=l.S_num where l.M_id=?"; 
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, M_id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				SellDTO dto=new SellDTO();
				dto.setS_num(rs.getInt("S_num"));
				dto.setM_id(rs.getString("M_id"));
				dto.setS_category(rs.getString("S_category"));
				dto.setS_title(rs.getString("S_title"));
				dto.setS_text(rs.getString("S_text"));
				dto.setS_price(rs.getInt("S_price"));
			
				likeHistory.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch (Exception e2) {}
			if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
			if(rs!=null) try {rs.close();} catch (Exception e2) {}
		}
		return likeHistory;
	}

	
	//likePro_getLike
	public LikeDTO getLike(String M_id, int S_num) {
		LikeDTO dto=null;
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = getConnection();
		     String sql="select * from likes where M_id=? and S_num=?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1,M_id);
			 pstmt.setInt(2,S_num);
			 rs=pstmt.executeQuery(); 
			 
			 if(rs.next()){
				dto=new LikeDTO(); 
				dto.setM_id(rs.getString("M_id"));
				dto.setS_num(rs.getInt("S_num"));
			 }else{
				 
			 }
		}catch (Exception e) {	
			e.printStackTrace();
		}
		finally {
			if(pstmt!=null)try {pstmt.close();} catch (Exception e2) {}
			if(con!=null)try {con.close();} catch (Exception e2) {}
			if(rs!=null)try {rs.close();} catch (Exception e2) {}

		}
		return dto;
	}//likePro_getLike
	
	
	//delete_like //글삭제할때 되게!!!!
	public void deleteLike(int S_num) {
		Connection con =null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="delete from likes where S_num =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, S_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	} //delete_like
	
	
	//===========================글 쓴 내역
	
	public ArrayList<SellDTO> WriteHistoryS(String M_id){
		ArrayList<SellDTO> WriteHistoryS=new ArrayList<SellDTO>();
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
				dto.setS_price(rs.getInt("S_price"));
				dto.setM_id(rs.getString("M_id"));
				dto.setS_title(rs.getString("S_title"));
				dto.setS_text(rs.getString("S_text"));
				dto.setS_like(rs.getInt("S_like"));
				dto.setS_view(rs.getInt("S_view"));
				dto.setS_category(rs.getString("S_category"));
				dto.setS_send1(rs.getString("S_send1"));	
				dto.setS_send2(rs.getString("S_send2"));
				dto.setS_createdate(rs.getTimestamp("S_createdate"));
				dto.setS_category(rs.getString("S_category"));
				
				WriteHistoryS.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return WriteHistoryS;
	} //WriteHistoryS 끝
	
	
	public ArrayList<BuyDTO> WriteHistoryB(String M_id){
		ArrayList<BuyDTO> WriteHistoryS=new ArrayList<BuyDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from buy where M_id=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, M_id);
			
			rs=pstmt.executeQuery();	

			while(rs.next()) {
				
				BuyDTO dto=new BuyDTO();
				dto.setM_id(rs.getString("M_id"));
				dto.setB_num(rs.getInt("B_num"));
				dto.setB_category(rs.getString("B_category"));
				dto.setB_title(rs.getString("B_title"));
				dto.setB_text(rs.getString("B_text"));
				dto.setB_view(rs.getInt("B_view"));
				dto.setB_img(rs.getString("B_img"));
			
				
				WriteHistoryS.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return WriteHistoryS;
	} //WriteHistoryS 끝
	
	//============================페이징
	
	// 리턴할형 ArrayList<BoardDTO>  getBoardList(int startRow,int pageSize) 메서드 정의 
	public ArrayList<DealDTO> getDealList(int startRow,int pageSize){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<DealDTO> dealList=new ArrayList<>();
		try {
			// 1~2 단계
			con=getConnection();
			// 3단계 sql
			// 기본 num기준 오름차순 => 최근글 위로 올라오게 정렬 (num 내림차순)
//			String sql="select * from board order by num desc";
//			String sql="select * from board order by num desc limit 시작행-1, 몇개";
			String sql="select * from deal order by D_num desc limit ?, ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			//4
			rs=pstmt.executeQuery();
			//5
			while(rs.next()) {
				// 하나의 글의 바구니에 저장
				DealDTO dto=new DealDTO();
				
				dto.setD_buy(rs.getString("D_buy"));
				dto.setD_date(rs.getTimestamp("D_date"));
				dto.setD_num(rs.getInt("D_num"));
				dto.setM_id(rs.getString("M_id"));
				dto.setS_num(rs.getInt("S_num"));
				
				// 바구니의 주소값을 배열 한칸에 저장
				dealList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dealList;
	}
	
	
	public int getbuyHistoryCount() {
		int count=0;
		Connection con =null;
		PreparedStatement pstmt=null;	
		ResultSet rs=null;
try {
			
			con=getConnection();
			
			String sql="select count(*) from deal";
			pstmt=con.prepareStatement(sql);

			rs=pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt("count(*)");				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return count;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//BuyHistory 연습
//	public ArrayList<SellDTO> buyHistory(String M_id) {
//		ArrayList<SellDTO> sellHistory=new ArrayList<SellDTO>();
//		ArrayList<DealDTO> dealHistory=new ArrayList<DealDTO>();
//		Connection con=null;
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		try {
//			con=getConnection();
//			String sql="select s.M_id, s.S_title, s.S_price, s.S_text, s.S_category, s.S_img, d.D_buy from sell s join deal d on s.S_num=d.D_num where D_buy=?";
//			pstmt=con.prepareStatement(sql);
//			pstmt.setString(1, M_id);
//			rs=pstmt.executeQuery();
//			while(rs.next()) {
//				SellDTO dto=new SellDTO();
//				DealDTO sdto=new DealDTO();
//				dto.setM_id(rs.getString("M_id"));				
//				dto.setS_title(rs.getString("S_title"));
//				dto.setS_price(rs.getInt("S_price"));
//				dto.setS_text(rs.getString("S_text"));
//				dto.setS_category(rs.getString("S_category"));
//				dto.setS_img(rs.getString("S_img"));
//				sdto.setD_buy(rs.getString("D_buy"));
//				sellHistory.add(dto);
//				dealHistory.add(sdto);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			if(con!=null) try {con.close();} catch (Exception e2) {}
//			if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
//			if(rs!=null) try {rs.close();} catch (Exception e2) {}
//		}
//		return sellHistory;
//	};
//	
}

