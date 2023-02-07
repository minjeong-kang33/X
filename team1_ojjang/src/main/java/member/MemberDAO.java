package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	public Connection getConnection() throws Exception{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = ds.getConnection();
		return con;
	}//getConnection()
	
	public void insertMember(MemberDTO dto) {
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
//			pstmt.setString(11, dto.getM_admin());
			pstmt.executeUpdate();	
			}
			catch (Exception e) {
			e.printStackTrace();//어느부분에 에러가 발생했는지 찾아줌
			}
			finally {
				if (pstmt != null)try {pstmt.close();} catch (Exception e2) {}
				if (con != null)try {con.close();} catch (Exception e2) {}
			}
	}//insertMember()
	
	public ArrayList<MemberDTO> adUserList(int startRow, int pageSize) {
		ArrayList<MemberDTO> adUserList=new ArrayList<MemberDTO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDTO dto=null;
		try {
			con=getConnection();
			String sql="select * from member order by M_id limit ?, ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto=new MemberDTO();
				dto.setM_id(rs.getString("M_id"));
				dto.setM_name(rs.getString("M_name"));
				dto.setM_nick(rs.getString("M_nick"));
				dto.setM_createdate(rs.getTimestamp("M_createdate"));
				dto.setM_play(rs.getInt("M_play"));
				adUserList.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch (Exception e) {}
			if(pstmt!=null) try {pstmt.close();} catch (Exception e) {}
			if(rs!=null) try {rs.close();} catch (Exception e) {}
		}
		return adUserList;
	}//adUserList()
	
	public int adUserCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from member";
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
	}//adUserCount()
	
	public ArrayList<MemberDTO> adUserListPro(String info, String search) {
		ArrayList<MemberDTO> adUserListPro=new ArrayList<MemberDTO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from member where ";
			if(info.equals("M_id")) {sql+="M_id like ?";}
			else if(info.equals("M_name")) {sql+="M_name like ?";}
			else if(info.equals("M_nick")) {sql+="M_nick like ?";}
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto=new MemberDTO();
				dto.setM_id(rs.getString("M_id"));
				dto.setM_name(rs.getString("M_name"));
				dto.setM_nick(rs.getString("M_nick"));
				dto.setM_createdate(rs.getTimestamp("M_createdate"));
				dto.setM_play(rs.getInt("M_play"));
				adUserListPro.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch (Exception e) {}
			if(pstmt!=null) try {pstmt.close();} catch (Exception e) {}
			if(rs!=null) try {rs.close();} catch (Exception e) {}
		}
		return adUserListPro;
	}//adUserListPro()
	
	public ArrayList<MemberDTO> adOutList(int startRow, int pageSize) {
		ArrayList<MemberDTO> adOutList=new ArrayList<MemberDTO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from member where M_play='4' order by M_id limit ?, ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto=new MemberDTO();
				dto.setM_id(rs.getString("M_id"));
				dto.setM_name(rs.getString("M_name"));
				dto.setM_nick(rs.getString("M_nick"));
				dto.setM_createdate(rs.getTimestamp("M_createdate"));
				dto.setM_play(rs.getInt("M_play"));
				adOutList.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch (Exception e) {}
			if(pstmt!=null) try {pstmt.close();} catch (Exception e) {}
			if(rs!=null) try {rs.close();} catch (Exception e) {}
		}
		return adOutList;
	}//adOutList()
	
	public int adOutCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from member where M_play='4'";
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
	}//adOutCount()
	
	public ArrayList<MemberDTO> adOutListPro(String info, String search) {
		ArrayList<MemberDTO> adOutListPro=new ArrayList<MemberDTO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from member where M_play='4'";
			if(info.equals("M_id")) {sql+="and M_id like ?";}
			else if(info.equals("M_name")) {sql+="and M_name like ?";}
			else if(info.equals("M_nick")) {sql+="and M_nick like ?";}
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto=new MemberDTO();
				dto.setM_id(rs.getString("M_id"));
				dto.setM_name(rs.getString("M_name"));
				dto.setM_nick(rs.getString("M_nick"));
				dto.setM_createdate(rs.getTimestamp("M_createdate"));
				dto.setM_play(rs.getInt("M_play"));
				adOutListPro.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {con.close();} catch (Exception e) {}
			if(pstmt!=null) try {pstmt.close();} catch (Exception e) {}
			if(rs!=null) try {rs.close();} catch (Exception e) {}
		}
		return adOutListPro;
	}//adOutListPro()
	
}//class
