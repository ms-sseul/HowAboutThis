package edu.spring.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.domain.Board;

@Repository
public class BoardDaoImple implements BoardDao {
	private final Logger logger = LoggerFactory.getLogger(BoardDaoImple.class);

	private static final String BOARD_MAPPER = "edu.spring.BoardMapper";
	
	// DI(의존성 주입)
	@Autowired private SqlSession session;
	
	@Override
	public int createBoard(Board board) {
		logger.info("createBoard() call"); 
		return session.insert(BOARD_MAPPER + ".insertBoard" , board);
	}

	@Override
	public int deleteBoard(int bno) {
		logger.info("deleteBoard() call"); 
		return session.delete(BOARD_MAPPER + ".deleteBoard", bno);
	}

	@Override
	public int updateBoard(Board board) {
		logger.info("updateBoard() call"); 
		return session.update(BOARD_MAPPER + ".updateBoard", board);
	}

	@Override
	public List<Board> readAllBoard() {
		logger.info("readAllboard() call"); 
		return session.selectList(BOARD_MAPPER + ".selectAllBoard");
	}

	@Override
	public Board readBoard(int bno) {
		logger.info("readBoard() call"); 
		return session.selectOne(BOARD_MAPPER + ".selectOneBoard", bno);
	}

	@Override
	public List<Board> readBoardByCategory(int category) {
		logger.info("readBoardByCategory() call"); 
		Map<String, Object> params = new HashMap<>();
		params.put("category", category);
		return session.selectList(BOARD_MAPPER + ".selectBoardByCategory", params);
	}

}
