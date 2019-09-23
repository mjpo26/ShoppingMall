package vo;

import java.sql.Date;

public class OrderSearchBean {

   private int order_idx ;
   private String order_item_code ;
   private String order_item_title ;
   private String  order_item_option_color ;
   private String order_item_option_size ;
   private int order_item_sel_price ;
   private int order_item_point ;
   private int order_item_code_count;
   private int order_delivery_pee ;
   private int order_plus_point ;
   private int order_used_point;
   private String order_delivery_status ;
   private String order_pay_status ;
   private String order_payment ;
   private String order_memo;
   private String order_bank;
   private Date pickStart;
   private Date pickEnd;
   private int page;
   private int limit;
   private String order_member_id;
   private String order_item_status;
   
   public String getOrder_item_status() {
	   if(order_item_status == "") {
		   order_item_status = null;
	   }
	return order_item_status;
}
public void setOrder_item_status(String order_item_status) {
	this.order_item_status = order_item_status;
}
   
public String getOrder_bank() {
	if(order_bank == "") {
		order_bank = null;
	   }
	 return order_bank;
}
public void setOrder_bank(String order_bank) {
	 this.order_bank = order_bank;
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
  
   public String getOrder_member_id() {
	   
	   if(order_member_id == "") {
		   order_member_id = null;
	   }
	return order_member_id;
}
public void setOrder_member_id(String order_member_id) {
	this.order_member_id = order_member_id;
}

public int getOrder_idx() {
    return order_idx;
}
public void setOrder_idx(int order_idx) {
    this.order_idx = order_idx;
}
public String getOrder_item_code() {
	
	if(order_item_code == "") {
		order_item_code = null;
	}
	
    return order_item_code;
}

public void setOrder_item_code(String order_item_code) {
    this.order_item_code = order_item_code;
}
public String getOrder_item_title() {
	
	if(order_item_title == "") {
		order_item_title = null;
	}
	
    return order_item_title;
}

public void setOrder_item_title(String order_item_title) {
    this.order_item_title = order_item_title;
}
public String getOrder_item_option_color() {
    return order_item_option_color;
}
public void setOrder_item_option_color(String order_item_option_color) {
    this.order_item_option_color = order_item_option_color;
}
public String getOrder_item_option_size() {
    return order_item_option_size;
}
public void setOrder_item_option_size(String order_item_option_size) {
    this.order_item_option_size = order_item_option_size;
}
public int getOrder_item_sel_price() {
    return order_item_sel_price;
}
public void setOrder_item_sel_price(int order_item_sel_price) {
    this.order_item_sel_price = order_item_sel_price;
}
public int getOrder_item_point() {
    return order_item_point;
}
public void setOrder_item_point(int order_item_point) {
    this.order_item_point = order_item_point;
}
public int getOrder_item_code_count() {
    return order_item_code_count;
}
public void setOrder_item_code_count(int order_item_code_count) {
    this.order_item_code_count = order_item_code_count;
}
public int getOrder_delivery_pee() {
    return order_delivery_pee;
}
public void setOrder_delivery_pee(int order_delivery_pee) {
    this.order_delivery_pee = order_delivery_pee;
}
public int getOrder_plus_point() {
    return order_plus_point;
}
public void setOrder_plus_point(int order_plus_point) {
    this.order_plus_point = order_plus_point;
}
public int getOrder_used_point() {
    return order_used_point;
}
public void setOrder_used_point(int order_used_point) {
    this.order_used_point = order_used_point;
}
public String getOrder_delivery_status() {
	if(order_delivery_status == "") {
		order_delivery_status = null;
	   }
    return order_delivery_status;
}
public void setOrder_delivery_status(String order_delivery_status) {
    this.order_delivery_status = order_delivery_status;
}
public String getOrder_pay_status() {
	
	if(order_pay_status == "") {
		order_pay_status = null;
	   }
    return order_pay_status;
}
public void setOrder_pay_status(String order_pay_status) {
    this.order_pay_status = order_pay_status;
}
public String getOrder_payment() {
	
	 if(order_payment == "") {
		 order_payment = null;
	   }
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
