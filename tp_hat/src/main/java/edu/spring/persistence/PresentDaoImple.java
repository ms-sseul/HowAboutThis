package edu.spring.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.domain.Present;

@Repository
public class PresentDaoImple implements PresentDao {

	private static final Logger logger = LoggerFactory.getLogger(PresentDaoImple.class);
	private static final String PRESENT_MAPPER = "edu.spring.PresentMapper";
	
	@Autowired private SqlSession session;
	
	@Override
	public int createPresent(List<Present> presents) {
		logger.info("createPresent() call");
		int result = 0;
		for(Present p : presents) {
			result += session.insert(PRESENT_MAPPER + ".insert", p);
		}
		if(result == presents.size()) {
			return 1;
		} else {
			return 0;			
		}
	}

	@Override
	public int updatePresent(Present present) {
		logger.info("updatePresent() call");
		return session.update(PRESENT_MAPPER + ".update", present);
	}

	@Override
	public int deletePresent(int pno) {
		logger.info("deletePresent() call");
		return session.delete(PRESENT_MAPPER +".delete", pno);
	}

	@Override
	public List<Present> selectPresent(int pno) {
		logger.info("selectPresent() call");

		return session.selectList(PRESENT_MAPPER + ".select", pno);
	}

}
