package edu.spring.persistence;

import java.util.List;

import edu.spring.domain.Board;

public interface BoardDao {
	int createBoard(Board board);
	int deleteBoard(int bno);
	int updateBoard(Board board);
	List<Board> readAllBoard();
	Board readBoard(int bno);
	List<Board> readBoardByCategory(int category);
	int updateBoardReadCnt(int bno);
	int updateBoardReplyCnt(int bno, int increment);
	List<Board> searchByKeyword(int searchType, String keyword);
}
