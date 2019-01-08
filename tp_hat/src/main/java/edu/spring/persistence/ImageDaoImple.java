package edu.spring.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.domain.Image;

@Repository
public class ImageDaoImple implements ImageDao {

	private final Logger logger = LoggerFactory.getLogger(ImageDaoImple.class);
	
	private static final String IMAGE_MAPPER = "edu.spring.ImageMapper";
	
	@Autowired private SqlSession session;
	
	@Override
	public int createImage(Image image) {
		logger.info("createImage() call");
		return session.insert(IMAGE_MAPPER + ".insert", image);
	}

	@Override
	public int updateImage(Image image) {
		logger.info("updateImage() call");
		return session.update(IMAGE_MAPPER + ".update", image);
	}

	@Override
	public int deleteImage(int ino) {
		logger.info("deleteImage() call");
		return session.delete(IMAGE_MAPPER + ".delete", ino);
	}

	@Override
	public List<Image> selectImage(int pno) {
		logger.info("selectImage() call");
		return session.selectList(IMAGE_MAPPER + ".selectAll", pno);
	}

	@Override
	public Image selectOneImage(int pno) {
		return session.selectOne(IMAGE_MAPPER + ".selectOneImage", pno);
	}

}
