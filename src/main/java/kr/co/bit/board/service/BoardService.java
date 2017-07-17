package kr.co.bit.board.service;

import java.util.List;

import kr.co.bit.board.vo.BoardVO;

public interface BoardService {

	List<BoardVO> selectAllBoard();
	BoardVO selectByNoBoard(int no);
	void insertBoard(BoardVO board);
	void deleteBoard(BoardVO board);
	void updateBoard(BoardVO board);
}
