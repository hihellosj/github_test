package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.member.service.ImemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

@WebServlet("/memberDelete.do")
public class MemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("user_id");
		
		ImemberService service = MemberServiceImpl.getInstance();
		int cnt = service.deleteMember(userId);
		
		Gson gson = new Gson();
		String result = null;  // 결과가 JSON으로 저장될 변수
		
		if(cnt>0) {  // 삭제완료
			result = gson.toJson("OK");
		} else {		// 삭제놉
			result = gson.toJson("Fail");
		}
	
		
		// 세션에서 로그인 정보를 삭제
		HttpSession session = request.getSession();
        session.removeAttribute("loginMember");
    	
		response.getWriter().write(result);
		response.flushBuffer();
		
		/*
		// 세션에서 로그인 정보를 삭제
        HttpSession session = request.getSession();
        session.removeAttribute("loginMember");
		
		response.sendRedirect(request.getContextPath() + "/view/member/index.jsp");
		*/
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
