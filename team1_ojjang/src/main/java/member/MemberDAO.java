package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	
	}
	public void insertMembers(MemberDTO dto) {
		Connection con =null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="insert into Members values(?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getM_id());
			pstmt.setString(2, dto.getM_pw());
			pstmt.setString(3, dto.getM_name());
			pstmt.setString(4, dto.getM_nick());
			pstmt.setString(5, dto.getM_gender());
			pstmt.setString(6, dto.getM_phone());
			pstmt.setString(7, dto.getM_address());
			pstmt.setString(8, dto.getM_address2());
			pstmt.setString(9, dto.getM_email());
			pstmt.setTimestamp(10,dto.getM_createdate());

			
			pstmt.executeUpdate();	
			}
			catch (Exception e) {
				
			e.printStackTrace();//어느부분에 에러가 발생했는지 찾아줌
			}
			finally {
				if (pstmt != null)try {pstmt.close();} catch (Exception e2) {}
				if (con != null)try {con.close();} catch (Exception e2) {}
				
			}
	}

	public MemberDTO M_userCheck(String M_id, String M_pw) {
		//바구니 주소가 저장되는 변수에 null 초기화
		MemberDTO dto=null;
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = getConnection();
		     String sql="select * from Members where M_id=? and M_pw=?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1,M_id);
			 pstmt.setString(2,M_pw);
			 rs=pstmt.executeQuery();
			 if(rs.next()){
				 dto=new MemberDTO(); 
				dto.setM_id(rs.getString("M_id"));
				dto.setM_id(rs.getString("M_pw"));
				
			 }
		 	
		}
		
		catch (Exception e) {	
		}
		finally {
			if(pstmt!=null)try {pstmt.close();} catch (Exception e2) {}
			if(con!=null)try {con.close();} catch (Exception e2) {}
			if(rs!=null)try {rs.close();} catch (Exception e2) {}

		}
		return dto;
	}
	
	public MemberDTO getMember(String M_id) {
		MemberDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="select * from members where M_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, M_id);
			
			rs=pstmt.executeQuery();

			if(rs.next()){

				dto=new MemberDTO();
				
				dto.setM_id(rs.getString("M_id"));
				dto.setM_pw(rs.getString("M_pw"));
				dto.setM_name(rs.getString("M_name"));
				dto.setM_nick(rs.getString("M_nick"));
				dto.setM_gender(rs.getString("M_gender"));
				dto.setM_address(rs.getString("M_address"));
				dto.setM_address2(rs.getString("M_address2"));
				dto.setM_email(rs.getString("M_email"));
				dto.setM_createdate(rs.getTimestamp("M_createdate"));
				dto.setM_play(rs.getInt("M_play"));
				dto.setM_admin(rs.getString("M_admin"));
				dto.setM_phone(rs.getString("M_phone"));
			}
		
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
		
		finally {

			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getMember()	
	
	
	
}
