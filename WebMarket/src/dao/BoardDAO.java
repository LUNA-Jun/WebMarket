package dao;

import java.sql.*;
import java.util.ArrayList;

import db.JdbcUtil;
import dto.BoardDTO;

public class BoardDAO {
	
	//DB접속시 필요한 맴버객체 선언
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private ArrayList<BoardDTO> dtos = null;
	private static BoardDAO instacne;
	
	public BoardDAO(){
		
	}
	
	//싱글톤 패턴으로 객체를 하나만 만들어서 리턴
	public static BoardDAO getInstance() {
		if(instacne == null) {
			instacne = new BoardDAO();
		}
		return instacne;
	}
	
	//board테이블 레코드 개수를 가져오는 메서드
	public int getListCount(String items, String text) {
		
		int count = 0;
		String sql = "";
		
		//파라메터로 넘어오는 검색기능이 둘다 없을시
		if(items == null && text == null) {
			sql = "select count(*) from board";
		} else {
			//파라메터로 넘어오는 값으로 검색기능을 하도록 함
			sql = "select count(*) from board where " + items + " like '%" + text + "%'";
		}
		
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
				}
			} catch (Exception e) {
				System.out.println("getListCount() 에러 : " + e.getMessage());
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch(Exception e2) {
					System.out.println("getListCount() close() 호출 에러 :" + e2.getMessage());
					e2.printStackTrace();
				}
			}
		return count;
	}
	
	//board테이블에 있는 레코드를 가져오는 메서드
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text){
		
		int total_record = getListCount(items, text);
		int start = (page - 1)*limit; //페이지는 0 페이지가 없으므로 -1로 함
		int index = start + 1;
		
		String sql = "";
		dtos = new ArrayList<BoardDTO>();
		
		//파라메터로 넘어오는 검색기능이 둘다 없을시
		if(items == null && text == null) {
			sql = "select * from board order by num desc";
		} else {
			//파라메터로 넘어오는 값으로 검색기능을 하도록 함
			sql = "select * from board where " + items + " like '%" + text + "%' order by num desc";
		}
		
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.absolute(index)) {
				BoardDTO bDto = new BoardDTO();
				bDto.setNum(rs.getInt("num"));
				bDto.setId(rs.getString("id"));
				bDto.setName(rs.getString("name"));
				bDto.setSubject(rs.getString("subject"));
				bDto.setContent(rs.getString("content"));
				bDto.setRegist_day(rs.getString("regist_day"));
				bDto.setHit(rs.getInt("hit"));
				bDto.setIp(rs.getString("ip"));
				
				dtos.add(bDto);
				
				//인덱스가 가져올 데이터 건수 보다 작으면 리스트에 다시 대입
				if(index < (start + limit) && index <= total_record) {
					index++;
				} else {
					break;
				}
			}
		}catch (Exception e) {
			System.out.println("getBoardList() 에러 : " + e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e2) {
				System.out.println("getBoardList() close() 호출 에러 :" + e2.getMessage());
				e2.printStackTrace();
			}
		}
		return dtos;
		
	}
	
	//member 테이블에서 인증된 id 사용자명 가져오기
	public String getLoginName(String id) {
		// TODO Auto-generated method stub
		String name = null;
		String sql = "select * from members where id = ?";
		
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				name = rs.getString("name");
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("getLoginName() 에러 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e2) {
				System.out.println("getLoginName() close() 호출 에러 :" + e2.getMessage());
				e2.printStackTrace();
			}
		}
		return name;
	}
	
	//board테이블에 새로운 글을 저장하는 부분
	public void insertBoard(BoardDTO bDto) {
		// TODO Auto-generated method stub
		
		String sql = "alter table board auto_increment = 1";
		
		try {
			//auto increment 부분을 다시 1로 재설정
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			
			sql = "insert into board values(?,?,?,?,?,?,?,?)";
			
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bDto.getNum());
			pstmt.setString(2, bDto.getId());
			pstmt.setString(3, bDto.getName());
			pstmt.setString(4, bDto.getSubject());
			pstmt.setString(5, bDto.getContent());
			pstmt.setString(6, bDto.getRegist_day());
			pstmt.setInt(7, bDto.getHit());
			pstmt.setString(8, bDto.getIp());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("insertBoard() 오류 : " + e.getMessage());
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("insertBoard() close() 호출 에러 :" + e2.getMessage());
				e2.printStackTrace();
			}
		}
	}

	//선택된 게시글 상세 내용 출력
	public BoardDTO getBoardByNum(int num, int page) {
		// TODO Auto-generated method stub
		
		BoardDTO bDto = null;
		String sql = "select * from board where num = ?";
		
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bDto = new BoardDTO();
				bDto.setNum(rs.getInt("num"));
				bDto.setId(rs.getString("id"));
				bDto.setName(rs.getString("name"));
				bDto.setSubject(rs.getString("subject"));
				bDto.setContent(rs.getString("content"));
				bDto.setRegist_day(rs.getString("regist_day"));
				bDto.setHit(rs.getInt("hit"));
				bDto.setIp(rs.getString("ip"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			
			System.out.println("getBoardByNum() 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getBoardByNum() close() 호출 에러 :" + e2.getMessage());
				e2.printStackTrace();
			}
		}
		//조회수 증가 호출
		updateHit(num);
		return bDto;
	}
	
	//조회수 증가
	public void updateHit(int num) {
		
		String sql = "select hit from board where num = ?";
		int hit = 0;
		
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				hit = rs.getInt("hit") + 1;
			}
			
			sql = "update board set hit = ? where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hit);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			
			System.out.println("updateHit() 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("updateHit() close() 호출 에러 :" + e2.getMessage());
				e2.printStackTrace();
			}
		}
	}
	
	//게시글 수정
	public void updateBoard(BoardDTO bDto) {
		
		String sql = "update board set subject = ?, content = ?, regist_day = ? where num = ?";
		
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bDto.getSubject());
			pstmt.setString(2, bDto.getContent());
			pstmt.setString(3, bDto.getRegist_day());
			pstmt.setInt(4, bDto.getNum());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			
			System.out.println("updateBoard() 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("updateBoard() close() 호출 에러 :" + e2.getMessage());
				e2.printStackTrace();
			}
		}
	}

	//선택된 게시글 삭제
	public void deleteBoard(int num) {
		// TODO Auto-generated method stub
		
		String sql = "delete from board where num = ?";
		
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("deleteBoard() 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("deleteBoard() close() 호출 에러 :" + e2.getMessage());
				e2.printStackTrace();
			}
		}
	}
}
