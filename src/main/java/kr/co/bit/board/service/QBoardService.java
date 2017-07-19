package kr.co.bit.board.service;



import java.util.List;




import kr.co.bit.board.vo.QBoardVO;



public interface QBoardService {



	List<QBoardVO> selectAllBoard();

	QBoardVO selectByNoBoard(int no);

	void insertBoard(QBoardVO board);

	void deleteBoard(QBoardVO board);

	void updateBoard(QBoardVO board);

}