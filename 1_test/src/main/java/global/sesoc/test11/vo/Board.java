package global.sesoc.test11.vo;

import lombok.Data;

@Data
public class Board {
	private int boarddno;
	private String custid;
	private String title;
	private String content;
	private String regdate;
	private String originalfile;
	private String savedfile;
	private int hitcount;
	private String replytext;
	private String repdate;
	private String notify; 
}
