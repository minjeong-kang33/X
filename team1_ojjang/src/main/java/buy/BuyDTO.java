package buy;

import java.sql.Timestamp;

public class BuyDTO {
	private int B_num;
	private String M_id;
	private String B_title;
	private Timestamp B_time;
	private int B_view;
	private String B_text;
	private String B_img1;
	private String B_img2;
	private String B_img3;
	
	public int getB_num() {
		return B_num;
	}
	public void setB_num(int b_num) {
		B_num = b_num;
	}
	public String getM_id() {
		return M_id;
	}
	public void setM_id(String m_id) {
		M_id = m_id;
	}
	public String getB_title() {
		return B_title;
	}
	public void setB_title(String b_title) {
		B_title = b_title;
	}
	public Timestamp getB_time() {
		return B_time;
	}
	public void setB_time(Timestamp b_time) {
		B_time = b_time;
	}
	public int getB_view() {
		return B_view;
	}
	public void setB_view(int b_view) {
		B_view = b_view;
	}
	public String getB_text() {
		return B_text;
	}
	public void setB_text(String b_text) {
		B_text = b_text;
	}
	public String getB_img1() {
		return B_img1;
	}
	public void setB_img1(String b_img1) {
		B_img1 = b_img1;
	}
	public String getB_img2() {
		return B_img2;
	}
	public void setB_img2(String b_img2) {
		B_img2 = b_img2;
	}
	public String getB_img3() {
		return B_img3;
	}
	public void setB_img3(String b_img3) {
		B_img3 = b_img3;
	}
}