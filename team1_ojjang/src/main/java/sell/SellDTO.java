package sell;

import java.sql.Timestamp;

public class SellDTO {
		private int S_num;
		private String M_id;
		private String S_title;
		private int S_price;
		private String S_text;
		private int S_like;
		private int S_view;
		private String S_send;
		private String S_sido1;
		private String S_gugun1;
		private Timestamp S_createdate;
		private Timestamp S_updatedate;
		private String S_category;
		
		public int getS_num() {
			return S_num;
		}
		public void setS_num(int s_num) {
			S_num = s_num;
		}
		public String getM_id() {
			return M_id;
		}
		public void setM_id(String m_id) {
			M_id = m_id;
		}
		public String getS_title() {
			return S_title;
		}
		public void setS_title(String s_title) {
			S_title = s_title;
		}
		public int getS_price() {
			return S_price;
		}
		public void setS_price(int s_price) {
			S_price = s_price;
		}
		public String getS_text() {
			return S_text;
		}
		public void setS_text(String s_text) {
			S_text = s_text;
		}
		public int getS_like() {
			return S_like;
		}
		public void setS_like(int s_like) {
			S_like = s_like;
		}
		public int getS_view() {
			return S_view;
		}
		public void setS_view(int s_view) {
			S_view = s_view;
		}
		public String getS_send() {
			return S_send;
		}
		public void setS_send(String s_send) {
			S_send = s_send;
		}
		public Timestamp getS_createdate() {
			return S_createdate;
		}
		public void setS_createdate(Timestamp s_createdate) {
			S_createdate = s_createdate;
		}
		public Timestamp getS_updatedate() {
			return S_updatedate;
		}
		public void setS_updatedate(Timestamp s_updatedate) {
			S_updatedate = s_updatedate;
		}
		public String getS_category() {
			return S_category;
		}
		public void setS_category(String s_category) {
			S_category = s_category;
		}
		public String getS_sido1() {
			return S_sido1;
		}
		public void setS_sido1(String s_sido1) {
			S_sido1 = s_sido1;
		}
		public String getS_gugun1() {
			return S_gugun1;
		}
		public void setS_gugun1(String s_gugun1) {
			S_gugun1 = s_gugun1;
		}
		
	}