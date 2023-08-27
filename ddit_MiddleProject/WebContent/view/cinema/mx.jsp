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
.col-1 .col img {
    width: 1100px; /* 이미지 크기 조정 */
    height: 500px; /* 높이를 자동으로 조정하여 비율 유지 */
    border-radius: 20px; /* 이미지의 모서리를 둥글게 만듦 */
  
    
}


.col-3 {
  display: flex; /* 이미지를 가로로 정렬하기 위해 flexbox 사용 */
  justify-content: center; /* 가운데 정렬 */
}

.col {
  text-align: center; /* 이미지와 텍스트를 가운데 정렬 */
  margin: 10px 60px; /* 이미지와 글자 사이에 간격 추가 */
  width: 245px; /* 이미지와 글자의 너비를 조정 */
}

.col img {
  width: 100%; /* 이미지 너비를 100%로 설정하여 부모 요소에 맞춤 */
  height: auto; /* 높이를 자동으로 조정하여 비율 유지 */
  display: block; /* 이미지들이 한 줄에 나타나도록 block 속성 추가 */
}

.col p.bottom-txt {
  width: 100%; /* 글자 너비를 100%로 설정하여 부모 요소에 맞춤 */
  text-align: left; /* 텍스트를 왼쪽으로 정렬 */
  margin-top: 10px; /* 텍스트와 이미지 사이의 간격 추가 */
}



.cont-boutique-private {
    text-align: center; /* <span> 태그를 가운데로 정렬 */
}

.tit span p.tit{
    display: inline-block;
    background-color: #f0f0f0; /* 선택 사항: <span>에 배경색을 추가하여 더 나은 가시성 확보 */
    padding: 5px 10px;
    border-radius: 10px;
}

.box {
    display: flex; /* <li> 요소들을 가로로 나열하기 위해 flexbox 사용 */
    justify-content: center; /* <li> 요소들을 가로로 가운데로 정렬 */
    margin-top: 20px; /* <span>과 <ol> 목록 사이에 간격 추가 */
}

.box li {
    flex: 1; /* <li> 요소들이 가로 공간을 동일하게 분배하도록 설정 */
    text-align: center; /* <li> 요소 내용을 가운데로 정렬 */
}

.num {
    font-size: 20px; /* 선택 사항: 디자인에 맞게 글꼴 크기 조정 */
    font-weight: bold; /* 선택 사항: 디자인에 맞게 글꼴 두께 조정 */
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


.cont-tit{
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
			
			
			<div class="theater-specail-cont">


			<!-- section -->
			<div class="section sectionInfo">
				<!-- bg-wrap -->
				<div class="bg-wrap">
					<div class="inner-wrap">
						<div class="tit-theater-special">
							<p class="tit">
								<em>MX - THE TRUE SOUND</em>
								<span class="txt">차세대 영화관의 표준을 제시하는 메가박스가 이번에는 영화 사운드에 주목합니다.</span>
							</p>
						</div>

						<!-- cont-theater -->
						<div class="cont-theater">

							<div class="col-group col-1">
								<div class="col">
									<p class="img"><img src="mx-view01.png" alt=""></p>
								</div>
							</div>
						</div>
						<!--// cont-theater -->
					</div>
				</div>
				<!--// bg-wrap -->
			</div>
			<!--// section -->

			<!-- section -->
			<div class="section mt70 sectionInfo">
				<!-- bg-wrap -->
				<div class="bg-wrap bg">
					<div class="inner-wrap">
						<div class="cont-theater pt00">

							<div class="col-group col-3">
								<div class="col">
									<p class="img"><img src="mx-view02.png" alt=""></p>
									<p class="bottom-txt">
										<strong class="font-roboto regular">3D SOUND SYSTEM</strong>
										영화 속 각각의 사운드를 개별적으로<br>컨트롤하는 가장 진화된 입체음향
									</p>
								</div>

								<div class="col">
									<p class="img"><img src="mx-view03.png" alt=""></p>
									<p class="bottom-txt">
										<strong class="font-roboto regular">PROFESSIOPNAL CINEMA SPEAKER</strong>
										카네기홀과 오페라하우스에서 사용하는<br>마이어 스피커 69개 설치
									</p>
								</div>

								<div class="col">
									<p class="img"><img src="mx-view04.png" alt=""></p>
									<p class="bottom-txt">
										<strong class="font-roboto regular">3D SOUND SYSTEM</strong>
										세계적인 사운드 디자이너 밥매카시의<br>튜닝을 통해 최적화된 영화 사운드 전달
									</p>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- bg-wrap -->
			</div>
			<!--// section -->

			<!-- section -->
			<div class="section mt70 sectionInfo">
				<!-- bg-wrap -->
				<div class="bg-wrap">
					<div class="inner-wrap">

						<!-- cont-theater -->
						<div class="cont-theater pt00">
							<p class="cont-tit">진정한 영화 사운드를  선사하는 MX관은<br>DCI기준 17(ft-L)을 충족하는 스크린 밝기와 와이드 시트를 통해 최적의 영화 경험을 선사합니다.</p>
							<div class="col-group col-1">
								<div class="col">
									<p class="img"><img src="mx-view05.png" alt=""></p>
								</div>
							</div>
							<p class="mt10 a-c font-gblue">※ DCI(Digital Cinema Initiatives, LLC) : 관객에게 최적화된 디지털 영상 기준을 제시하는 헐리우드 스튜디오 연합</p>

						</div>
						<!--// cont-theater -->
					</div>
				</div>
				<!--// bg-wrap -->
			</div>
			<!--// section -->

			<!-- section -->

			<!--// section -->
		</div>
			
		
			
		</div>
		
		

		<footer>
			<p>Copyright (c)2023 Jeon_Sujin</p>
		</footer>


	</div>

</body>
</html>