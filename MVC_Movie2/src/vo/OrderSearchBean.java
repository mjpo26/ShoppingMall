package vo;

import java.sql.Date;

public class OrderSearchBean {

	private int order_idx;
	private Date order_date;
	private String order_member_id;
	private String order_item_title;
	private String order_delivery_status;
	private String order_pay_status;
	private String order_payment;
	private String order_memo;
	private int page;
	private int limit;

	public int getOrder_idx() {
		return order_idx;
	}

	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getOrder_member_id() {
		return order_member_id;
	}

	public void setOrder_member_id(String order_member_id) {
		this.order_member_id = order_member_id;
	}

	public String getOrder_item_title() {
		return order_item_title;
	}

	public void setOrder_item_title(String order_item_title) {
		this.order_item_title = order_item_title;
	}

	public String getOrder_delivery_status() {
		return order_delivery_status;
	}

	public void setOrder_delivery_status(String order_delivery_status) {
		this.order_delivery_status = order_delivery_status;
	}

	public String getOrder_pay_status() {
		return order_pay_status;
	}

	public void setOrder_pay_status(String order_pay_status) {
		this.order_pay_status = order_pay_status;
	}

	public String getOrder_payment() {
		return order_payment;
	}

	public void setOrder_payment(String order_payment) {
		this.order_payment = order_payment;
	}

	public String getOrder_memo() {
		return order_memo;
	}

	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
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
