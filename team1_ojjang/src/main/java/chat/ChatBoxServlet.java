package chat;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/ChatBoxServlet")
public class ChatBoxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");		
		String CH_num = request.getParameter("CH_num");
		if(CH_num == null || CH_num.equals("")) {
			response.getWriter().write("");
		} else {
			try {
				HttpSession session = request.getSession();
				if(!URLDecoder.decode(CH_num, "UTF-8").equals((String) session.getAttribute("CH_num"))) {
					response.getWriter().write("");
					return;
				}
				CH_num = URLDecoder.decode(CH_num, "UTF-8");
				response.getWriter().write(getBox(CH_num));
			} catch (Exception e) {
				response.getWriter().write("");
			}
		}
	}
	
	public String getBox(String CH_num) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDAO chatDAO = new ChatDAO();
		ArrayList<ChatDTO> chatList = chatDAO.getBox(CH_num);
		if(chatList.size() == 0) return "";
		for(int i=chatList.size()-1; i>=0; i--) {
			String unread = "";
			if(CH_num.equals(chatList.get(i).getToID())) {
				unread = chatDAO.getUnreadChat(chatList.get(i).getFromID(), CH_num) + "";
				if(unread.equals("0")) unread = "";
			}
			result.append("[{\"value\": \"" + chatList.get(i).getFromID() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getToID() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"},");
			result.append("{\"value\": \"" + unread + "\"},");
			if(i != 0) result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getCH_num() + "\"}");
		return result.toString();
	}

}
