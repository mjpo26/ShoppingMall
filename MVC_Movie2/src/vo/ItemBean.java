package vo;

import java.sql.Date;

public class ItemBean {
	private int Item_code;
	private String Item_title;
	private String Item_content1;
	private String Item_content2;
	private int Item_stock_price;
	private int Item_old_price;
	private int Item_sel_price;
	private String Item_category1;
	private String Item_category2;
	private String Item_display;
	private String Item_sales; 
	private String Item_option_size;
	private String Item_color;
	private String Item_option_color1;
	private String Item_option_color2;
	private String Item_option_color3;
	private String Item_option_color4;
	private int Item_weight;
	private String Item_bgpic;
	private int Item_stock_count;
	private String Item_pic1;
	private String Item_pic2;
	private String Item_pic3;
	private String Item_pic4;	
	private int Item_point;
	private int Item_delivery_pee;
	private String Item_icon1;
	private Date Item_Date;
	private Date pickStart;
	private Date pickEnd;
	
	
	public String getItem_option_color1() {
		return Item_option_color1;
	}
	public void setItem_option_color1(String item_option_color1) {
		Item_option_color1 = item_option_color1;
	}
	public String getItem_option_color2() {
		return Item_option_color2;
	}
	public void setItem_option_color2(String item_option_color2) {
		Item_option_color2 = item_option_color2;
	}
	public String getItem_option_color3() {
		return Item_option_color3;
	}
	public void setItem_option_color3(String item_option_color3) {
		Item_option_color3 = item_option_color3;
	}
	public String getItem_option_color4() {
		return Item_option_color4;
	}
	public void setItem_option_color4(String item_option_color4) {
		Item_option_color4 = item_option_color4;
	}
	public String getItem_color() {
		return Item_color;
	}
	public void setItem_color(String item_color) {
		Item_color = item_color;
	}
	public int getItem_sel_price() {
		return Item_sel_price;
	}
	public void setItem_sel_price(int item_sel_price) {
		Item_sel_price = item_sel_price;
	}
	public String getItem_pic2() {
		return Item_pic2;
	}
	public void setItem_pic2(String item_pic2) {
		Item_pic2 = item_pic2;
	}
	public String getItem_pic3() {
		return Item_pic3;
	}
	public void setItem_pic3(String item_pic3) {
		Item_pic3 = item_pic3;
	}
	public String getItem_pic4() {
		return Item_pic4;
	}
	public void setItem_pic4(String item_pic4) {
		Item_pic4 = item_pic4;
	}
	public Date getItem_Date() {
		return Item_Date;
	}
	public void setItem_Date(Date item_Date) {
		Item_Date = item_Date;
	}
	public String getItem_display() {
		if (Item_display == "") {
			Item_display = null;
		}
		return Item_display;
	}
	public String getItem_sales() {
		if (Item_sales == "") {
			Item_sales = null;
		}
		return Item_sales;
	}
	public void setItem_display(String item_display) {
		Item_display = item_display;
	}
	public void setItem_sales(String item_sales) {
		Item_sales = item_sales;
	}
	public int getItem_code() {
		return Item_code;
	}
	public void setItem_code(int item_code) {
		Item_code = item_code;
	}
	public String getItem_title() {
		if (Item_title == "") {
			Item_title = null;
		}
		return Item_title;
	}
	public void setItem_title(String item_title) {
		Item_title = item_title;
	}
	public String getItem_content1() {
		return Item_content1;
	}
	public void setItem_content1(String item_content1) {
		Item_content1 = item_content1;
	}
	public String getItem_content2() {
		return Item_content2;
	}
	public void setItem_content2(String item_content2) {
		Item_content2 = item_content2;
	}
	public int getItem_stock_price() {
		return Item_stock_price;
	}
	public void setItem_stock_price(int item_stock_price) {
		Item_stock_price = item_stock_price;
	}
	public int getItem_old_price() {
		return Item_old_price;
	}
	public void setItem_old_price(int item_old_price) {
		Item_old_price = item_old_price;
	}

	public String getItem_category1() {
		if (Item_category1 == "") {
			Item_category1 = null;
		}
		return Item_category1;
	}
	public void setItem_category1(String item_category1) {
				Item_category1 = item_category1;
	}
	public String getItem_category2() {
		return Item_category2;
	}
	public void setItem_category2(String item_category2) {
		Item_category2 = item_category2;
	}

	public String getItem_option_size() {
		return Item_option_size;
	}
	public void setItem_option_size(String item_option_size) {
		Item_option_size = item_option_size;
	}

//	public String getItem_option_color1() {
//		return Item_option_color1;
//	}
//	public void setItem_option_color1(String item_option_color1) {
//		Item_option_color1 = item_option_color1;
//	}
//	public String getItem_option_color2() {
//		return Item_option_color2;
//	}
//	public void setItem_option_color2(String item_option_color2) {
//		Item_option_color2 = item_option_color2;
//	}
//	public String getItem_option_color3() {
//		return Item_option_color3;
//	}
//	public void setItem_option_color3(String item_option_color3) {
//		Item_option_color3 = item_option_color3;
//	}
//	public String getItem_option_color4() {
//		return Item_option_color4;
//	}
//	public void setItem_option_color4(String item_option_color4) {
//		Item_option_color4 = item_option_color4;
//	}
	public int getItem_weight() {
		return Item_weight;
	}
	public void setItem_weight(int item_weight) {
		Item_weight = item_weight;
	}
	public String getItem_bgpic() {
		return Item_bgpic;
	}
	public void setItem_bgpic(String item_bgpic) {
		Item_bgpic = item_bgpic;
	}
	public int getItem_stock_count() {
		return Item_stock_count;
	}
	public void setItem_stock_count(int item_stock_count) {
		Item_stock_count = item_stock_count;
	}
	public String getItem_pic1() {
		return Item_pic1;
	}
	public void setItem_pic1(String item_pic1) {
		Item_pic1 = item_pic1;
	}
	public int getItem_point() {
		return Item_point;
	}
	public void setItem_point(int item_point) {
		Item_point = item_point;
	}
	public int getItem_delivery_pee() {
		return Item_delivery_pee;
	}
	public void setItem_delivery_pee(int item_delivery_pee) {
		Item_delivery_pee = item_delivery_pee;
	}
	public String getItem_icon1() {
		if (Item_icon1 == "") {
			Item_icon1 = null;
		}
		return Item_icon1;
	}
	public void setItem_icon1(String item_icon1) {
		Item_icon1 = item_icon1;
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
