<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.or.ddit.theater.vo.TheaterVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

List<TheaterVO> list = (List<TheaterVO>)request.getAttribute("theaterList");

response.setContentType("application/json; charset=utf-8");
JsonObject obj = new JsonObject();

if(list != null && list.size()>0){
	
	obj.addProperty("sw", "ok");
	
	Gson gson = new Gson();
	JsonElement ele = gson.toJsonTree(list);
	
	obj.add("datas",ele);
	
}else{
	obj.addProperty("sw", "no");
}

out.print(obj);





%>






