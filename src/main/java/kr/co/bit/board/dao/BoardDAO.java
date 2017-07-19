package kr.co.bit.board.dao;



import java.util.List;



import kr.co.bit.board.vo.BoardVO;



public interface BoardDAO {



	List<BoardVO> selectAllBoard();

	BoardVO selectByNoBoard(int no);

	void insertBoard(BoardVO board);

	void deleteBoard(BoardVO board);

	void updateBoard(BoardVO board);

}