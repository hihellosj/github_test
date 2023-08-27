package kr.or.ddit.theater.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.theater.service.ITheaterService;
import kr.or.ddit.theater.service.TheaterServiceImpl;
import kr.or.ddit.theater.vo.TheaterVO;


@WebServlet("/theaterDetail.do")
public class TheaterDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public TheaterDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tno = request.getParameter("no1");
		
		ITheaterService service = TheaterServiceImpl.getService();
		
		TheaterVO vo = service.TheaterDetail(tno);
		
		request.setAttribute("theaterDetail", vo);
		
		request.getRequestDispatcher("/theaterview/theaterDetail.jsp").forward(request, response);
		
	
	}


}
