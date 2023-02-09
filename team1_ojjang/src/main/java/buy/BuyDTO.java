package buy;

import java.sql.Timestamp;

public class BuyDTO {
	
	private String M_id;
	private int B_num;
	private String B_title;
	private String B_text;
	private int B_view;
	private Timestamp B_time;
	private String B_imgname;
	private String B_imgsize;
	
	public String getM_id() {
		return M_id;
	}
	public void setM_id(String m_id) {
		M_id = m_id;
	}
	public int getB_num() {
		return B_num;
	}
	public void setB_num(int b_num) {
		B_num = b_num;
	}
	public String getB_title() {
		return B_title;
	}
	public void setB_title(String b_title) {
		B_title = b_title;
	}
	public String getB_text() {
		return B_text;
	}
	public void setB_text(String b_text) {
		B_text = b_text;
	}
	public int getB_view() {
		return B_view;
	}
	public void setB_view(int b_view) {
		B_view = b_view;
	}
	public Timestamp getB_time() {
		return B_time;
	}
	public void setB_time(Timestamp b_time) {
		B_time = b_time;
	}
	public String getB_imgname() {
		return B_imgname;
	}
	public void setB_imgname(String b_imgname) {
		B_imgname = b_imgname;
	}
	public String getB_imgsize() {
		return B_imgsize;
	}
	public void setB_imgsize(String b_imgsize) {
		B_imgsize = b_imgsize;
	}
	
	
	
}


