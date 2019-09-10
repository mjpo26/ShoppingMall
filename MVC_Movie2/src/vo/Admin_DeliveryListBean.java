package vo;

import java.sql.Date;

public class Admin_DeliveryListBean {
	
	private int delivery_idx;
	private Date delivery_date;
	private String delivery_code;
	private String delivery_title;
	private String delivery_member_id;
	private String delivery_sel_price;
	private String delivery_bank;
	private String delivery_ok;
	private String delivery_memo;
	
	public String getDelivery_memo() {
		return delivery_memo;
	}
	public void setDelivery_memo(String delivery_memo) {
		this.delivery_memo = delivery_memo;
	}
	public int getDelivery_idx() {
		return delivery_idx;
	}
	public void setDelivery_idx(int delivery_idx) {
		this.delivery_idx = delivery_idx;
	}
	public Date getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(Date delivery_date) {
		this.delivery_date = delivery_date;
	}
	
	public String getDelivery_code() {
		
		if(delivery_code == "") {
			delivery_code = null;
		}
		return delivery_code;
	}
	
	public void setDelivery_code(String delivery_code) {
		this.delivery_code = delivery_code;
	}
	public String getDelivery_title() {
		
		if(delivery_title == "") {
			delivery_title = null;
		}
		return delivery_title;
	}
	
	public void setDelivery_title(String delivery_title) {
		this.delivery_title = delivery_title;
	}
	public String getDelivery_member_id() {
		
		if(delivery_member_id == "") {
			delivery_member_id = null;
		}
		return delivery_member_id;
	}
	
	public void setDelivery_member_id(String delivery_member_id) {
		this.delivery_member_id = delivery_member_id;
	}
	public String getDelivery_ok() {
		return delivery_ok;
	}
	public void setDelivery_ok(String delivery_ok) {
		this.delivery_ok = delivery_ok;
	}

	public String getDelivery_sel_price() {
		return delivery_sel_price;
	}
	public void setDelivery_sel_price(String delivery_sel_price) {
		this.delivery_sel_price = delivery_sel_price;
	}
	public String getDelivery_bank() {
		return delivery_bank;
	}
	public void setDelivery_bank(String delivery_bank) {
		this.delivery_bank = delivery_bank;
	}
}
