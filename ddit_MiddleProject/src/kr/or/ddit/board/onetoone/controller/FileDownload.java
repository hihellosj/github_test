package kr.or.ddit.board.onetoone.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.onetoone.service.IQnAboardService;
import kr.or.ddit.board.onetoone.service.QnAboardServiceImpl;
import kr.or.ddit.board.onetoone.vo.QnAboardVO;
//다시 테스트
/**
 * Servlet implementation class FileDownload
 */
@WebServlet("/FileDownload.do")
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		//파라미터로 넘어온 파일번호를 구한다.
		String strCsNo = request.getParameter("cs_no");
		int csNo = Integer.parseInt(strCsNo);
		
		//파일 번호를 이용하여 DB에서 해당 파일 정보를 가져온다.
		IQnAboardService service = QnAboardServiceImpl.getService();
		QnAboardVO vo = service.getBoard(csNo);
		
		//업로드된 파일들이 저장될 폴더 설정
		String uploadPath = "d:/d_other/qnaFiles";
		// 저장될 폴더가 없으면 새로 만들어 놓는다.
		File f = new File(uploadPath);
		if(!f.exists()) {
			f.mkdirs();
		}
		response.setCharacterEncoding("utf-8");
		
		//다운 받은 파일의 File객체 생성 ==> 실제 저장된 파일명을 지정한다.
		File downFile = new File(f, vo.getCs_save_photo());
		
		if(downFile.exists()) { //해당파일이 있으면...
			//Content Type 설정
			response.setContentType("application/octet-stream; charset=utf-8");
			
			//Response객체에 content-disposition 해더를 설정한다.
			String headerKey = "content-disposition";
			
			//헤더의 value값으로는 다운로드 할 때 클라이언트에 저장될 파일 이름을 지정하는 곳으로
			// 원래의 파일명으로 지정한다.
			//String headerValue = "attachment; filename=\"" + fvo.getOrigin_file_name() + "\"";
			String headerValue = "attachment;" 
					+ getEncodedFileName(request, vo.getCs_photo()) ;
			
			response.setHeader(headerKey, headerValue);
			
			BufferedInputStream bin = null;
			BufferedOutputStream bout = null;
			
			try {
				bout = new BufferedOutputStream(response.getOutputStream());
				
				//파일 입력용 스트림객체 생성
				bin = new BufferedInputStream(new FileInputStream(downFile));
				
				byte[] temp = new byte[1024];
				int len = 0 ;
				while((len = bin.read(temp))>0) {
					bout.write(temp, 0, len);
				}
				bout.flush();
			} catch (Exception e) {
				System.out.println("입출력 오류 : " + e.getMessage());
			}finally {
				if(bout!=null) try {bout.close();} catch (IOException e) {	}
				if(bin!=null) try {	bin.close();} catch (IOException e) {  }
				
				
			}
			
			
			
		}else {  //해당 파일이 없으면...
			response.setContentType("text/html; charset=utf-8");
			
			
			response.getWriter().println("<h3>" + vo.getCs_photo() + "파일이 존재하지 않습니다");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String getEncodedFileName(HttpServletRequest request, String filename) {
		String encodedFilename = "";  //반환값이 저장될 변수
		
		String userAgent = request.getHeader("user-agent");
		try {
			//MSIE10버전 이하의 웹브라우저
			if(userAgent.contains("MSIE")||userAgent.contains("Trident")) {
				encodedFilename="filename=\"" + URLEncoder.encode(filename,"utf-8")
					.replace("\\+", "\\ ") + "\"";
				
			}else {  //기타 다른 웹브라우저
				encodedFilename = "filename*=UTF-8''"
						+ URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "%20");
			}
			
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("지원하지 않는 인코딩 방식입니다...");
		}
		
		return encodedFilename;
	}

}
