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
 .chair-box.col-4 {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-wrap: wrap;
  }

  .chair-box.col-4 .col {
    width: 240px;
    margin: 10px;
    text-align: center;
  }


  .chair-box .col img {
    width: 100%;
    height: auto;
  }
  
  .col-1 .col img {
    width: 1100px; /* 이미지 크기 조정 */
    height: 500px; /* 높이를 자동으로 조정하여 비율 유지 */
    border-radius: 20px; /* 이미지의 모서리를 둥글게 만듦 */
    margin: 10px;
    text-align: center;
     
}

  .col-2 .col img {
    width: 530px; /* 이미지 크기 조정 */
    height: 320px; /* 높이를 자동으로 조정하여 비율 유지 */
    border-radius: 20px; /* 이미지의 모서리를 둥글게 만듦 */
    margin: 10px;
  
   
}

.col-2{
 display: flex;
 justify-content: center;
}



.tit-theater-special p.tit {
    text-align: center;
  }

  .tit-theater-special p.tit em {
    font-size: 24px;
    display: block;
  }

  .tit-theater-special p.tit span.txt {
    display: block;
    text-align: center;
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
						<div class="tit-theater-special">
							<p class="tit">
								<em>COMFORT SEAT FOR YOU</em>
								<span class="txt">당신을 위해 특별히 준비한 다양한 타입의 여유 공간을 통해서 편안한 관람 환경을 제공합니다.</span>
							</p>
						</div>

						<!-- cont-theater -->
						<div class="cont-theater">

							<div class="chair-box col-group col-4">
								<div class="col">
									<p class="img"><img src="bg-table-chair.png" alt=""></p>
									<p class="title">Front Table</p>
									<p>두 손을 자유롭게하는<br>프론트 테이블</p>
								</div>
								<div class="col">
									<p class="img"><img src="bg-arm-chair.png" alt=""></p>
									<p class="title">Double Arm Chair</p>
									<p>팔걸이에 대한 논쟁을<br>종식시키는 양팔걸이 좌석</p>
								</div>
								<div class="col">
									<p class="img"><img src="bg-side-chair.png" alt=""></p>
									<p class="title">Side Table</p>
									<p>쾌적한 영화관람을 위해<br>나만의 테이블</p>
								</div>
								<div class="col">
									<p class="img"><img src="bg-wide-chair.png" alt=""></p>
									<p class="title">Wide Seat</p>
									<p>감각적인 디자인에<br>안락함을 더한 와이드 시트</p>
								</div>
							</div>

							<div class="col-group col-1">
								<div class="col">
									<p class="img"><img src="comfort-view01.png" alt=""></p>
								</div>
							</div>

							<div class="col-group col-2">
								<div class="col">
									<p class="img"><img src="comfort-view02.png" alt=""></p>
								</div>
								<div class="col">
									<p class="img"><img src="comfort-view03.png" alt=""></p>
								</div>
							</div>

							<p class="mt10 font-gblue">※ 상영관의 상세 사양은 지점별로 다를 수 있습니다.</p>
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