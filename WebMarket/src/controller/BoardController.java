package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.BoardCommand;
import command.BoardDeleteCommand;
import command.BoardListCommand;
import command.BoardUpdateCommand;
import command.BoardViewCommand;
import command.BoardWriteCommand;
import command.BoardWriteFormCommand;

/**
 * Servlet implementation class BoardController
 */
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("actionDo");
		
		BoardCommand bcom = null;
		String viewpage = null;
		
		//요청된 전체 uri를 가져옴
		String uri = request.getRequestURI();
		System.out.println("URI : " + uri);
		
		//프로젝트명 리턴
		String contextPath = request.getContextPath();
		System.out.println("contextPath : " + contextPath);
		
		//직접 실행되어야할 파일의 이름을 얻음
		String command = uri.substring(contextPath.length());
		System.out.println("command : " + command);
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//command 패턴에 따라서 분기를 하는 코드
		if(command.equals("/BoardListAction.do")) {
			System.out.println("----------------------------");
			System.out.println("/BoardListAction.do 페이지 호출");
			System.out.println("----------------------------");
			bcom = new BoardListCommand();
			bcom.execute(request, response);
			System.out.println("/BoardListAction.do 실행완료");
			viewpage = "index.jsp?contentPage=/board/list.jsp"; 
		}else if(command.equals("/BoardWriteForm.do")) {
			System.out.println("----------------------------");
			System.out.println("/BoardWriteForm.do 페이지 호출");
			System.out.println("----------------------------");
			bcom = new BoardWriteFormCommand();
			bcom.execute(request, response);
			System.out.println("/BoardWriteForm.do 실행완료");
			viewpage = "index.jsp?contentPage=/board/writeForm.jsp";
		}else if(command.equals("/BoardWriteAction.do")) {
			System.out.println("----------------------------");
			System.out.println("/BoardWriteAction.do 페이지 호출");
			System.out.println("----------------------------");
			bcom = new BoardWriteCommand();
			bcom.execute(request, response);
			System.out.println("/BoardWriteForm.do 실행완료");
			viewpage = "/BoardListAction.do";
		}else if(command.equals("/BoardViewAction.do")) {
			System.out.println("----------------------------");
			System.out.println("/BoardViewAction.do 페이지 호출");
			System.out.println("----------------------------");
			bcom = new BoardViewCommand();
			bcom.execute(request, response);
			System.out.println("/BoardViewAction.do 실행완료");
			viewpage = "index.jsp?contentPage=/board/view.jsp";
		}else if(command.equals("/BoardUpdateAction.do")) {
			System.out.println("----------------------------");
			System.out.println("/BoardUpdateAction.do 페이지 호출");
			System.out.println("----------------------------");
			bcom = new BoardUpdateCommand();
			bcom.execute(request, response);
			System.out.println("/BoardUpdateAction.do 실행완료");
			viewpage = "/BoardListAction.do";
		}else if(command.equals("/BoardDeleteAction.do")) {
			System.out.println("----------------------------");
			System.out.println("/BoardDeleteAction.do 페이지 호출");
			System.out.println("----------------------------");
			bcom = new BoardDeleteCommand();
			bcom.execute(request, response);
			System.out.println("/BoardDeleteAction.do 실행완료");
			viewpage = "/BoardListAction.do";
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher(viewpage);
		rd.forward(request, response);
	}

}
