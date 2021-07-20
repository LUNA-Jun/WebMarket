package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.BoardDTO;

public class BoardListCommand implements BoardCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BoardDAO bdao = BoardDAO.getInstance();
		ArrayList<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
		int pageNum = 1;
		int limit = 5; //한페이지에 나타낼 게시글 수
		
		//페이지 값이 null아니라면 해당 페이지를 숫자로 변환하여 저장
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		//DB 저장되어 있는 게시글 총 갯수를 가져옴
		int total_record = bdao.getListCount(items, text);
		//DB에 저장되어 있는 실제 게시글을 가져옴
		boardlist = bdao.getBoardList(pageNum, limit, items, text);
		
		int total_page = 0;
		
		//총 페이지 수를 구함
		if(total_record % limit ==0) {
			total_page = total_record / limit;
			Math.floor(total_page);
		} else {
			total_page = total_record / limit;
			Math.floor(total_page);
			total_page += 1;
		}
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("boardlist", boardlist);
	}
}
