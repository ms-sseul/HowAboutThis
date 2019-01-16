package edu.spring.persistence;

import java.util.List;

import edu.spring.domain.Board;
import edu.spring.util.Criteria;

public interface BoardDao {
	int createBoard(Board board);
	int deleteBoard(int bno);
	int updateBoard(Board board);
	List<Board> readAllBoard(Criteria criteria);
	int countBoard(Criteria criteria);
	Board readBoard(int bno);
	int updateBoardReadCnt(int bno);
	int updateBoardReplyCnt(int bno, int increment);
	List<Board> searchByKeyword(int searchType, String keyword);
}
