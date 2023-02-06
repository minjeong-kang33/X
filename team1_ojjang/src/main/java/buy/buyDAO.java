package buy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class buyDAO {
	private Connection conn;
	private ResultSet rs;
	
	public buyDAO() {
		try {
			String url = "jdbc:mysql://localhost:3306/ojjang?";
			String id = "root";
			String pwd = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 
//	현재시간을 가져오는 함수
	public String getDate() {
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			연결되어있는 객체를 이용해서 SQL문장을 실행준비단계로 만듬
			rs = pstmt.executeQuery();
//			실행했을때 나오는 결과를 가져옴
			if(rs.next()) {
//			실행했을때 결과가 있다면 반환
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	

	public int getNext() {
		// 가장 마지막에 쓰인 글번호 가져오기
		String SQL = "select M_id from Buy order by M_id desc";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; // 첫번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
 // 글쓰기
	public int write(String B_title, String M_id, String B_text) {
		String SQL = "Insert into Buy(B_num, B_title, M_id, B_text, B_time, B_view)"
				+ "values(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()); // 글번호
			pstmt.setString(2, B_title);
			pstmt.setString(3, M_id);
			pstmt.setString(4, B_text);
			pstmt.setString(5, getDate());
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<buyDTO> getList(int pageNumber){
		String SQL = "select * from Buy where M_id < ? and B_view = 1 order by M_id desc limit 10";
		ArrayList<buyDTO> list = new ArrayList<buyDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				buyDTO buy = new buyDTO();
				buy.setB_num(rs.getInt(1));
				buy.setB_title(rs.getString(2));
				buy.setM_id(rs.getString(3));
				buy.setB_text(rs.getString(4));
				buy.setB_time(rs.getString(5));
				buy.setB_view(rs.getInt(6));
				list.add(buy);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 페이징 처리
	public boolean nextPage(int pageNumber) {
		String SQL = "select * from Buy where M_id < ? and B_view = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
				// 결과가 하나라도 존재하면 다음페이지로 넘어갈수있음
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	public buyDTO getbuy(int B_num) {
		// 왜안되노
		String SQL="select * from Buy where B_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, B_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				buyDTO buy = new buyDTO();
				buy.setB_num(rs.getInt(1));
				buy.setB_title(rs.getString(2));
				buy.setM_id(rs.getString(3));
				buy.setB_text(rs.getString(4));
				buy.setB_time(rs.getString(5));
				buy.setB_view(rs.getInt(6));
				return buy;
			}
		}catch (Exception e){
			e.printStackTrace();
			}
		}
	
}
