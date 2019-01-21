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
import edu.spring.util.Criteria;

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
	public List<Board> readAllBoard(Criteria criteria) {
		logger.info("readAllboard() call"); 
		return session.selectList(BOARD_MAPPER + ".selectAllBoard", criteria);
	}
	
	@Override
	public int countBoard(Criteria criteria) {
		logger.info("countBoard() 호출");
		return session.selectOne(BOARD_MAPPER + ".countBoard", criteria);
	}

	@Override
	public Board readBoard(int bno) {
		logger.info("readBoard() call"); 
		return session.selectOne(BOARD_MAPPER + ".selectOneBoard", bno);
	}

	@Override
	public int updateBoardReadCnt(int bno) {
		logger.info("updateBoardReadCnt() call");
		
		return session.update(BOARD_MAPPER + ".updateBoardReadCnt" , bno);
	}

	@Override
	public int updateBoardReplyCnt(int bno, int increment) {
		logger.info("updateBoardReplyCnt() call");
		
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("bno", bno);
		params.put("increment", increment);
		return session.update(BOARD_MAPPER + ".updateBoardReplyCnt", params);
	}

	@Override
	public List<Board> searchByKeyword(int searchType, String keyword, Criteria criteria) {
		logger.info("searchByKeyword() call");
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchType", searchType);
		params.put("keyword", "%" + keyword + "%");
		params.put("pageStart", criteria.getPageStart());
		params.put("perPageNum",criteria.getPerPageNum());
		return session.selectList(BOARD_MAPPER + ".searchByKeyword" , params);
	}
	
	@Override
	public int countSelectedBoard(int searchType, String keyword, Criteria criteria) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("searchType", searchType);
		params.put("keyword", "%" + keyword + "%");
		params.put("criteria", criteria);
		return session.selectOne(BOARD_MAPPER+ ".searchByKeywordCount", params);
	}

	@Override
	public int updateDecrementReadCnt(int bno) {
		return session.update(BOARD_MAPPER+".updateDecrementReadCnt");
	}
	
	
}
