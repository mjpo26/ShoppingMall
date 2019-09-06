package vo;

public class Admin_MemberSearchBean {
	
	private String member_id;
	private String member_sms_ok;
	private String member_email_ok;
	private int page;
	private int limit;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_sms_ok() {
		return member_sms_ok;
	}
	public void setMember_sms_ok(String member_sms_ok) {
		this.member_sms_ok = member_sms_ok;
	}
	public String getMember_email_ok() {
		return member_email_ok;
	}
	public void setMember_email_ok(String member_email_ok) {
		this.member_email_ok = member_email_ok;
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

}
