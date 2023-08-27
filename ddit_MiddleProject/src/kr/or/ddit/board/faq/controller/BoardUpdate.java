package kr.or.ddit.board.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.faq.service.BoardServiceImpl;
import kr.or.ddit.board.faq.service.IBoardService;
import kr.or.ddit.board.faq.vo.FaqBoardVO;

//FAQ게시판 게시글 수정 서블릿
@WebServlet("/boardUpdate.do")
public class BoardUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IBoardService boardService = BoardServiceImpl.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        
        //수정할 게시글 번호를 가져온다
        int fb_no = Integer.parseInt(request.getParameter("fb_no"));
        
        //게시글 번호를 이용하여 해당 게시글 정보 가져옴
        FaqBoardVO boardVO = boardService.getBoard(fb_no);

        //boardVO 객체에 fb_no 설정
        boardVO.setFb_no(fb_no);

        //boardVO 객체를 request에 추가
        request.setAttribute("boardVO", boardVO);

        //수정 폼 페이지로 이동
        request.getRequestDispatcher("/boardmvc/boardUpdateForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String fb_title = request.getParameter("fb_title");
        String fb_content = request.getParameter("fb_content");
        String fb_ctg = request.getParameter("fb_ctg");
        int fb_no = Integer.parseInt(request.getParameter("fb_no")); // 기존의 fb_no 값 사용

        //수정된 내용을 boardVO 객체에 설정
        FaqBoardVO boardVO = new FaqBoardVO();
        boardVO.setFb_no(fb_no); // 기존의 fb_no 값을 유지
        boardVO.setFb_title(fb_title);
        boardVO.setFb_content(fb_content);
        boardVO.setFb_ctg(fb_ctg);
        
        System.out.println(boardVO);

        //수정 작업 
        boardService.updateBoard(boardVO);

        //수정 후 리스트로 이동
        response.sendRedirect(request.getContextPath() + "/boardList.do");
    }
}