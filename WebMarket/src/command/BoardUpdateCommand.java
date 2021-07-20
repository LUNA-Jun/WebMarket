package command;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.BoardDTO;

public class BoardUpdateCommand implements BoardCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		BoardDTO bDto = new BoardDTO();
		bDto.setNum(num);
		bDto.setSubject(request.getParameter("subject"));
		bDto.setContent(request.getParameter("content"));
		
		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = sFormat.format(new Date());
		
		bDto.setRegist_day(regist_day);
		bDto.setIp(request.getRemoteAddr());
		
		bDao.updateBoard(bDto);
		
	}
}
