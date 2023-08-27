package kr.or.ddit.board.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.notice.service.BoardServiceImpl;
import kr.or.ddit.board.notice.service.IBoardService;
import kr.or.ddit.board.notice.vo.NoticeBoardVO;


@WebServlet("/board/*")
public class BoardController extends HttpServlet {
	
	private IBoardService service = BoardServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청 URI를 얻어온다
		String requestUri = request.getRequestURI();

		//ContextPath를 얻어온다.
		//ContextPath란 요청시 Root를 뜻한다.
		String contextPath = request.getContextPath();
		
		//ContextPath를 제외한 나머지 URI를 command라고 지칭한다.
		String command = requestUri.substring(contextPath.length());
		
		System.out.println(requestUri);	// /BoardWebProject/board/list.do
		System.out.println(contextPath); // /boardWebProject
		System.out.println(command);	// /Board/list.do
		
		request.setCharacterEncoding("UTF-8");
		
		String goPage = "list.do";	//이동할 페이지
		
		if(command.equals("/board/list.do")) {
			boardList(request);
			goPage = "/WEB-INF/views/board/list.jsp";
		}else if(command.equals("/board/form.do")) {
			goPage = "/WEB-INF/views/board/form.jsp";
		}else if(command.equals("/board/view.do")	) {//상세정보 요청
			boardView(request);
			goPage = "/WEB-INF/views/board/view.jsp";
		}else if(command.equals("/board/update.do")) {
			boardUpdateView(request);
			goPage = "/WEB-INF/views/board/update.jsp";
		}
		
		
		
		
		
		//어떤 형식으로 페이지 이동방식을 선택하여 이동할건지 결정!
		//forward로 요청
		RequestDispatcher rd = request.getRequestDispatcher(goPage);
		rd.forward(request, response);
		
	}

	private void boardUpdateView(HttpServletRequest request) {
		String bono = request.getParameter("bono");
		NoticeBoardVO board = service.selectBoard(Integer.parseInt(bono));
		request.setAttribute("boardVO", board);
	}

	private void boardView(HttpServletRequest request) {
		String bono = request.getParameter("bono");
		NoticeBoardVO board = service.selectBoard(Integer.parseInt(bono));
		request.setAttribute("boardVO", board);
		service.updateBoardHit(board);
	}

	private void boardList(HttpServletRequest request) {
		List<NoticeBoardVO> boardList = service.selectBoardList();
		request.setAttribute("boardList", boardList);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청 URI를 얻어온다
		String requestUri = request.getRequestURI();

		// ContextPath를 얻어온다.
		// ContextPath란 요청시 Root를 뜻한다.
		String contextPath = request.getContextPath();

		// ContextPath를 제외한 나머지 URI를 command라고 지칭한다.
		String command = requestUri.substring(contextPath.length());

		System.out.println(requestUri); 	// /BoardWebProject/board/list.do
		System.out.println(contextPath); 	// /boardWebProject
		System.out.println(command); 		// /Board/list.do

		request.setCharacterEncoding("UTF-8");

		String goPage = ""; // 이동할 페이지

		if (command.equals("/board/insert.do")) {
			// 게시글 등록 처리 이벤트
			int cnt = boardInsert(request);
			if(cnt>0) {	//등록 성공
				//페이지 이동방식 선택해야함 뭐로해야 좋을까?
				//페이지 이동방식 : 리다이렉트
				response.sendRedirect(contextPath+"/board/list.do");
			}else {	//등록 실패
				request.getRequestDispatcher("/WEB-INF/views/board/form.jsp")
					.forward(request, response);
			}
			
		}else if(command.equals("/board/update.do")) {
			String bono = request.getParameter("bo_no");
			int cnt = boardUpdate(request);
			if(cnt>0) {//수정성공
				response.sendRedirect(contextPath+"/board/view.do?bono="+bono);
				
			}else {
				request.getRequestDispatcher("/WEB-INF/views/board/update.jsp")
					.forward(request, response);
			}
		}else if(command.equals("/board/delete.do")) {
			String bono = request.getParameter("bo_no");
			int cnt = boardDelete(request);
			if(cnt>0) {
				response.sendRedirect(contextPath+"/board/list.do");
			}else {
				response.sendRedirect(contextPath+"/board/view.do?bono="+bono);
			}
		}
	}


	private int boardDelete(HttpServletRequest request) {
		String bono = request.getParameter("bono");
		return service.deleteBoard(Integer.parseInt(bono));
	}

	private int boardUpdate(HttpServletRequest request) {
		String no = request.getParameter("bo_no");
		String title = request.getParameter("bo_title");
		String content = request.getParameter("bo_content");
		
		NoticeBoardVO board = new NoticeBoardVO();
		board.setBo_no(Integer.parseInt(no));
		board.setBo_title(title);
		board.setBo_content(content);
		
		return service.updateBoard(board);
	}

	private int boardInsert(HttpServletRequest request) {
		String title = request.getParameter("bo_title");		//제목
		String content = request.getParameter("bo_content");	//내용
		
		NoticeBoardVO boardVO = new NoticeBoardVO();
		boardVO.setBo_title(title);
		boardVO.setBo_content(content);
		boardVO.setBo_writer("관리자");
		
		
		return service.insertBoard(boardVO);
	}
}
