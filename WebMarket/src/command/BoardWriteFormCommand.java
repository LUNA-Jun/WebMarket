package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;

public class BoardWriteFormCommand implements BoardCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BoardDAO bDao = BoardDAO.getInstance();
		String id = request.getParameter("id");
		
		String name = bDao.getLoginName(id);
		request.setAttribute("name", name);
	}
}
