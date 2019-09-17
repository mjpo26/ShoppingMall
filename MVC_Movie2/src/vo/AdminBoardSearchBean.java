package vo;

import java.sql.Date;

public class AdminBoardSearchBean {
	private String board_list;
	private String board_title;
	private String board_writer;
	private String board_replyCheck;
	private Date pickStart;
	private Date pickEnd;
	private int page;
	private int limit;


	public String getBoard_list() {
//		if(board_list =="리뷰게시판") {
//			
//		}
//		else if(board_list=="QnA게시판") {
//			
//		}

		if (board_list == null) {
			board_list = null;
		}
		return board_list;
	}

	public void setBoard_list(String board_list) {
		this.board_list = board_list;
	}

	public String getBoard_title() {

		if (board_title == "") {
			board_title = null;
		}
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_writer() {
		if (board_writer == "") {
			board_writer = null;
		}
		return board_writer;
	}

	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}

	public String getBoard_replyCheck() {
		if (board_replyCheck == "") {
			board_replyCheck = null;
		}
		return board_replyCheck;
	}

	public void setBoard_replyCheck(String board_replyCheck) {
		this.board_replyCheck = board_replyCheck;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public Date getPickStart() {
		return pickStart;
	}
	
	public void setPickStart(Date pickStart) {
		this.pickStart = pickStart;
	}
	
	public Date getPickEnd() {
		return pickEnd;
	}
	
	public void setPickEnd(Date pickEnd) {
		this.pickEnd = pickEnd;
	}
}
