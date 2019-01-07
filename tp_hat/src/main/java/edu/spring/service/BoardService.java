package edu.spring.service;

import java.util.List;

import edu.spring.domain.Board;

public interface BoardService {
	int insertBoard(Board board);
	int deleteBoard(int bno);
	int updateBoard(Board board);
	List<Board> selectAllBoard();
	List<Board> selectBoardByCategory(int category);
	Board selectOneBoard(int bno);
}
