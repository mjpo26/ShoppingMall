package vo;

import java.sql.Date;

public class Admin_MemberSearchBean {
	
	private String member_id;
	private String member_name;
	private String member_phone;
	
    private String member_sms_ok;
	private String member_email_ok;
	
	private Date pickStart;
	private Date pickEnd;
	
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
	private int page;
	private int limit;
	
	public String getMember_id() {
	    
	    if(member_id =="") {
	    member_id = null;
	    }
	    
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getMember_name() {
	    
	    if(member_name =="") {
	        member_name = null;
	        }
        return member_name;
    }
    public void setMember_name(String member_name) {
        this.member_name = member_name;
    }
    public String getMember_phone() {
        if(member_phone=="") {
            member_phone = null;
            }
        return member_phone;
    }
    public void setMember_phone(String member_phone) {
        this.member_phone = member_phone;
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
