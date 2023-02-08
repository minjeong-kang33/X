package chat;

public class ChatDTO {
	
	int CH_num;
	String fromID;
	String toID;
	String chatContent;
	String chatTime;
	
	public int getCH_num() {
		return CH_num;
	}
	public void setCH_num(int CH_num) {
		this.CH_num = CH_num;
	}
	public String getFromID() {
		return fromID;
	}
	public void setFromID(String fromID) {
		this.fromID = fromID;
	}
	public String getToID() {
		return toID;
	}
	public void setToID(String toID) {
		this.toID = toID;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatTime() {
		return chatTime;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
}
