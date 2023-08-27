$(document).ready(function()
{
    // 헤더 스크롤 이벤트 시작
    var headerHeight = 106;
    $(window).scroll(function()
    {
        var _Scroll = getScroll();
        if(_Scroll >= headerHeight)
        {
            $("#header").addClass("hdScroll");
            $("#header_btn").addClass("hdbtnNone");
            $(".logo").addClass("logoMt");
            $("#gnb").addClass("gnbHei");
            $("#sitemap").addClass("siteTop"); 
        }
        else
        {
            $("#header").removeClass("hdScroll");
            $("#header_btn").removeClass("hdbtnNone");
            $(".logo").removeClass("logoMt");
            $("#gnb").removeClass("gnbHei");
            $("#sitemap").removeClass("siteTop");
        }
    });
    function getScroll()
    {
        return window.pageYOffset || document.documentElement.scrollTop;
    }
    // 헤더 스크롤 이벤트 종료
    
    // 사이트맵 이벤트 시작
    $('#header_wrap #gnb .all_Menu a').on('click', function () {
        $('#sitemap').toggleClass('site_show');
    });
    // 사이트맵 이벤트 종료


});