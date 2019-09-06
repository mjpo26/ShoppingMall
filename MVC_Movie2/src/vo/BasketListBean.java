package vo;

import java.sql.Date;

public class BasketListBean {
	
	private String basket_code;
	private String basket_title;
	private String basket_option_color;
	private String basket_option_size;
	private int basket_sel_price;
	private int basket_new_price;
	private int basket_point;
	private int basket_code_count;
	private int basket_delivery_pee;
	private Date basket_date;
	private int basket_idx;
	private String basket_member_id;
	
	public String getBasket_code() {
		return basket_code;
	}
	public void setBasket_code(String basket_code) {
		this.basket_code = basket_code;
	}
	public String getBasket_title() {
		return basket_title;
	}
	public void setBasket_title(String basket_title) {
		this.basket_title = basket_title;
	}
	public String getBasket_option_color() {
		return basket_option_color;
	}
	public void setBasket_option_color(String basket_option_color) {
		this.basket_option_color = basket_option_color;
	}
	public String getBasket_option_size() {
		return basket_option_size;
	}
	public void setBasket_option_size(String basket_option_size) {
		this.basket_option_size = basket_option_size;
	}
	public int getBasket_sel_price() {
		return basket_sel_price;
	}
	public void setBasket_sel_price(int basket_sel_price) {
		this.basket_sel_price = basket_sel_price;
	}
	public int getBasket_new_price() {
		return basket_new_price;
	}
	public void setBasket_new_price(int basket_new_price) {
		this.basket_new_price = basket_new_price;
	}
	public int getBasket_point() {
		return basket_point;
	}
	public void setBasket_point(int basket_point) {
		this.basket_point = basket_point;
	}
	public int getBasket_code_count() {
		return basket_code_count;
	}
	public void setBasket_code_count(int basket_code_count) {
		this.basket_code_count = basket_code_count;
	}
	public int getBasket_delivery_pee() {
		return basket_delivery_pee;
	}
	public void setBasket_delivery_pee(int basket_delivery_pee) {
		this.basket_delivery_pee = basket_delivery_pee;
	}
	public Date getBasket_date() {
		return basket_date;
	}
	public void setBasket_date(Date basket_date) {
		this.basket_date = basket_date;
	}
	public int getBasket_idx() {
		return basket_idx;
	}
	public void setBasket_idx(int basket_idx) {
		this.basket_idx = basket_idx;
	}
	public String getBasket_member_id() {
		return basket_member_id;
	}
	public void setBasket_member_id(String basket_member_id) {
		this.basket_member_id = basket_member_id;
	}
	
	
}
