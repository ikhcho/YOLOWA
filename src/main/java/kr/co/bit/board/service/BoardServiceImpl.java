package kr.co.bit.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.board.dao.BoardDAO;
import kr.co.bit.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	public List<BoardVO> selectAllBoard() {
		List<BoardVO> list = dao.selectAllBoard();
		return list;
	}

	public BoardVO selectByNoBoard(int no) {
		BoardVO board = dao.selectByNoBoard(no);
		return board;
	}

	public void insertBoard(BoardVO board) {

		dao.insertBoard(board);
	}
	
	public void deleteBoard(BoardVO board) {

		dao.deleteBoard(board);
	}

	public void updateBoard(BoardVO board) {

		dao.updateBoard(board);
	}
	
}
