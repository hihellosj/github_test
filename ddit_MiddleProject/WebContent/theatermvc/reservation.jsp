<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
if (request.getParameter("theaterName") != null) {
    String theaterName = request.getParameter("theaterName");
    String movieId = request.getParameter("movieId");
    String theaterId = request.getParameter("theaterId");
    String showtime = request.getParameter("showtime");
    String seats = request.getParameter("seats");
    int adultCount = Integer.parseInt(request.getParameter("adultCount"));
    int teenCount = Integer.parseInt(request.getParameter("teenCount"));
    int kidCount = Integer.parseInt(request.getParameter("kidCount"));
    int discountCount = Integer.parseInt(request.getParameter("discountCount"));
    int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
    String reservationDate = request.getParameter("reservationDate");
    
    
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbUser = "midtest";
    String dbPassword = "java";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("oracle.jdbc.OracleDriver");
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        String insertQuery = "INSERT INTO RESERVATION_INFO (MOVIE_ID, THEATER_ID, SHOWTIME, SEATS, ADULT_COUNT, TEEN_COUNT, KID_COUNT, DISCOUNT_COUNT, TOTAL_PRICE, RESERVATION_DATE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(insertQuery);
        pstmt.setString(1, movieId);
        pstmt.setString(2, theaterId);
        pstmt.setString(3, showtime);
        pstmt.setString(4, seats);
        pstmt.setInt(5, adultCount);
        pstmt.setInt(6, teenCount);
        pstmt.setInt(7, kidCount);
        pstmt.setInt(8, discountCount);
        pstmt.setInt(9, totalPrice);
        pstmt.setString(10, reservationDate);

        pstmt.executeUpdate();

        pstmt.close();
        conn.close();

        out.println("예매가 성공적으로 완료되었습니다.");
    } catch (Exception e) {
    	e.printStackTrace();
        out.println("예매를 저장하는 동안 오류가 발생했습니다: " + e.getMessage());
    }
}
%>