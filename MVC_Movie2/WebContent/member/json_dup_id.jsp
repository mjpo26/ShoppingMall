<%@page import="org.json.simple.JSONObject"%>
<%@page import="svc.MemberUserCheckService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
      //String id = request.getParameter("id");
String id ="admin";
	MemberUserCheckService wms = new MemberUserCheckService();
    JSONObject json = wms.searchId(id);
      out.println(json.toJSONString());
%>
  