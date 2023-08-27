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
    height: 400px; /* 높이를 자동으로 조정하여 비율 유지 */
    border-radius: 20px; /* 이미지의 모서리를 둥글게 만듦 */
}

.col-4 {
    display: flex; /* Use flexbox */
    justify-content: center; /* Horizontally align items to the center */
}

.col {
    padding: 20px;
}

.col img {
    width: 245px; /* Make images take up full width of their parent container */
    height: 245px;
    border-radius: 20px;
}

.cont-boutique-private {
    text-align: center; /* <span> 태그를 가운데로 정렬 */
}

.tit span {
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
			
			
			
			<div class="cont-theater">
							<div class="col-group col-1">
								<div class="col">
									<p class="img">
										<img src="private1.png" alt="">
									</p>
								</div>
							</div>

							<div class="cont-boutique-private">
								<p class="tit"><span>ESPECIALLY FOR YOU</span></p>

								<div class="box">
									<ol>
										<li>
											<p class="num">01</p>
											<p class="txt">
                                                소중한 사람들과 특별한 날을<br> 기념할 수 있는 독립된 상영관
											</p>
										</li>
										<li>
											<p class="num">02</p>
											<p class="txt">
                                                당신을 위한 편안하고<br> 프라이빗한 전용 라운지
											</p>
										</li>
										<li>
											<p class="num">03</p>
											<p class="txt">
                                                프리미엄 어매니티와<br> 전담 컨시어지 서비스
											</p>
										</li>
									</ol>
								</div>
							</div>

							<div class="col-group col-4">
								<div class="col">
									<p class="img"><img src="private2.png" alt=""></p>
								</div>

								<div class="col">
									<p class="img"><img src="private3.png" alt=""></p>
								</div>

								<div class="col">
									<p class="img"><img src="private4.png" alt=""></p>
								</div>

								<div class="col">
									<p class="img"><img src="private5.png" alt=""></p>
								</div>
							</div>

							<div class="col-group col-1">
								<div class="col">
									<p class="tit">SPECIAL SERVICE</p>

                                    <dl class="dotListv2">
                                        <dt>Private Lounge : 독립된 라운지 내 전용 화장실과 프리미엄 공간으로  편안한 시간을 보내실 수 있습니다.</dt>
                                        <dt>concierge service : 체크인 및 에스코트, 코트체크, 전담 룸 서비스, 와인 콜키지 서비스</dt>
                                        <dt>Exclusive Service : 프라이빗 고객만을 위한 특별한 웰컴서비스 제공</dt>
                                        <dd>- 다양한 웰컴드링크 및 웰컴푸드(베이커리) 제공</dd>
                                        <dd>- 편안한 관람을 위한 어매니티 제공 (무릎담요, 실내화 등)</dd>
                                        <dd>- 에어드레서, 슈즈케어, 블루투스 스피커, 무선 충전기 등 라운지 내 편의 시설 제공</dd>
                                    </dl>

                                    <p class="tit mt40">Private 2호 전용 Plus서비스</p>
                                    <dl class="dotListv2">
                                        <dt>개인의 취향에 맞게 자유롭게 조정가능한 상영관 조도, 음향 조절시스템</dt>
                                        <dt>업그레이드 된 라운지 공간으로 추가 편의시설 제공 (개인 소지품 보관함, TV 등)</dt>
                                    </dl>


									<p class="mt10 font-gblue">※ 특별한 행사를 위한 맞춤형 서비스는 대관 문의를 통해 접수해 주시기 바랍니다.</p>
								</div>
							</div>
						</div>
			
			
			
			
			
			
			
			
			
		</div>
		
		

		<footer>
			<p>Copyright (c)2023 Jeon_Sujin</p>
		</footer>


	</div>

</body>
</html>