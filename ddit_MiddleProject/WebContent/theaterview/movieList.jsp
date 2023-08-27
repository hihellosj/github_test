<%@page import="kr.or.ddit.moviebook.vo.MovieVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

List<MovieVO> list = (List<MovieVO>)request.getAttribute("MovieList");

response.setContentType("application/json; charset=utf-8");

Gson gson = new Gson();

String result = gson.toJson(list);

out.print(result);


%>








