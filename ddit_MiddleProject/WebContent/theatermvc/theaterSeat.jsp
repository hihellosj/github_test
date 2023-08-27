<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page isELIgnored="true" %>  
  
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="DuetoPark">
    <meta name="keywords" content="movie, 회원 페이지, 마이 페이지">
    <meta name="description" content="💪아이라잌투무빗무비💪 프로필 수정, 좌석예매, 예매내역 확인, 작성후기 확인을 이 페이지에서 한 번에!">
    <title>Movie - 마이페이지</title>

    <!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- Reset CSS -->
    <link rel="stylesheet" type="text/css" href="../build/reset-css.css">
    <!-- Framework -->
    <link rel="stylesheet" href="../css/grid.min.css">
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="../build/common.css">
    <link rel="stylesheet" type="text/css" href="../build/style-mypage.css">
    <!-- 반응형 CSS -->
    <link rel="stylesheet" type="text/css" href="../build/responsive/common.css">
    <link rel="stylesheet" type="text/css" href="../build/responsive/style-mypage.css">
 	

 
 
 
 
 
 
 
 
 
 
 
  </head>

  <body>

    <main class="container">
    

    


      <article id="reservation" class="reservation d-flex justify-content-center" aria-labelledby="reservation-title">
        <form class="reservation-form row background d-flex flex-wrap justify-content-center align-items-center" action="index.html" method="post" aria-labelledby="reservation-title">
          <h2 id="reservation-title" class="title col-12 col-md-10">
            좌석예매
          </h2>

          <section id="step-time" class="step col-12 col-md-9" aria-labelledby="time-title">
            <h3 id="time-title" class="subtitle flex-shrink-0">상영시간표</h3>
            <ul class="movie-list d-flex flex-wrap justify-content-between" aria-label="영화">
              <!-- mypage.js 상영시간표 출력 -->
            </ul>
          </section>

          <section id="step-count" class="step col-12 col-md-9 d-flex flex-column align-items-center" aria-labelledby="count-title">
            <h3 id="count-title" class="subtitle">인원 선택</h3>

            <ol class="d-flex flex-column align-items-center flex-sm-wrap flex-sm-row justify-content-sm-around" aria-label='인원'>
              <!-- mypage.js 인원 선택 - 클론 노드 -->
            </ol>
          </section>

          <section id="step-seat" class="step col-12 col-md-9 d-flex flex-column align-items-md-center" aria-labelledby="seat-title">
            <h3 id="seat-title" class="subtitle">좌석 선택</h3>

            <div class="table-wrapper inactive">
              <table class="seat-table" aria-label="좌석">
                <thead>
                  <!-- mypage.js 좌석선택 출력 -->
                </thead>
                <tbody>
                  <!-- mypage.js 좌석선택 출력 -->
                </tbody>
              </table>
            </div>
          </section>

          <section id="step-check" class="col-12 col-md-9 d-flex flex-column" aria-labelledby="check-title">
            <h3 id="check-title" class="subtitle">선택 확인</h3>

            <dl class="mypage-dl d-flex flex-column flex-md-row justify-content-md-between" aria-label="확인사항">
              <div id="check-name">
                <dt class="mypage-term" aria-label="영화명">영화명</dt>
                <dd class="mypage-desc" aria-live="polite"></dd>
              </div>
              <div id="check-seat">
                <dt class="mypage-term" aria-label="좌석">좌석</dt>
                <dd class="mypage-desc" aria-live="polite"></dd>
              </div>
              <div id="check-count">
                <dt class="mypage-term" aria-label="인원">인원</dt>
                <dd class="mypage-desc total" aria-live="polite"></dd>
                <dd class="mypage-desc details d-flex flex-wrap flex-md-column" aria-live="polite"></dd>
              </div>
              <div id="check-price" class="d-flex justify-content-end align-items-center">
                <dt class="mypage-term" aria-label="금액">금액</dt>
                <dd class="mypage-desc" aria-live="polite"><strong id="total-price"></strong>원</dd>
              </div>
            </dl>
            <button type="button" class="finish inactive">선택완료</button>
          </section>
        </form>
      </article>


    </main>

    

    <!-- 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- 데이터 -->
    <script src="../assets/data/data.js"></script>
    <script src="../assets/data/data-seat.js"></script>
    <!-- 동작 -->
    <script src="../assets/polyfill.js"></script>
    <script src="../assets/lib/reservation.js"></script>
    
    
    
    
  </body>
</html>