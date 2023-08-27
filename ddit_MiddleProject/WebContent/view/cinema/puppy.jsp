<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "../css/mainstyle.css">

<style>
		
	html, body {
	margin: 0px;
	padding: 0px;
}

body * {
	box-sizing: border-box;
	margin: 1px;
	padding: 1px;
	
}

#contatiner {
	width : 1450px;
	display: flex;
	flex-direction: column;
	margin: 0px auto;
}

#middle {
	padding-left: 13%;
	display: flex;
	flex-direction: row;
	height: auto;
}

aside {
	padding:30px;
	flex: 30%;
	background: #708090;
	width: 30%;
}

section {
	flex: 70%;

	background: white;
}

header {
	padding: 20px;
	height: 100px;
	
}

footer {
	padding: 15px;
	height: 60px;
	background: #A9A9A9;
	text-align: center;
}
iframe {
	padding:auto;
 	width: 900px;
	height: 700px;
}

body img {
	width: 70px;
	height: 50px;
}

li {
	margin-left: 10px;
}

header a {
	text-decoration: none;
	color:black;
}


/*------------------------------------------------------*/
nav ul {
	list-style-type: none;
	border-top: 3px dotted black;
	border-bottom: 3px solid black;
	border-left: none;
	border-right: none;
	height: 50px;
	padding-top: 5px
	
}

nav ul li {
	width: 15%;
	float: left;
	text-align: center;
}

nav ul li a {
	text-decoration: none;
	font-size: 1.2rem;
	letter-spacing: auto;
	text-transform: capitalize; 
}

nav ul li a:link {
	color: #708090;
}

nav ul li a:visited {
	color: #708090;
}

nav ul li a:hover {
	background: #E6E6FA;
}

nav ul li a:active {
	font-size: 1.2rem;
	text-decoration: underline;
}

nav {
	font: bold 1.0rem/25px 'Gamja Flower', cursive;
}

/*-----------------------------------------------------------*/
li{
list-style: none;
}

  .col-group.col-4 {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-wrap: wrap;
  }

  .col-group.col-4 .col {
    width: 240px;
    margin: 10px;
    text-align: center;
  }

  .col-group.col-4 img {
    width: 100%;
    height: auto;
  }

  .col-1 .col img {
    width: 1100px; /* 이미지 크기 조정 */
    height: 500px; /* 높이를 자동으로 조정하여 비율 유지 */
    border-radius: 20px; /* 이미지의 모서리를 둥글게 만듦 */
}
  
 #tt img{
 	width: 1100px; /* 이미지 크기 조정 */
    height: 500px; /* 높이를 자동으로 조정하여 비율 유지 */
    border-radius: 20px; /* 이미지의 모서리를 둥글게 만듦 */
    display: inline-block;
 
 }
  
  
 /*--*/ 
  
.tit-theater-special2 p.tit {
    text-align: center;
  }

  .tit-theater-special2 p.tit em {
    font-size: 24px;
    display: block;
  }

  .tit-theater-special2 p.tit span.txt {
    display: block;
    text-align: center;
  }
  
  
  
  /**/


  .text .tit,
  .text .sb,
  .text .txt {
    text-align: center;
	display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center; 
    }
  
  /**/


  .item {
    
    align-items: center;
  }

  .item .imgs img {
    width: 525px; /* 이미지 크기 조정 */
    height: auto; /* 높이를 자동으로 조정하여 비율 유지 */
    border-radius: 20px; /* 이미지의 모서리를 둥글게 만듦 */
   float: left;
   
  }

  .items .item .text1 {
    padding: 20px;
    text-align: left; /* 텍스트를 왼쪽으로 정렬 */
    flex: 1; /* 텍스트 영역이 자동으로 남은 공간을 차지하도록 함 */
    display: inline-block;
    
  }

ul.text1{
	width: auto;
	height: 250px;
}

  
  
  

</style>
	
	


