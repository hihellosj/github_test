package kr.or.ddit.rseat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import jdk.nashorn.internal.parser.JSONParser;
import kr.or.ddit.rseat.service.IReserveService;
import kr.or.ddit.rseat.service.ReserveServiceImpl;
import kr.or.ddit.rseat.vo.ReserveVO;


@WebServlet("/reservedSeat.do")
public class ReservedSeat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReservedSeat() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String m_id = request.getParameter("movie_id");
		String t_id = request.getParameter("theater_id");
		String showtime = request.getParameter("showtime");
			
		ReserveVO reserVO = new ReserveVO();
		reserVO.setMOVIE_ID(m_id);
		reserVO.setTHEATER_ID(t_id);
		reserVO.setSHOWTIME(showtime);
		
		IReserveService service = ReserveServiceImpl.getService();
		List<ReserveVO> list = service.selectAll(reserVO);
	
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		
		Gson gson = new Gson();
		pw.println(gson.toJson(list));
		pw.flush();
	}

}
