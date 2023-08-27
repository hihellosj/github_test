package kr.or.ddit.reserveinsert.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.reserveinsert.service.IReserveInsertService;
import kr.or.ddit.reserveinsert.service.ReserveInsertServiceImpl;
import kr.or.ddit.reserveinsert.vo.ReserveInsertVO;


@WebServlet("/reserveInsert.do")
public class ReserveInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReserveInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		ReserveInsertVO vo = new ReserveInsertVO();
		/*
		 * vo.setUser_id("c001"); // 이 부분을 클라이언트에서 얻은 값을 사용하셔야 합니다.
		 */		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		IReserveInsertService service = ReserveInsertServiceImpl.getService();
		int res = service.insertReserve(vo);
		
		System.out.println("reserveinsert :" + res);
		request.setAttribute("result", res);
		request.getRequestDispatcher("/theaterview/result.jsp").forward(request, response);
	}
}
