<%@page import="java.io.File"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%

Calendar cal =Calendar.getInstance();
int year =cal.get(Calendar.YEAR);
int month =cal.get(Calendar.MONTH)+1;
int date =cal.get(Calendar.DATE);

// String DateDir="\\"+year+"\\"+month+"\\"+date+"\\";

// 이미지 업로드할 경로
String uploadPath = request.getRealPath("/upload");
System.out.println(uploadPath);
//경로에 폴더가 없으면 만들어 준다
File targetDir = new File(uploadPath);
if(!targetDir.exists()){
	targetDir.mkdirs();
}


int size = 10 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하

String fileName = ""; // 파일명
int filesize=0;
try{
       // 파일업로드 및 업로드 후 파일명 가져옴
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String file = (String)files.nextElement(); 
	fileName = multi.getFilesystemName(file); 
	
	File f= new File(uploadPath.replace('\\','/')+fileName);
	filesize = (int)f.length();

	
}catch(Exception e){
	e.printStackTrace();
}

   // 업로드된 경로와 파일명을 통해 이미지의 경로를 생성
// uploadPath ="./upload"+ DateDir.replace("\\","/")+fileName;
uploadPath ="./upload";

   // 생성된 경로를 JSON 형식으로 보내주기 위한 설정
JSONObject jobj = new JSONObject();
jobj.put("url", uploadPath);
jobj.put("fileName", uploadPath +"?"+fileName+"?"+filesize+"?E"); 


response.setCharacterEncoding("UTF-8");

response.setContentType("application/json");


out.print(jobj);
%>