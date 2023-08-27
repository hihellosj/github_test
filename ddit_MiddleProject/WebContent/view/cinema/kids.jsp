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
    height: 400px; /* 높이를 자동으로 조정하여 비율 유지 */
    border-radius: 20px; /* 이미지의 모서리를 둥글게 만듦 */
}
  
 #tt img{
 	width: 1100px; /* 이미지 크기 조정 */
    height: 400px; /* 높이를 자동으로 조정하여 비율 유지 */
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

  .col-2 .col img {
    width: 525px; /* 이미지 크기 조정 */
    height: auto; /* 높이를 자동으로 조정하여 비율 유지 */
    border-radius: 20px; /* 이미지의 모서리를 둥글게 만듦 */
   float: left;
   
  }

  .col-2 .col {
    padding: 20px;
    text-align: left; /* 텍스트를 왼쪽으로 정렬 */
    flex: 1; /* 텍스트 영역이 자동으로 남은 공간을 차지하도록 함 */
    display: inline-block;
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

						<!-- cont-theater -->
						<div class="cont-theater pt00">
							<div class="col-group col-1">
								<div class="col">
									<p class="img"><img src="kids-view01.png" alt=""></p>
								</div>
							</div>

							<div class="col-group col-1">
								<div class="col">
									<p class="tit purple">Library</p>
									<p class="txt">지역과 세대를 돌보는＇함께‘, ‘더 행복한‘ 도서관</p>
									<ul class="dot-list">
										<li>새로운 놀거리가 자꾸 생겨나지만, 우리 아이와 함께 나누고 싶은 이야기는 여전히 종이 냄새가 정겨운 책 속에 가득합니다.</li>
										<li>메가박스키즈 도서관은 온 세대가 모여 책 속의 희망과 지혜를 나누는 ‘함께‘, ‘더 행복한‘ 도서관 입니다.</li>
									</ul>
									<p class="mt10 font-gblue">※ 전문 사서, 유아교육 선생님 상주<br>※ 매일 무료 운영(일부 유료 프로그램 진행)</p>
								</div>
							</div>

							<div class="col-group col-2">
								<div class="col">
									<p class="img"><img src="kids-view02.png" alt=""></p>
								</div>

								<div class="col">
									<p class="tit purple">Cinema</p>
									<p class="txt">어린이의 시선으로, 어린이의 눈높이에 맞춘 극장</p>

									<ul class="dot-list">
										<li>아이들이 자유롭게 영화를 보기 위해 좀 더 아담하고 푹신한 상영관이 필요합니다.</li>
										<li>메가박스키즈 극장은 어린이들의 눈높이를 꼭 맞춘, 특별한 극장입니다.</li>
									</ul>
									<p class="mt10 font-gblue">※ 선착순 자율 좌석제. 베이비시트가 필요 없는 어린이 전용 소파</p>
								</div>
							</div>

							<div class="col-group col-2">
								<div class="col">
									<p class="img"><img src="kids-view03.png" alt=""></p>
								</div>

								<div class="col">
									<p class="tit purple">Cafe</p>
									<p class="txt">온 가족에게 안전한 먹거리를 선사할 건강한 카페</p>

									<ul class="dot-list">
										<li>온 가족이 함께, 더 행복하게 머물기 위해 먹거리까지도 안심하고 즐길 수 있어야 합니다.</li>
										<li>메가박스키즈 카페는 안전한 먹거리를 재미있게 즐길 수 있는 건강한 카페입니다.</li>
									</ul>
									<p class="mt10 font-gblue">※ 공정무역 유기농 커피와 자연을 그대로 담은 건강한 스무디 등</p>
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