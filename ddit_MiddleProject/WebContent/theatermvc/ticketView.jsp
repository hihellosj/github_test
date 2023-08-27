<%@page import="kr.or.ddit.rseat.vo.ReserveVO"%>
<%@page import="kr.or.ddit.feed.vo.FeedVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
<title>2U4U시네마 : Ticket</title>
<style>

body {
	background-image: url("<%=request.getContextPath()%>/images/main/2U4Uticket.jpg");
	background-repeat: no-repeat;
	background-size: 1050px auto;
	background-position: center center; /* 가운데 정렬 */
}

label{
	font-size: 18px;
}
td {
	padding: 10px;
}



button {
	color: #772675;
	border: 2px solid #772675;
	margin-left: 15px;
	width: 150px;
	height: 50px;
	font-size: 15px;
	font-weight: 700;
}

button:hover, button:focus {
	color: #fff;
	background: #772675;
}

#payment{
	margin: 420px 0px 0px 420px

}
#payment td {
	padding: 0 10px;
}

#movieInfo {
	margin-top: -40px;
    margin-left: 700px;
}

#buttonAll {
	margin-left: 39%;
}


</style>
<script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
<script>

$(function(){
	

	$(".ticketCancel").on("click", function(){
		alert("취소됐습니다!")
		<%-- location.href = "<%=request.getContextPath() %>/어디론가"; --%>
	});
	

	
});



var IMP = window.IMP;
IMP.init("imp30116400");


var today = new Date();   
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours +  minutes + seconds + milliseconds;


function requestPay() {
	
	
IMP.request_pay(
		{
			 pg: "kakaopay.TC0ONETIME", //Test는 TC0ONETIME
             pay_method: "card",
             merchant_uid: "P"+makeMerchantUid,
             name: "테스트 상점",
             amount: 1004,
             buyer_email: 'test@naver.com',
             buyer_name: 'aa',
             buyer_tel: '010-1234-5678',
             buyer_addr: '서울특별시',
             buyer_postcode: '123-456'
             
}, function(rsp) {
	if (rsp.success) {
		alert("예매가 완료되었습니다!");
		location.href = "<%=request.getContextPath() %>/movieDetail.do?m_id=movie1";
		<%-- var a =$("#a").attr('value');
		alert(a);
		alert("예매가 완료되었습니다!");
		location.href = "<%=request.getContextPath() %>/movieDetail.do?m_id=movie1; --%>
		
	      // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	      // jQuery로 HTTP 요청
	      <%--  jQuery.ajax({
	        url: "<%=request.getContextPath() %>/view/feedBoard/ticketView.jsp", 
	        method: "POST",
	        headers: { "Content-Type": "application/json" },
	        data: {
	          "imp_uid": rsp.imp_uid,            // 결제 고유번호
	          "merchant_uid": rsp.merchant_uid,  // 주문번호
	          "p_ticket_price":rsp.amount 
	          
	          /* "p_no":,
	          "p_date":,
	          "mvf_yseat":,
	          "mvf_start":,
	          "mvf_end":,
	          "m_name":,
	          "m_id": */
	        }
	      }).done(function (data) {
	        // 가맹점 서버 결제 API 성공시 로직
	        console.log(data);
	      }) --%>
	    } else {
	      alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
	    }

    /* alert(msg); */ 
});
};


</script>
</head>

<%FeedVO getTicket =  (FeedVO)request.getAttribute("getTicket"); 
ReserveVO getTickett = (ReserveVO)request.getAttribute("happy");
%>
<body>




<div id="ticket_all">
<div class="ticket_contents" style="height: 600px;">
<table id="payment" style="float:left;">
<tbody id="">
<tr class="tr1" colspan="5" >
	<th id="" scope="row">
		<label>결제번호</label>
	</th>
	<td headers="">
		P2308182032
	</td>
</tr>
<tr class="tr2" colspan="5">
	<th id="" scope="row">
		<label>결제가격</label>
	</th>
	<td headers="">
		<%=getTickett.getTOTAL_PRICE() %>
	</td>
</tr>
<tr class="tr3" colspan="5" >
	<th id="" scope="row">
		<label>결제일자</label>
	</th>
	<td headers="">
		<%=getTickett.getRESERVATION_DATE() %>
	</td>
</table>

<table id="movieInfo" style="float:left;">
<tbody id="">
<tr>
	<th id="" scope="row">
		<label>좌석번호</label>
	</th>
	<td headers="">
		<%=getTickett.getSEATS() %>
	</td>
		<th id="" scope="row">
		<label>상영시작시간</label>
	</th>
	<td headers="">
		<%=getTickett.getSHOWTIME() %>
	</td>

	<th id="" scope="row">
		<label>영화이름</label>
	</th>
	<td headers="">
		<%=getTickett.getM_name() %>
	</td>

</tr>
</tbody>
</table>
</div>
<div id="buttonAll">

<button onclick="requestPay()" value="<%=getTickett.getM_id() %>" id="a">결제하기</button>
<button type="button" class="ticketCancel">취소</button>
</div>
</div>





</body>
</html>