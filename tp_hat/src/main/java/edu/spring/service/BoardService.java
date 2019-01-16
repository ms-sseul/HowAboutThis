package edu.spring.service;

import java.util.List;

import edu.spring.domain.Board;
import edu.spring.util.Criteria;

public interface BoardService {
	int insertBoard(Board board);
	int deleteBoard(int bno);
	int updateBoard(Board board);
	List<Board> selectAllBoard(Criteria criteria);
	int countBoard(Criteria criteria);
	Board selectOneBoard(int bno);
}
