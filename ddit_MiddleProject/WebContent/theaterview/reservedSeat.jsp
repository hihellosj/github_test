<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.rseat.vo.ReserveVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
List<ReserveVO> list = (List<ReserveVO>) request.getAttribute("ReservedSeat");

response.setContentType("application/json; charset=utf-8");

Gson gson = new Gson();

String result = gson.toJson(list);

out.print(result);
%>