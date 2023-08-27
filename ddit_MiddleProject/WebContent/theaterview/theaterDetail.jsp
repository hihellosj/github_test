<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.theater.vo.TheaterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

TheaterVO vo = (TheaterVO)request.getAttribute("theaterDetail");

response.setContentType("application/json; charset=utf-8");

Gson gson = new Gson();
String result = gson.toJson(vo);

out.print(result);


%>
    
    