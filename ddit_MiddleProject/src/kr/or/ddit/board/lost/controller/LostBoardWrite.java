package kr.or.ddit.board.lost.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.lost.service.ILostBoardService;
import kr.or.ddit.board.lost.service.LostBoardServiceImpl;
import kr.or.ddit.board.lost.vo.LostBoardVO;




@WebServlet("/lostboardWrite.do")
public class LostBoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		// 정보받기
		String userid = request.getParameter("user_id");		// 아이디
		String title = request.getParameter("losttitle");		// 제목
		String content = request.getParameter("lostcont");		// 내용
				
	     // 빈칸으로 제출한 경우 처리
        if (userid == null || title == null || content == null || userid.isEmpty() || title.isEmpty() || content.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/view/lostBoard/lostBoardForm.jsp"); // 빈칸으로 제출한 경우 다시 작성폼으로 이동
            return;
        }
		
		
		// 정보VO저장
		LostBoardVO vo = new LostBoardVO();
		vo.setUser_id(userid);
		vo.setLb_title(title);
		vo.setLb_content(content);
		
		ILostBoardService service = LostBoardServiceImpl.getInstance();
		
		int res = service.insertLostboard(vo);
		
		if(res>0) {	//글쓰기 성공
			response.sendRedirect(request.getContextPath() + "/view/main/index.jsp");
		}else {
			//  글쓰기실패...
			response.getWriter().println("<script>history.go(-1)</script>");
		}
		
	}

}
