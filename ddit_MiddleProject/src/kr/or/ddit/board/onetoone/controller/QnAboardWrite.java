package kr.or.ddit.board.onetoone.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.onetoone.service.IQnAboardService;
import kr.or.ddit.board.onetoone.service.QnAboardServiceImpl;
import kr.or.ddit.board.onetoone.vo.QnAboardVO;


@WebServlet("/QnAboardWrite.do")
@MultipartConfig
public class QnAboardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/qnaboardmvc/qnaForm.jsp")
		.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		String uploadPath = "d:/d_other/qnaFiles";
		
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		
		QnAboardVO vo = new QnAboardVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();	
		}
		
		Part part = request.getPart("cs_photo");
		if(part!=null) {
			String fileName = extractFilename(part);
			
			if(!"".equals(fileName)) {
				try {
					String extension = fileName.substring(fileName.lastIndexOf("."), fileName.length());
					String saveFileName = UUID.randomUUID().toString() + extension;
					part.write(uploadPath + File.separator + saveFileName);
					vo.setCs_photo(fileName);
					vo.setCs_save_photo(saveFileName);
				} catch (Exception e) {
					vo.setCs_photo(null);
					vo.setCs_save_photo(null);
				}
			}
		}
		
		
		IQnAboardService service = QnAboardServiceImpl.getService();
		
		int res = service.insertBoard(vo);
		System.out.println("인서트 함?"+res);
		
		/*
		 * request.setAttribute("result", res);
		 * 
		 * request.getRequestDispatcher("/qnaboardview/result.jsp").forward(request,
		 * response);
		 */
		
		response.sendRedirect(request.getContextPath()+"/QuestionList.do?user_id="+vo.getUser_id());
		
		
		
		
	}


	private String extractFilename(Part part) {
	String fileName = "";
		
		String contentDisposition = part.getHeader("content-disposition");
		String[] items = contentDisposition.split(";");
		for(String item : items) {
			if(item.trim().startsWith("filename")) {  
				// filename="test1.txt"
				fileName = item.substring(item.indexOf("=")+2, item.length()-1);
			}
		}
		
		return fileName;
	}

}
