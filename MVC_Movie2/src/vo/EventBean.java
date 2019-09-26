package vo;

import java.sql.Date;

public class EventBean {
private int event_num;  //
private int event_readCount; //
private Date event_date;//
private String event_subject;//
private String event_content;//
private String event_summary;
private String event_status;//
private String event_imageMain;//
private String event_imageBackground;//
private String event_banner;
private String event_banner2;


public Date getEvent_date() {
	return event_date;
}
public void setEvent_date(Date event_date) {
	this.event_date = event_date;
}
public int getEvent_readCount() {
	return event_readCount;
}
public void setEvent_readcount(int event_readCount) {
	this.event_readCount = event_readCount;
}
public int getEvent_num() {
	return event_num;
}
public void setEvent_num(int event_num) {
	this.event_num = event_num;
}
public String getEvent_subject() {
	return event_subject;
}
public void setEvent_subject(String event_subject) {
	this.event_subject = event_subject;
}
public String getEvent_content() {
	return event_content;
}
public void setEvent_content(String event_content) {
	this.event_content = event_content;
}
public String getEvent_summary() {
	return event_summary;
}
public void setEvent_summary(String event_summary) {
	this.event_summary = event_summary;
}
public String getEvent_status() {
	return event_status;
}
public void setEvent_status(String event_status) {
	this.event_status = event_status;
}
public String getEvent_imageMain() {
	return event_imageMain;
}
public void setEvent_imageMain(String event_imageMain) {
	this.event_imageMain = event_imageMain;
}
public String getEvent_imageBackground() {
	return event_imageBackground;
}
public void setEvent_imageBackground(String event_imageBackground) {
	this.event_imageBackground = event_imageBackground;
}
public String getEvent_banner() {
	return event_banner;
}
public void setEvent_banner(String event_banner) {
	this.event_banner = event_banner;
}
public String getEvent_banner2() {
	return event_banner2;
}
public void setEvent_banner2(String event_banner2) {
	this.event_banner2 = event_banner2;
}


}
