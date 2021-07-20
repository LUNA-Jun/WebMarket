package command;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.BoardDTO;

public class BoardWriteCommand implements BoardCommand{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BoardDAO bDao = BoardDAO.getInstance();
		
		BoardDTO bDto = new BoardDTO();
		bDto.setId(request.getParameter("id"));
		bDto.setName(request.getParameter("name"));
		bDto.setSubject(request.getParameter("subject"));
		bDto.setContent(request.getParameter("content"));
		
		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = sFormat.format(new Date());
		bDto.setRegist_day(regist_day);
		bDto.setHit(0);
		bDto.setIp(request.getRemoteAddr());
		
		bDao.insertBoard(bDto);
		
	}
}
