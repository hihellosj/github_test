<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/customerservice.css"> 
<style type="text/css">
.category_content li.active a {
    font-weight: 600;
    color: #222;
  } 
     .tab_wrap.outer 
    padding-top: 80px; 
 } 

.tab_wrap { 
     position: relative; 
 } 

 ul { 
    display: block; 
     list-style-type: disc; 
     margin-block-start: 1em; 
     margin-block-end: 1em; 
     margin-inline-start: 0px; 
     margin-inline-end: 0px; 
    padding-inline-start: 40px; 
 } 


ul, ol {
    list-style: none;
}

.tab_wrap  .tab_con {
    overflow: inherit;
    position: relative;
    width: auto;
    height: auto;
}

.hidden {
    overflow: hidden;
    position: absolute !important;
    width: 1px;
    height: 1px;
    clip: rect(1px, 1px, 1px, 1px);
}	

h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

.contents_customer .con_top.ty3 {
    text-align: left;
    padding: 35px;
}

.contents_customer .con_top {
    position: relative;
    background-color: #F8F8F8;
    padding: 35px 0;
    text-align: center;
}

div {
    display: block;
}

.con_top p {
    font-size: 15px;
    line-height: 24px;
    margin-left: 30px;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.con_top {
    position: relative;
    background-color: #F8F8F8;
    margin-top: 30px;
    padding: 20px 0;
}

.con_tit {
    font-size: 20px;
    margin: 20px 0;
}

.con_tit.ty2 .tit {
    display: inline-block;
}

h4 {
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: normal;
}

.con_tit .group_rgt {
    float: right;
    margin-top: 40px;
}

.con_tit .txt_req {
    font-size: 14px;
    color: #FF243E;
}

.tbl_form {
    border-top: 1px solid #BBBBBB;
    margin-bottom: 60px;
}

table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    border: 0;
    display: table;
    box-sizing: border-box;
    text-indent: initial;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<div id="container">
        <div id="contents">
            <div class="cs_title">
            	<a href=""><h3>고객센터</h3></a>
            </div>
            <div class="category_menu">
                <div class="category_contents_wrap">
                    <ul class="category_content">
                        <li id="cm1" name="categorymenu" class="">
                            <a href="<%=request.getContextPath()%>/boardmvc/FAQmain.jsp">FAQ</a>
                        </li>
                         <li id="cm2" name="categorymenu" class="active">
                            <a href="<%=request.getContextPath()%>/boardmvc/공지사항.html">공지사항</a>
                        </li>
                        <li id="cm3" name="categorymenu" class="">
                            <a href="l">1:1문의</a>
                        </li>
                        <li id="cm5" name="categorymenu" class="">
                            <a href="">분실물문의</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>    
</body>
</html>