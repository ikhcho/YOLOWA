package kr.co.bit.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.board.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<BoardVO> selectAllBoard() {
		
		List<BoardVO> list 
			= sqlSessionTemplate.selectList("board.selectAllBoard");
		
		return list;
	}

	public BoardVO selectByNoBoard(int no) {
		
		BoardVO board 
			= sqlSessionTemplate.selectOne("board.selectOneByNo", no);
		
		return board;
	}

	public void insertBoard(BoardVO board) {

		sqlSessionTemplate.insert("board.insertBoard", board);
		
	}
	
	public void deleteBoard(BoardVO board){
		sqlSessionTemplate.delete("board.deleteBoard", board);
	}
	
	public void updateBoard(BoardVO board) {

		sqlSessionTemplate.update("board.updateBoard", board);
		
	}
	


}
