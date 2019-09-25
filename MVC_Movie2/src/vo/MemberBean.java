package vo;

import java.sql.Date;

public class MemberBean {
	private String member_id;
	private String member_pass;
	private String member_name;
	private String member_address1;
	private String member_address2;
	private String member_address3;
	private String member_address4;
	private String member_address5;
	private String member_address_default;
	private String member_address1_nick;
	private String member_address2_nick;
	private String member_address3_nick;
	private String member_address4_nick;
	private String member_address5_nick;
	private String member_address_default_nick;
	private String member_phone;
	private String member_email;
	private String member_sms_ok;
	private String member_email_ok;
	private int member_mypoint;
	private int member_yechimoney;
	private String member_grade;
	private int member_used_point;
	private String member_postcode1;
	private String member_postcode2;
	private String member_postcode3;
	private String member_postcode4;
	private String member_postcode5;
	private String member_address_x1;
	private String member_address_y1;
	private String member_address_x2;
	private String member_address_y2;
	private String member_address_x3;
	private String member_address_y3;
	private String member_address_x4;
	private String member_address_y4;
	private String member_address_x5;
	private String member_address_y5;
	private Date pickStart;
	private Date joinDate;
	private Date pickEnd;
	private int page;
	private int limit;

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

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getPickEnd() {
		return pickEnd;
	}

	public void setPickEnd(Date pickEnd) {
		this.pickEnd = pickEnd;
	}

	public String getMember_id() {
		if(member_id=="") {
			member_id=null;
	} return member_id;
}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pass() {
		return member_pass;
	}

	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}

	public String getMember_name() {
		if(member_name=="") {
			member_name = null;
		}
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_address1() {
		return member_address1;
	}

	public void setMember_address1(String member_address1) {
		this.member_address1 = member_address1;
	}

	public String getMember_address2() {
		return member_address2;
	}

	public void setMember_address2(String member_address2) {
		this.member_address2 = member_address2;
	}

	public String getMember_address3() {
		return member_address3;
	}

	public void setMember_address3(String member_address3) {
		this.member_address3 = member_address3;
	}

	public String getMember_address4() {
		return member_address4;
	}

	public void setMember_address4(String member_address4) {
		this.member_address4 = member_address4;
	}

	public String getMember_address5() {
		return member_address5;
	}

	public void setMember_address5(String member_address5) {
		this.member_address5 = member_address5;
	}

	public String getMember_address_default() {
		return member_address_default;
	}

	public void setMember_address_default(String member_address_default) {
		this.member_address_default = member_address_default;
	}

	public String getMember_address1_nick() {
		return member_address1_nick;
	}

	public void setMember_address1_nick(String member_address1_nick) {
		this.member_address1_nick = member_address1_nick;
	}

	public String getMember_address2_nick() {
		return member_address2_nick;
	}

	public void setMember_address2_nick(String member_address2_nick) {
		this.member_address2_nick = member_address2_nick;
	}

	public String getMember_address3_nick() {
		return member_address3_nick;
	}

	public void setMember_address3_nick(String member_address3_nick) {
		this.member_address3_nick = member_address3_nick;
	}

	public String getMember_address4_nick() {
		return member_address4_nick;
	}

	public void setMember_address4_nick(String member_address4_nick) {
		this.member_address4_nick = member_address4_nick;
	}

	public String getMember_address5_nick() {
		return member_address5_nick;
	}

	public void setMember_address5_nick(String member_address5_nick) {
		this.member_address5_nick = member_address5_nick;
	}

	public String getMember_address_default_nick() {
		return member_address_default_nick;
	}

	public void setMember_address_default_nick(String member_address_default_nick) {
		this.member_address_default_nick = member_address_default_nick;
	}

	public String getMember_phone() {
		if(member_phone == "") {
			member_phone = null;
		}
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_email() {
		if (member_email == "") {
			member_email = null;
		}
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
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

	public int getMember_mypoint() {
		return member_mypoint;
	}

	public void setMember_mypoint(int member_mypoint) {
		this.member_mypoint = member_mypoint;
	}

	public int getMember_yechimoney() {
		return member_yechimoney;
	}

	public void setMember_yechimoney(int member_yechimoney) {
		this.member_yechimoney = member_yechimoney;
	}

	public String getMember_grade() {
		return member_grade;
	}

	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}

	public int getMember_used_point() {
		return member_used_point;
	}

	public void setMember_used_point(int member_used_point) {
		this.member_used_point = member_used_point;
	}

	public String getMember_postcode1() {
		return member_postcode1;
	}

	public void setMember_postcode1(String member_postcode1) {
		this.member_postcode1 = member_postcode1;
	}

	public String getMember_postcode2() {
		return member_postcode2;
	}

	public void setMember_postcode2(String member_postcode2) {
		this.member_postcode2 = member_postcode2;
	}

	public String getMember_postcode3() {
		return member_postcode3;
	}

	public void setMember_postcode3(String member_postcode3) {
		this.member_postcode3 = member_postcode3;
	}

	public String getMember_postcode4() {
		return member_postcode4;
	}

	public void setMember_postcode4(String member_postcode4) {
		this.member_postcode4 = member_postcode4;
	}

	public String getMember_postcode5() {
		return member_postcode5;
	}

	public void setMember_postcode5(String member_postcode5) {
		this.member_postcode5 = member_postcode5;
	}

	public String getMember_address_x1() {
		return member_address_x1;
	}

	public void setMember_address_x1(String member_address_x1) {
		this.member_address_x1 = member_address_x1;
	}

	public String getMember_address_y1() {
		return member_address_y1;
	}

	public void setMember_address_y1(String member_address_y1) {
		this.member_address_y1 = member_address_y1;
	}

	public String getMember_address_x2() {
		return member_address_x2;
	}

	public void setMember_address_x2(String member_address_x2) {
		this.member_address_x2 = member_address_x2;
	}

	public String getMember_address_y2() {
		return member_address_y2;
	}

	public void setMember_address_y2(String member_address_y2) {
		this.member_address_y2 = member_address_y2;
	}

	public String getMember_address_x3() {
		return member_address_x3;
	}

	public void setMember_address_x3(String member_address_x3) {
		this.member_address_x3 = member_address_x3;
	}

	public String getMember_address_y3() {
		return member_address_y3;
	}

	public void setMember_address_y3(String member_address_y3) {
		this.member_address_y3 = member_address_y3;
	}

	public String getMember_address_x4() {
		return member_address_x4;
	}

	public void setMember_address_x4(String member_address_x4) {
		this.member_address_x4 = member_address_x4;
	}

	public String getMember_address_y4() {
		return member_address_y4;
	}

	public void setMember_address_y4(String member_address_y4) {
		this.member_address_y4 = member_address_y4;
	}

	public String getMember_address_x5() {
		return member_address_x5;
	}

	public void setMember_address_x5(String member_address_x5) {
		this.member_address_x5 = member_address_x5;
	}

	public String getMember_address_y5() {
		return member_address_y5;
	}

	public void setMember_address_y5(String member_address_y5) {
		this.member_address_y5 = member_address_y5;
	}

}
