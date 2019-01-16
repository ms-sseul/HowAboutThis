package edu.spring.service;

import java.util.List;

import edu.spring.domain.Board;

public interface BoardService {
	int insertBoard(Board board);
	int deleteBoard(int bno);
	int updateBoard(Board board);
	List<Board> selectAllBoard();
	Board selectOneBoard(int bno);
}
