


package kr.co.bit.board.dao;



import java.util.List;




import kr.co.bit.board.vo.QBoardVO;



public interface QBoardDAO {



	List<QBoardVO> selectAllBoard();

	QBoardVO selectByNoBoard(int no);

	void insertBoard(QBoardVO board);

	void deleteBoard(QBoardVO board);

	void updateBoard(QBoardVO board);

}