</head>
<body>
	<div id="contatiner">
		<header>
			<h1>
				<img alt="샤넬.jpg" src="../images/샤넬.jpg"> 
				<a href="main.html">CHANEL</a>
			</h1>
		</header>

		<nav>
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">Shopping About</a></li>
				<li><a href="#">News</a></li>
				<li><a href="#">My Account</a></li>
				<li><a href="#">Contacts</a></li>
			</ul>
		</nav>

		<div id="middle">
			
	
		<div class="bg-wrap">
                    <div class="inner-wrap">
                            <div class="tit-theater-special2">
                                <p class="tit">
                                    <em>세계 최초 반려동물 동반 멀티플렉스</em><br>
                                    <span class="txt">강아지와 영화는 물론 미용,목욕,보딩,식사까지 모든 것을 오롯이 함께 즐길 수 있는 우리들의 공간</span>
                                </p>
                            </div>
                        <!-- cont-theater -->
                        <div class="cont-theater">
                            <ul class="col-group col-4">
                                <li class="col">
                                    <img src="bg-boarding.png" alt="BOARDING">
                                    <span>BOARDING</span>
                                </li>
                                <li class="col">
                                    <img src="bg-bath.png" alt="BATH">
                                    <span>BATH</span>
                                </li>
                                <li class="col">
                                    <img src="bg-salon.png" alt="SALON">
                                    <span>SALON</span>
                                </li>
                                <li class="col">
                                    <img src="bg-restaurant.png" alt="RESTAURANT">
                                    <span>RESTAURANT</span>
                                </li>
                            </ul>
                            <div class="item">
                                <div class="imgs" id="tt"><img src="puppy-view01.png" alt=""></div>
                                <ul class="text">
                                    <li class="tit">Cinema</li>
                                    <li class="sb">나의 인생 영화, 너의 견생 영화</li><br>
                                    <li class="txt">강아지와 함께 앉도록 특수 제작한 전용 소파와
                                        <br>
                                        세계 최초 반려동물 동반 영화관</li>
                                </ul>
                            </div>

                            <div class="items">
                                <div class="item">
                                    <div class="imgs">
                                       <img align="left" src="puppy-view02.png"  alt="">
                                    </div>
                                    <ul class="text1">
                                        <li class="tit">Boarding</li>
                                        <li class="sb">자유롭게, 마음껏 뛰어놀 수 있는 놀이터</li>
                                        <li class="txt">전문 과정을 거친 펫 마스터와 함께 신나는 놀이는 물론 행동 교정 프로그램까지<br>
                                            쇼핑, 영화 등 혼자만의 시간이 필요할 때 강아지도 안전하고 행복한 시간!
                                        </li>
                                    </ul>
                                </div>
                                <div class="item">
                                    <div class="imgs">
                                        <img align="left" src="puppy-view03.png"  alt="">
                                    </div>
                                    <ul class="text1">
                                        <li class="tit">Bath</li>
                                        <li class="sb">나와 네가 모두 편안한 프리미엄 바스</li>
                                        <li class="txt">20년 경력 케어 전문가의 섬세한 손길로 스파, 월풀, 하이드로바스까지<br>
                                            향기롭고 윤기가 흐르는, 프리미엄 케어의 끝판왕!
                                        </li>
                                    </ul>
                                </div>
                                <div class="item">
                                    <div class="imgs">
                                        <img align="left" src="puppy-view04.png"  alt="">
                                    </div>
                                    <ul class="text1">
                                        <li class="tit">Salon</li>
                                        <li class="sb">스타일링 맛집, 케어는 멋짐</li>
                                        <li class="txt">스트레스 없이 편안하게 위생 미용부터 최신 스타일링까지<br>
                                            미용 구독 서비스로 매일매일 리즈 시절!
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!--// cont-theater -->
                    </div>
                </div>
		
			
			
			
			
			
			
		</div>
		
		

		<footer>
			<p>Copyright (c)2023 Jeon_Sujin</p>
		</footer>


	</div>

</body>
</html>