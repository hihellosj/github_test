package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.ImemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/memberUpdate.do")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원ID에 맞는 회원 정보를 검색해서 회원 정보 수정폼에 보낸다.
		request.setCharacterEncoding("utf-8");
				
		String userId = request.getParameter("user_id");
				
		ImemberService service = MemberServiceImpl.getInstance();
		MemberVO memVo = service.getMember(userId);
				
		request.setAttribute("memberVo", memVo);
		request.getRequestDispatcher("/view/mypage/memberUpdate.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("user_id");
		String userPw = request.getParameter("user_pass");
		String userName = request.getParameter("user_name");
		String userPhone = request.getParameter("user_phone");
		String userMail = request.getParameter("user_mail");
		
		if (userPw == null || userPw=="") {
			userPw = request.getParameter("user_pw");
		}
		
		MemberVO memVo = new MemberVO();
		memVo.setUser_id(userId);
		memVo.setUser_pw(userPw);
		memVo.setUser_name(userName);
		memVo.setUser_phone(userPhone);
		memVo.setUser_mail(userMail);
		System.out.println("memVo 저장되써여-----------"+memVo);
	
		
		ImemberService service = MemberServiceImpl.getInstance();
		service.updateMember(memVo);
		
		response.sendRedirect(request.getContextPath()+"/view/mypage/memberUpdate.jsp");		
		
	}

}
