<<<<<<< HEAD
package sell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SellDAO {
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
	public void insertBoard(SellDTO dto) {		
		System.out.println("Board insertBoard()");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = getConnection();
			
			int S_num = 1;
			int S_like = 0;
			int S_view = 0;
			String sql="select max(S_num) from sell";
			
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				// 현존하는 최대 num에서 +1한 값을 num으로서 사용
				S_num = rs.getInt("max(S_num)") + 1;
			}
			
			sql="insert into board(S_num,M_id,S_title,S_price,S_text,S_like,S_view,"
					+ "S_send,S_createdate,S_category) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);

			pstmt.setInt(1, S_num);  
			pstmt.setString(2, dto.getM_id()); 
			pstmt.setString(3, dto.getS_title());
			pstmt.setInt(4, dto.getS_price());
			pstmt.setString(5, dto.getS_text());
			pstmt.setInt(6, S_like);
			pstmt.setInt(7, S_view);
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
	
	}
	public void getlist

		
	}
	
	
	
=======
package sell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SellDAO {
	
		public Connection getConnection() throws Exception{
			Context init=new InitialContext();
			DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
			Connection con=ds.getConnection();
			return con;
		}
	
		
	public ArrayList<SellDTO> getsellList(String M_id){
		ArrayList<SellDTO> sellList=new ArrayList<SellDTO>();
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
				dto.setS_category(rs.getInt("S_category"));
				
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
	

}
>>>>>>> branch 'master' of https://github.com/minjeong-kang33/team1_ojjang.git
