package vo;

import java.sql.Date;

public class CommentBean {
	private int comment_num;
	private String comment_pass;
	private String comment_id;
	private Date comment_date;
	private String comment_content;
	private int comment_review_num;
	private String comment_writer;
	
	
	public String getComment_pass() {
		return comment_pass;
	}
	public void setComment_pass(String comment_pass) {
		this.comment_pass = comment_pass;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public int getComment_review_num() {
		return comment_review_num;
	}
	public void setComment_review_num(int comment_review_num) {
		this.comment_review_num = comment_review_num;
	}
	public String getComment_writer() {
		return comment_writer;
	}
	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
	}
	
	
}
