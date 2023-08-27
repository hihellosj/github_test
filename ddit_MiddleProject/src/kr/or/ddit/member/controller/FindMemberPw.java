package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.or.ddit.member.service.ImemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;


@WebServlet("/findMemberPw.do")
public class FindMemberPw extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 파라미터로 넘어 온 이름와 전화번호를 구한다.
		String sId = request.getParameter("user_id");
		String sPhone = request.getParameter("user_phone");
		System.out.println("넘어온 아이디 "+ sId);
		System.out.println("넘어온 전화번호 "+ sPhone);
		
		
		ImemberService service = MemberServiceImpl.getInstance();
		
		MemberVO memVo = new MemberVO();
		memVo.setUser_id(sId);
		memVo.setUser_phone(sPhone);
		
		String memberPw = service.findMemberPw(memVo);
		System.out.println(memberPw);
		
		HttpSession session = request.getSession();

		if (memberPw != null) {		// 회원비밀번호 찾기 성공
			session.setAttribute("findPw", memberPw);
			response.sendRedirect(request.getContextPath()+"/view/member/showResultPw.jsp");
			System.out.println("왔나요?"+session.getAttribute("findPw"));
		} else {		// 회원비밀번호 찾기 실패
			request.setAttribute("error", "1");
	        request.getRequestDispatcher("/view/member/findPw.jsp").forward(request, response);
	        System.out.println("엘스 왔나여");
		}
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
